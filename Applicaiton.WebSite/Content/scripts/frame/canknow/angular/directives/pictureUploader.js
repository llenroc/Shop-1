(function () {
    canknowModule.directive('pictureUploader', function () {
        return {
            restrict: 'A',
            scope: {
                path: "=",
                successHandler: "&"
            },
            link: function ($scope, element) {
                var options = {
                };

                if ($scope.successHandler) {
                    options.success = $scope.successHandler;
                }
                var $pictureUploader = element.pictureUploader(options).data("canknow.pictureUploader");
                $pictureUploader.setPath = function (path) {
                    $scope.$apply(function () {
                        $scope.path = path;
                    })
                    
                }
            }
        };
    });
})();