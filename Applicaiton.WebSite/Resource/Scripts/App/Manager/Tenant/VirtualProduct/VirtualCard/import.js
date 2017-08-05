(function () {
    var controllerId = 'app.manager.virtualProduct.virtualCard.import';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.virtualCard','$state',
            function ($scope, virtualCardService, $state) {
                var vm = this;
                vm.importData = null;
                vm.isImporting = false;
                vm.import = function () {
                    vm.isImporting = true;
                    infrastructure.ui.setBusy();
                    virtualCardService.importVirtualCard(vm.importData).success(function (result) {
                        infrastructure.notify.info(app.localize('ImportSuccessfully'));
                        $state.go("virtualProduct.virtualCard.index");
                    }).finally(function () {
                        vm.isImporting = false;
                        infrastructure.ui.clearBusy();
                    });
                };
            }
        ]);
})();