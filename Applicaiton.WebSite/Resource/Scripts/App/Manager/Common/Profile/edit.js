(function () {
    appModule.controller('app.manager.profile.edit', [
        '$scope', 'appSession', 'infrastructure.services.app.profile','appSession','$state',
        function ($scope, appSession, profileService,appSession,$state) {
            var vm = this;
            vm.user = appSession.user;
            vm.save = function () {
                profileService.updateUser(vm.user).success(function () {
                    $state.go("profile.index");
                });
            }
        }
    ]);
})();