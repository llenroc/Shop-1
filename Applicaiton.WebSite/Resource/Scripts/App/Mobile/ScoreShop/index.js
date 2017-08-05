(function () {
    var controllerId = 'app.mobile.scoreShop.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.productForFront',
            function ($scope, productService) {
                var vm = this;
                vm.products = null;
                var $productsList = $('#productsList');
                $productsList.table({
                    paging: true,
                    pageSize: 10,
                    initializeLoad: false,
                    actions: {
                        listAction: {
                            method: productService.getScoreExchangeProductsOfPage,
                            beforeCallback: function () {
                                infrastructure.ui.setBusy();
                            },
                            callback: function (result) {
                                infrastructure.ui.clearBusy();
                                vm.products = result.items;
                            },
                            getTotalCountFromResult: function (result) {
                                return result.totalCount;
                            }
                        }
                    }
                });
                vm.getProducts = function () {
                    $productsList.table().data("canknow.table").load();
                };
                function ininialize() {
                    vm.getProducts();
                }
                ininialize();
            }
        ]);
})();