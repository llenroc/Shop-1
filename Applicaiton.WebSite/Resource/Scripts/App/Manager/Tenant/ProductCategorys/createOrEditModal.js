(function () {
    var controllerId = 'app.manager.productCategory.createOrEditModal';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.productCategoryForTenant', '$uiModalInstance', 'id',
            function ($scope, productCategoryForTenantService, $uiModalInstance, id) {
                var vm = this;
                vm.productCategory = null;
                vm.saving = false;
                vm.createOrEdit = function () {
                    vm.saving = true;
                    productCategoryForTenantService.createOrUpdateProductCategory(vm.productCategory).then(function () {
                        infrastructure.notify.info(app.localize('CreateSuccessfully'));
                    }).finally(function () {
                        vm.saving = false;
                        $uiModalInstance.close();
                    });
                };
                function init() {
                    productCategoryForTenantService.getProductCategoryForEdit({
                        id: id
                    }).then(function (result) {
                        vm.productCategory = result.data.productCategory;
                    });
                }
                init();
            }
        ]);
})();