(function () {
    var controllerId = 'app.manager.order.changeCustomerInfoModal';
    appModule.controller(controllerId,
        ['$scope', '$uiModal', 'infrastructure.services.app.productOrderAdmin', '$uiModalInstance', 'id',
            function ($scope,$uiModal, orderService, $uiModalInstance, id) {
                var vm = this;
                vm.order = null;
                vm.orderCustomerInfo = null;
                vm.address = null;
                vm.saving = false;
                vm.selectedAddresses = [];

                function buildAddress(text, address) {
                    text = address.name + text;

                    if (address.parent) {
                        return buildAddress(text, address.parent);
                    }
                    return text;
                }

                function initialize() {
                    orderService.getOrderForEditOutput({ id: id }).success(function (result) {
                        vm.order = result.order;
                        vm.orderCustomerInfo = vm.order.orderCustomerInfo;

                        if (vm.orderCustomerInfo.address) {
                            var text = "";
                            text = buildAddress(text, vm.orderCustomerInfo.address);
                            vm.address = text;
                        }
                    });
                }
                vm.selectAddress = function () {

                    if (vm.isSelectAddress) {
                        return;
                    }
                    var modalInstance = $uiModal.open({
                        templateUrl: '/Areas/Manager/Views/Common/Address/AddressSelectorModal.cshtml',
                        controller: 'app.manager.address.addressSelectorModal as vm',
                        backdrop: 'static',
                    });
                    vm.isSelectAddress = true;
                    modalInstance.result.then(function (result) {
                        vm.assignAddressFromSelectedAddresses(result);
                        vm.isSelectAddress = false;
                    });
                };
                vm.assignAddressFromSelectedAddresses = function (selectedAddresses) {
                    vm.selectedAddresses = selectedAddresses;

                    var text = "";

                    for (var i = 0; i < vm.selectedAddresses.length; i++) {
                        var address = vm.selectedAddresses[i];
                        text += address.name;
                    }
                    vm.address = text;
                    vm.orderCustomerInfo.addressId = vm.selectedAddresses[vm.selectedAddresses.length - 1].id;
                };
                vm.save = function () {
                    vm.saving = true;
                    orderService.changeCustomerInfo(vm.orderCustomerInfo).then(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $uiModalInstance.close();
                    }).finally(function () {
                        vm.saving = false;
                    });
                };
                initialize();
            }
        ]);
})();