(function () {
    appModule.controller('app.manager.common.chat.chatbar', [
        '$rootScope', '$scope', 'infrastructure.services.app.commonLookup', 'infrastructure.services.app.chat', 'infrastructure.services.app.friendship',
        function ($rootScope, $scope, appSession, commonLookup, chatService, friendshipService) {
            var vm = this;
            vm.consts = {
                appPath: infrastructure.appPath,
                friendshipState: app.consts.friendshipState
            };
            vm.chat = {
                friends: [],
                tenantToTenantChatAllowed: infrastructure.features.isEnabled('App.ChatFeature.TenantToTenant'),
                tenantToHostChatAllowed: infrastructure.features.isEnabled('App.ChatFeature.TenantToHost'),
                interTenantChatAllowed: infrastructure.features.isEnabled('App.ChatFeature.TenantToTenant')
                    || infrastructure.features.isEnabled('App.ChatFeature.TenantToHost') || !appSession.tenant,
                serverClientTimeDifference: 0,
                selectedUser: null,
                currentUser: appSession.user,
                isOpen: false,
                pinned: false,
                message: '',
                sendingMessage: false,
                user: {
                    loadingPreviousUserMessages: false,
                    userNameFilter: '',
                    getShownUserName: function (tenanycName, userName) {
                        return (tenanycName ? tenanycName : '.') + '\\' + userName;
                    },
                    block: function (user) {
                        friendshipService.blockUser({
                            userId: user.friendUserId,
                            tenantId: user.friendTenantId
                        }).then(function () {
                            infrastructure.notify.info(app.localize('UserBlocked'));
                        });
                    },
                    unblock: function (user) {
                        friendshipService.unblockUser({
                            userId: user.friendUserId,
                            tenantId: user.friendTenantId
                        }).then(function () {
                            infrastructure.notify.info(app.localize('UserUnblocked'));
                        });
                    },
                    markAllUnreadMessagesOfUserAsRead: function (user) {

                        if (!user || !vm.chat.isOpen) {
                            return;
                        }
                        var unreadMessages = _.where(user.messages, { readState: app.chat.readState.unread });
                        var unreadMessageIds = _.pluck(unreadMessages, 'id');

                        if (!unreadMessageIds.length) {
                            return;
                        }
                        chatService.markAllUnreadMessagesOfUserAsRead({
                            tenantId: user.friendTenantId,
                            userId: user.friendUserId
                        }).then(function () {
                            angular.forEach(user.messages,
                                function (message) {

                                    if (unreadMessageIds.indexOf(message.id) >= 0) {
                                        message.readState = app.chat.readState.read;
                                    }
                                });
                        });
                    },
                    loadMessages: function (user, callback) {
                        vm.chat.user.loadingPreviousUserMessages = true;

                        var minMessageId = null;

                        if (user.messages && user.messages.length) {
                            minMessageId = _.min(user.messages, function (message) { return message.id; }).id;
                        }
                        chatService.getUserChatMessages({
                            minMessageId: minMessageId,
                            tenantId: user.friendTenantId,
                            userId: user.friendUserId
                        }).then(function (result) {

                            if (!user.messages) {
                                user.messages = [];
                            }
                            user.messages = result.data.items.concat(user.messages);
                            vm.chat.user.markAllUnreadMessagesOfUserAsRead(user);

                            if (!result.data.items.length) {
                                user.allPreviousMessagesLoaded = true;
                            }
                            vm.chat.user.loadingPreviousUserMessages = false;

                            if (callback) {
                                callback();
                            }
                        });
                    },
                    openSearchModal: function (tenantId, userName) {
                        lookupModal.open({
                            title: app.localize('SelectAUser'),
                            serviceMethod: commonLookup.findUsers,
                            filterText: userName,
                            extraFilters: {
                                tenantId: tenantId
                            },
                            callback: function (selectedItem) {
                                var userId = selectedItem.value;
                                friendshipService.createFriendshipRequest({
                                    userId: userId,
                                    tenantId: appSession.tenant !== null ? appSession.tenant.id : null
                                }).then(function () {
                                    vm.chat.user.userNameFilter = '';
                                });
                            }
                        });
                    },
                    search: function () {
                        var tenancyName = '';
                        var userName = '';

                        if (vm.chat.user.userNameFilter.indexOf('\\') === -1) {
                            userName = vm.chat.user.userNameFilter;
                        }
                        else {
                            var tenancyAndUserNames = vm.chat.user.userNameFilter.split('\\');
                            tenancyName = tenancyAndUserNames[0];
                            userName = tenancyAndUserNames[1];
                        }

                        if (!tenancyName || !vm.chat.interTenantChatAllowed) {
                            vm.chat.user.openSearchModal(appSession.tenant ? appSession.tenant.id : null, userName);
                        }
                        else {
                            friendshipService.createFriendshipRequestByUserName({
                                tenancyName: tenancyName,
                                userName: userName
                            }).then(function () {
                                vm.chat.user.userNameFilter = '';
                            });
                        }
                    }
                },
                getFriendOrNull: function (userId, tenantId) {
                    var friend = _.where(vm.chat.friends, { friendUserId: userId, friendTenantId: tenantId });

                    if (friend.length) {
                        return friend[0];
                    }
                    return null;
                },
                getFilteredFriends: function (state, userNameFilter) {
                    return _.filter(vm.chat.friends, function (friend) {
                        return friend.state === state &&
                                vm.chat.user.getShownUserName(friend.friendTenancyName, friend.friendUserName)
                                    .toLocaleLowerCase()
                                    .indexOf(userNameFilter.toLocaleLowerCase()) >= 0;
                    });
                },
                getUserNameByChatSide: function (chatSide) {
                    return chatSide === app.chat.side.sender ?
                       vm.chat.currentUser.userName :
                       vm.chat.selectedUser.friendUserName;
                },
                getFixedMessageTime: function (messageTime) {
                    return moment(messageTime).add(-1 * vm.chat.serverClientTimeDifference, 'seconds').format('YYYY-MM-DDTHH:mm:ssZ');
                },
                getFriendsAndSettings: function (callback) {
                    chatService.getUserChatFriendsWithSettings().then(function (result) {
                        vm.chat.friends = result.data.friends;
                        vm.chat.serverClientTimeDifference = app.calculateTimeDifference(infrastructure.clock.now(), result.serverTime, 'seconds');

                        vm.chat.triggerUnreadMessageCountChangeEvent();
                        callback();
                    });
                },
                scrollToBottom: function () {
                    $timeout(function () {
                        var $scrollArea = $('.page-quick-sidebar-chat-user-messages');
                        var scrollToVal = $scrollArea.prop('scrollHeight') + 'px';
                        $scrollArea.slimScroll({ scrollTo: scrollToVal });
                    }, 100);
                },
                loadLastState: function () {
                    app.localStorage.getItem('app.chat.isOpen', function (isOpen) {
                        vm.chat.isOpen = isOpen;

                        if (isOpen) {
                            $('body').addClass('page-quick-sidebar-open').promise().done(function () {
                                app.localStorage.getItem('app.chat.selectedUser', function (selectedUser) {

                                    if (selectedUser) {
                                        $('.page-quick-sidebar-chat').addClass('page-quick-sidebar-content-item-shown');
                                        vm.chat.selectFriend(selectedUser);
                                    }
                                    else {
                                        $('.page-quick-sidebar-chat').removeClass('page-quick-sidebar-content-item-shown');
                                    }
                                });
                            });
                        }
                    });
                },
                selectFriend: function (friend) {
                    var chatUser = vm.chat.getFriendOrNull(friend.friendUserId, friend.friendTenantId);
                    vm.chat.selectedUser = chatUser;

                    if (!chatUser) {
                        return;
                    }
                    vm.chat.message = '';

                    if (!chatUser.messagesLoaded) {
                        vm.chat.user.loadMessages(chatUser, function () {
                            chatUser.messagesLoaded = true;
                            vm.chat.scrollToBottom();
                        });
                    }
                    else {
                        vm.chat.user.markAllUnreadMessagesOfUserAsRead(vm.chat.selectedUser);
                        vm.chat.scrollToBottom();
                    }
                },
                sendMessage: function () {

                    if (!vm.chat.message) {
                        return;
                    }
                    vm.chat.sendingMessage = true;
                    app.chat.sendMessage({
                        tenantId: vm.chat.selectedUser.friendTenantId,
                        userId: vm.chat.selectedUser.friendUserId,
                        message: vm.chat.message,
                        tenancyName: appSession.tenant ? appSession.tenant.tenancyName : null,
                        userName: appSession.user.userName,
                        profilePictureId: appSession.user.profilePictureId
                    }, function () {
                        $scope.safeApply(function () {
                            vm.chat.message = '';
                            vm.chat.sendingMessage = false;
                        });
                    });
                },
                triggerUnreadMessageCountChangeEvent: function () {
                    var totalUnreadMessageCount = 0;

                    if (vm.chat && vm.chat.friends) {
                        totalUnreadMessageCount = _.reduce(vm.chat.friends,
                            function (memo, friend) {
                                return memo + friend.unreadMessageCount;
                            }, 0);
                    }
                    infrastructure.event.trigger('app.chat.unreadMessageCountChanged', totalUnreadMessageCount);
                },
                registerWatches: function () {
                    $scope.$watch('vm.chat.selectedUser',
                        function (newValue, oldValue) {

                            if (newValue === oldValue) {
                                return;
                            }
                            app.localStorage.setItem('app.chat.selectedUser', newValue);
                        });
                },
                registerEvents: function () {
                    infrastructure.event.on('app.chat.messageReceived', function (message) {
                        var user = vm.chat.getFriendOrNull(message.targetUserId, message.targetTenantId);

                        if (!user) {
                            return;
                        }
                        user.messages = user.messages || [];
                        $scope.$apply(function () {
                            user.messages.push(message);

                            if (message.side === app.chat.side.receiver) {
                                user.unreadMessageCount += 1;
                                message.readState = app.chat.readState.unread;
                                vm.chat.triggerUnreadMessageCountChangeEvent();

                                if (vm.chat.isOpen && vm.chat.selectedUser !== null && user.friendTenantId === vm.chat.selectedUser.friendTenantId && user.friendUserId === vm.chat.selectedUser.friendUserId) {
                                    vm.chat.user.markAllUnreadMessagesOfUserAsRead(user);
                                }
                                else {
                                    infrastructure.notify.info(
                                        infrastructure.utils.formatString('{0}: {1}', user.friendUserName, infrastructure.utils.truncateString(message.message, 100)),
                                        null,
                                        {
                                            onclick: function () {
                                                vm.chat.selectFriend(user);
                                            }
                                        });
                                }
                            }
                            vm.chat.scrollToBottom();
                        });
                    });

                    infrastructure.event.on('app.chat.friendshipRequestReceived', function (data, isOwnRequest) {

                        if (!isOwnRequest) {
                            infrastructure.notify.info(infrastructure.utils.formatString(app.localize('UserSendYouAFriendshipRequest'), data.friendUserName));
                        }

                        if (!_.where(vm.chat.friends, { userId: data.friendUserId, tenantId: data.friendTenantId }).length) {
                            $scope.$apply(function () {
                                vm.chat.friends.push(data);
                            });
                        }
                    });

                    infrastructure.event.on('app.chat.userConnectionStateChanged', function (data) {
                        var user = vm.chat.getFriendOrNull(data.friend.userId, data.friend.tenantId);

                        if (!user) {
                            return;
                        }
                        $scope.$apply(function () {
                            user.isOnline = data.isConnected;
                        });
                    });

                    infrastructure.event.on('app.chat.userStateChanged', function (data) {
                        var user = vm.chat.getFriendOrNull(data.friend.userId, data.friend.tenantId);

                        if (!user) {
                            return;
                        }
                        $scope.$apply(function () {
                            user.state = data.state;
                        });
                    });
                    infrastructure.event.on('app.chat.allUnreadMessagesOfUserRead', function (data) {
                        var user = vm.chat.getFriendOrNull(data.friend.userId, data.friend.tenantId);

                        if (!user) {
                            return;
                        }
                        $scope.$apply(function () {
                            user.unreadMessageCount = 0;
                            vm.chat.triggerUnreadMessageCountChangeEvent();
                        });
                    });
                    infrastructure.event.on('app.chat.connected', function () {
                        vm.chat.getFriendsAndSettings(function () {
                            app.waitUntilElementIsReady('.page-quick-sidebar-wrapper, .quick-sidebar-toggler', function () {
                                vm.chat.bindUiEvents();

                                app.waitUntilElementIsReady('.page-quick-sidebar-chat', function () {
                                    vm.chat.loadLastState();
                                });
                            });
                        });
                    });
                },

                init: function () {
                    vm.chat.registerWatches();
                    vm.chat.registerEvents();
                }
            };
        }
    ]);
})();