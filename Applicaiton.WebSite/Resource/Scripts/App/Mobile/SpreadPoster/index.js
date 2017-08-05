(function () {
    var controllerId = 'app.mobile.spreadPoster.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.spreadPoster', '$http',
        function ($scope, spreadPosterService, $http) {
            var vm = this;
            vm.path = null;

            vm.getDefaultSpreadPoster=function() {
                spreadPosterService.getDefatulSpreadPoster().success(function (result) {
                    vm.path = result;
                });
            };
            vm.reCreate = function () {
                infrastructure.ui.setBusy();
                spreadPosterService.reCreateDefaultSpreadPoster().success(function (result) {
                    vm.path = result + "?v=" + Date.parse(new Date());
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            function initialize() {
                vm.getDefaultSpreadPoster();
            }
            initialize();
        }]);
})();