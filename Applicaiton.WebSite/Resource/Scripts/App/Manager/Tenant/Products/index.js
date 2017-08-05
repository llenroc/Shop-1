(function () {
    var controllerId = 'app.manager.product.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.productForTenant', '$state','$stateParams',
            function ($scope, productForTenantService, $state, $stateParams) {
                var vm = this;
                vm.products = [];
                vm.type = $stateParams.type || 'OnSale';
                var $productTable = $('#productTable');
                var $productFilterForm = $('#productFilterForm');
                var productTable = $productTable.table({
                    paging: true,
                    sorting: true,
                    multiSorting: true,
                    actions: {
                        listAction: {
                            method: productForTenantService.getAllOfPage,
                            parameters:{type:vm.type},
                            callback: function (result) {
                                vm.products = result.items;
                            },
                            getTotalCountFromResult: function (result) {
                                return result.totalCount;
                            }
                        }
                    },
                    fields: {
                        name: {
                        },
                        specifications: {
                            disabled: true
                        },
                        creationTime: {
                        },
                        status: {
                        },
                    }
                }).data("canknow.table");
                vm.getProductLink = function (product) {
                    return "http://" + window.location.host + "/Mobile/Product/Detail?id=" + product.id;
                };

                function createRequestParams() {
                    var params = {};
                    $productFilterForm.serializeArray().map(function (x) { params[x.name] = x.value; });
                    return params;
                }

                vm.getProducts = function () {
                    productTable.load(createRequestParams());
                };
                vm.delete = function (product) {
                    infrastructure.message.confirm(
                        app.localize('AreYouSureToDeleteThisProduct', product.name),
                        function () {
                            productForTenantService.delete({
                                id: product.id
                            }).then(function () {
                                productTable.load();
                                infrastructure.notify.success(app.localize('SuccessfullyDeleted'));
                            });
                        }
                    );
                };
                vm.onProduct = function (product) {
                    productForTenantService.onProduct({
                        id: product.id
                    }).then(function () {
                        productTable.load();
                        infrastructure.notify.success(app.localize('SuccessfullySet'));
                    });
                };
                vm.offProduct = function (product) {
                    productForTenantService.offProduct({
                        id: product.id
                    }).then(function () {
                        productTable.load();
                        infrastructure.notify.success(app.localize('SuccessfullySet'));
                    });
                };
            }
        ]);
})();