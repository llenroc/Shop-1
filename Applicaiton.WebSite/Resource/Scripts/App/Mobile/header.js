(function () {
    var controllerId = 'app.mobile.header';
    appModule.controller(controllerId, ['$scope',  function ($scope) {
        var vm = this;
        vm.goBack = function () {
            window.history.back();
        };
    }]);
})();