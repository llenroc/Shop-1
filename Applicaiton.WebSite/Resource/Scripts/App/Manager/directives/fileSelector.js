/* Used by edition and tenant features. 
 */
appModule.directive('fileSelector', ['$uiModal',
    function ($uiModal) {
        return {
            scope: {
                path: "=",
                fileType:"="
            },
            link: function ($scope, element, attr) {
                $(element).click(function () {
                    var modalInstance = $uiModal.open({
                        fullPage: true,
                        autoCreateFrame: false,
                        templateUrl: '/Areas/Manager/Views/Common/FileSelector/fileSelectorModal.cshtml',
                        controller: "app.manager.common.fileSelectorModal as vm",
                        resolve: {
                            fileType: function () {
                                return $scope.fileType;
                            },
                        }
                    });
                    modalInstance.result.then(function (result) {
                        $scope.path = result.path;
                    });
                });
            }
        };
    }
]);