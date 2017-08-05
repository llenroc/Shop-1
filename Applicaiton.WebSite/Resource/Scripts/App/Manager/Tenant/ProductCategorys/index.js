(function () {
    var controllerId = 'app.manager.productCategory.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.productCategoryForTenant', '$state', '$uiModal',
            function ($scope, productCategoryForTenantService, $state, $uiModal) {
                var vm = this;
                vm.productCategorys = [];
                vm.getProductCategorys = function () {
                    productCategoryForTenantService.getAll().success(function (result) {
                        vm.productCategorys = result.items;
                    });
                };
                vm.openCreateOrEditModal = function (id) {
                    var modalInstance = $uiModal.open({
                        fullPage: false,
                        templateUrl: '/Areas/Manager/Views/Tenant/ProductCategory/createOrEditModal.cshtml',
                        controller: "app.manager.productCategory.createOrEditModal as vm",
                        resolve: {
                            id: function () {
                                return id;
                            }
                        }
                    });
                    modalInstance.result.then(function (result) {
                        vm.getProductCategorys();
                    });
                };
                vm.delete = function (productCategory) {
                    infrastructure.message.confirm(
                        app.localize('UserProductCategoryWarningMessage', productCategory.name),
                        function () {
                            productCategoryForTenantService.delete({
                                id: productCategory.id
                            }).then(function () {
                                productCategoryTable.load();
                                infrastructure.notify.success(app.localize('SuccessfullyDeleted'));
                            });
                        }
                    );
                };
                vm.initialize = function () {
                    vm.getProductCategorys();
                };
                vm.initialize();
            }
        ]);
})();