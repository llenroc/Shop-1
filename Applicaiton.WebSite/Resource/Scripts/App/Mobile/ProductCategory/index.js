(function () {
    var controllerId = 'app.mobile.productCategory.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.productCategoryForFront',
            function ($scope, productCategoryService) {
                var vm = this;
                vm.products = null;
                vm.productCategory = null;
                var $productsList = $('#productsList');
                vm.id = document.getElementById("id").value;
                $productsList.table({
                    paging: true,
                    pageSize: 10,
                    initializeLoad: false,
                    actions: {
                        listAction: {
                            method: productCategoryService.getProductsWithProductCategoryOfPage,
                            beforeCallback: function () {
                                infrastructure.ui.setBusy();
                            },
                            callback: function (result) {
                                infrastructure.ui.clearBusy();
                                vm.products = result.items;
                                vm.productCategory = result.productCategory;
                            },
                            getTotalCountFromResult: function (result) {
                                return result.totalCount;
                            },
                            parameters: { productCategoryId: vm.id }
                        }
                    }
                });
                vm.getProductsWithCategory = function () {
                    $productsList.table().data("canknow.table").load();
                };
                function ininialize() {
                    vm.getProductsWithCategory();
                }
                ininialize();
            }
        ]);
})();