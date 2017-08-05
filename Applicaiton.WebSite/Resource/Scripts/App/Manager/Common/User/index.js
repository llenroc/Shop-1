(function () {
    var controllerId = 'app.manager.user.index';
    appModule.controller(controllerId,
        ['$scope',  'infrastructure.services.app.user','$state', function ($scope, userService,$state) {
            var vm = this;
            vm.users = [];
            var $filterForm = $('#userFilterForm');
            var $usersTable = $('#usersTable');
            var userTable=$usersTable.table({
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
                    role:{
                        disabled:true
                    },
                    creationTime: {
                    },
                    isEmailConfirmed: {
                    },
                    isSpreader: {
                    },
                }
            }).data("canknow.table");
            vm.refreshWeixinUserInfo = function (user) {
                userService.refreshWeixinUserInfo({
                    id: user.id
                }).then(function () {
                    userTable.load();
                    infrastructure.notify.success(app.localize('SuccessfullyRefreshed'));
                });
            };
            vm.deleteUser = function (user) {

                if (user.userName == app.consts.userManagement.defaultAdminUserName) {
                    infrastructure.message.warn(app.localize("{0}UserCannotBeDeleted", app.consts.userManagement.defaultAdminUserName));
                    return;
                }

                infrastructure.message.confirm(
                    app.localize('UserDeleteWarningMessage', user.userName),
                    function () {
                        userService.deleteUser({
                            id: user.id
                        }).then(function () {
                            userTable.load();
                            infrastructure.notify.success(app.localize('SuccessfullyDeleted'));
                        });
                    }
                );
            };

            function createRequestParams() {
                var params = {};
                $filterForm.serializeArray().map(function (x) { params[x.name] = x.value; });
                return params;
            }
            vm.getUsers = function () {
                userTable.load(createRequestParams());
            };

        }
    ]);
})();