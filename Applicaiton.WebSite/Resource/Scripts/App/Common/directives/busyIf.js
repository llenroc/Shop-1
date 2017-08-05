(function () {
    appModule.directive('busyIf', [
        function () {
            return {
                restrict: 'A',
                scope: {
                    busyIf: "="
                },
                link: function (scope, element, attrs) {
                    scope.$watch('busyIf', function () {

                        if (scope.busyIf) {
                            infrastructure.ui.setBusy($(element));
                        }
                        else {
                            infrastructure.ui.clearBusy($(element));
                        }
                    });
                }
            };
        }
    ]);
})();