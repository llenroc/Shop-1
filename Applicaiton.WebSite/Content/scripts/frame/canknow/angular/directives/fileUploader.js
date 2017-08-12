(function () {
    canknowModule.directive('fileUploader', function () {
        return {
            restrict: 'A',
            scope: {
                path: "=",
                successHandler:"&"
            },
            link: function ($scope, element) {
                var options = {
                };
 
                if ($scope.successHandler) {
                    options.success = $scope.successHandler;
                }
                var $fileUploader = $(element).fileUploader(options).data("canknow.fileUploader");
                $fileUploader.setPath = function (path) {
                    $scope.$apply(function () {
                        $scope.path = path;
                    });
                }
            }
        };
    });
})();