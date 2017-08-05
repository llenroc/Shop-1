(function () {
    var controllerId = 'app.manager.layout.loginAttempt';
    appModule.controller(controllerId,
        ['$rootScope', '$state', 'infrastructure.services.app.userLoginAttempts', 'appSession', function ($rootScope, $state, userLoginAttemptService, appSession) {
        var vm = this;
        vm.loginAttempts = [];
        var $loginAttemptsTable = $('#loginAttemptsTable');

        $loginAttemptsTable.table({
            paging: true,
            sorting: true,
            multiSorting: true,
            actions: {
                listAction: {
                    method: userLoginAttemptService.getAllOfPage,
                    callback: function (result) {
                        vm.loginAttempts = result.items;
                    },
                    getTotalCountFromResult: function (result) {
                        return result.totalCount;
                    }
                }
            },
            fields: {
                userNameOrEmailAddress: {
                },
                clientIpAddress: {
                },
                creationTime: {
                    sorting: false
                },
                result: {
                },
            }
        });
        vm.getCreationTime = function (loginAttempt) {
            return moment(loginAttempt.creationTime).fromNow() + ' (' + moment(loginAttempt.creationTime).format('YYYY-MM-DD hh:mm:ss') + ')';
        };
        vm.getLoginAttempts = function () {
            $loginAttemptsTable.table().data("canknow.table").load();
        };
    }
    ]);
})();