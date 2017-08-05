(function () {
    var controllerId = 'app.mobile.shopTemplate.controlTemplates.productListControl';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.productForFront',
            function ($scope, productService) {
                var vm = this;
                vm.control = $scope.control;
                vm.products = null;
                vm.getProducts = function () {

                    if (vm.control.categoryId) {
                        productService.gets({ productCategoryId: vm.control.categoryId, maxCount: vm.control.maxCount }).success(function (result) {
                            vm.products = result.items;
                        });
                    }
                };
                function ininialize() {
                    $scope.$watch('control', function (newValue, oldValue) {
                        vm.getProducts();
                    },true);
                }
                ininialize();
            }
        ]);
})();