(function() {
    var controllerId = 'app.manager.home.index';
    appModule.controller(controllerId, [
        '$scope', '$state', function ($scope, $state) {
            var vm = this;
            //Home logic...

            $scope.$on('$viewContentLoaded', function () {
            });
        }
    ]);
})();