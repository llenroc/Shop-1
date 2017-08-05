(function () {
    var controllerId = 'app.mobile.score.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.scoreForFront', 
        function ($scope, scoreService) {
            var vm = this;
            vm.scoreInfo = null;
            vm.getScoreInfo = function () {
                scoreService.getScoreInfo().success(function (result) {
                    vm.scoreInfo = result;
                });
            };
            function initiallize() {
                vm.getScoreInfo();
            }
            initiallize();
        }]);
})();