(function () {
    appModule.controller('app.mobile.group.index',
        ['$scope', 'infrastructure.services.app.group', 'appSession',
        function ($scope, groupService, appSession) {
            var vm = this;
            vm.user = appSession.user;
            function initialize() {
            }
            initialize();
        }
        ]);
})();