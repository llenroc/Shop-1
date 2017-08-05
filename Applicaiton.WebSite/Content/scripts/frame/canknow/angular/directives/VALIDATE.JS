(function () {
    appModule.directive('validate', function () {
        return {
            restrict: 'A',
            link: function ($scope, element) {
                element.formValidate();
            }
        };
    });
})();