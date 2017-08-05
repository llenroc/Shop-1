(function () {
    appModule.controller('app.mobile.spreadPoster.list',
        ['$scope', 'infrastructure.services.app.spreadPoster', 'appSession',
        function ($scope, spreadPosterService, appSession) {
            var vm = this;
            vm.spreadPosters = null;
            vm.getSpreadPoster = function () {
                spreadPosterService.getSpreadPosters().success(function (result) {
                    vm.spreadPosters = result.spreadPosters;
                });
            };
            vm.reCreate = function (spreadPoster) {
                infrastructure.ui.setBusy();
                spreadPosterService.createSpreadPoster({
                    id: spreadPoster.spreadPosterTemplate.id
                }).success(function (result) {
                    vm.path = result + "?timestamp=" + Date.parse(new Date());
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            }
            function initialize() {
                vm.getSpreadPoster();
            }
            initialize();
        }
        ]);
})();