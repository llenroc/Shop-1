(function () {
    appModule.controller('app.manager.chat.index', [
        '$rootScope', '$scope', '$uiModal', '$timeout', '$interval', 'appSession', 'lookupModal', 'infrastructure.services.app.commonLookup', 'infrastructure.services.app.chat', 'infrastructure.services.app.friendship',
        function ($scope, moiveService) {
            var vm = this;
            vm.consts = {
                appPath: infrastructure.appPath,
                friendshipState: app.consts.friendshipState
            };
        }
    ]);
})();