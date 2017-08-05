/* Used by user and role permission settings. 
 */
appModule.directive('slider', [function () {
    return {
        scope: {
            items: '@'
        },
        link: function ($scope, element, attr) {
            
            $scope.$watch('items', function (newValue, oldValue) {

                if (newValue && newValue.length) {

                    if (oldValue && $(element).data("canknow.slider") && newValue.length == oldValue.length) {
                        return;
                    }

                    if ($(element).data("canknow.slider")) {
                        $(element).data("canknow.slider").dispose();
                    }
                    $(element).slider({
                        enableControl: false
                    });
                }
            });
        }
    };
}]);