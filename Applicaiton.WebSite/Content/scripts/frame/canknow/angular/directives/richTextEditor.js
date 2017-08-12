(function () {
    canknowModule.directive('richTextEditor', function () {
        return {
            restrict: 'A',
            scope: {
                content: "=",
                onImageUpload:"@"
            },
            link: function ($scope, element) {
                var options = {
                    content:$scope.content
                };

                if ($scope.onImageUpload) {
                    options.onImageUpload = $scope.onImageUpload;
                }
                options.onInput = function (editorContent) {
                    $scope.$apply(function () {
                        $scope.content = editorContent;
                    });
                };
                var $richTextEditor = $(element).richTextEditor(options);
            }
        };
    });
})();