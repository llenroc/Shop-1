(function () {
    appModule.controller('app.manager.profile.index', [
        '$scope', 'appSession', 'infrastructure.services.app.profile','appSession',
        function ($scope, appSession, profileService,appSession) {
            var vm = this;
            vm.user = appSession.user;
        }
    ]);
})();