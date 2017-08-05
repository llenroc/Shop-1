(function () {
    var controllerId = 'app.manager.address.addressSelectorModal';
    appModule.controller(controllerId, ['$scope', '$uiModalInstance', 'infrastructure.services.app.address', 
        function ($scope, $uiModalInstance, addressService) {
            var vm = this;
            vm.addresses = [];
            vm.selectedAddresses = [];
            vm.currentParentAddress = null;
            vm.selectAddress = function (address) {
                vm.currentParentAddress = address;
                vm.selectedAddresses.push(address);
                vm.getAddresses();
            }
            vm.getAddresses = function () {
                infrastructure.ui.setBusy();
                addressService.getAddresses({
                    parentId: vm.currentParentAddress ? vm.currentParentAddress.id : 1
                }).success(function (result) {

                    if (result.length) {
                        vm.addresses = result;
                    }
                    else {
                        $uiModalInstance.close(vm.selectedAddresses);
                    }
                    infrastructure.ui.clearBusy();
                });
            }
            function initialize() {
                vm.getAddresses();
            }
            initialize();
        }]);
})();