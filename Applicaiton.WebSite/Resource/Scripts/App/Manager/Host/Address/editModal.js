(function () {
    var controllerId = 'app.manager.address.editModal';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.addressForEnd', '$uiModalInstance', 'id',
            function ($scope, addressService, $uiModalInstance, id) {
                var vm = this;
                vm.address = null;
                vm.saving = false;
                vm.createOrEdit = function () {
                    vm.saving = true;
                    addressService.update(vm.address).then(function () {
                        infrastructure.notify.info(app.localize('UpdateSuccessfully'));
                    }).finally(function () {
                        vm.saving = false;
                        $uiModalInstance.close();
                    });
                };
                function init() {
                    addressService.get({
                        id: id
                    }).then(function (result) {
                        console.log(result);
                        vm.address = result.data;
                    });
                }
                init();
            }
        ]);
})();