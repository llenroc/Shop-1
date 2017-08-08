(function () {
    appModule.controller('app.mobile.profile.detail',
        ['$scope', 'infrastructure.services.app.userForFront', 'appSession',
        function ($scope, userService, appSession) {
            var vm = this;
            vm.user = appSession.user;
            vm.userDetail = null;
            vm.getUserDetail = function () {
                userService.getUserDetailForEdit().success(function (result) {
                    vm.userDetail = result;
                });
            }
            vm.save = function () {
                userService.createOrEditUserDetail(vm.userDetail).success(function (result) {
                    infrastructure.toast.success(app.localize("SuccessfullySaved"));
                    vm.getUserDetail();
                });
            }
            function initialize() {
                vm.getUserDetail();
            }
            initialize();
        }
        ]);
})();