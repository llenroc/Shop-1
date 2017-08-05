(function () {
    var controllerId = 'app.manager.user.userSelectorModal';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.user', '$state', '$uiModalInstance',
            function ($scope, userService, $state, $uiModalInstance) {
                var vm = this;
                vm.users = [];
                function createRequestParams() {
                    var params = {};
                    vm.$filterForm.serializeArray().map(function (x) { params[x.name] = x.value; });
                    return params;
                }
                vm.getUsers = function () {
                    vm.userTable.load(createRequestParams());
                };
                vm.selectUser = function (user) {
                    $uiModalInstance.close(user);
                }
                vm.initialize = function () {
                    vm.$filterForm = $('#userFilterForm');
                    vm.userTable = $('#usersTable').table({
                        paging: true,
                        sorting: true,
                        multiSorting: true,
                        actions: {
                            listAction: {
                                method: userService.getUsers,
                                callback: function (result) {
                                    vm.users = result.items;
                                },
                                getTotalCountFromResult: function (result) {
                                    return result.totalCount;
                                }
                            }
                        },
                        fields: {
                            avatar: {
                                disabled: true
                            },
                            userName: {
                            },
                            nickName: {
                            },
                            emailAddress: {
                            },
                            role: {
                                disabled: true
                            },
                            creationTime: {
                            },
                            isEmailConfirmed: {
                            },
                            isSpreader: {
                            },
                        }
                    }).data("canknow.table");
                    vm.getUsers();
                }
            }
        ]);
})();