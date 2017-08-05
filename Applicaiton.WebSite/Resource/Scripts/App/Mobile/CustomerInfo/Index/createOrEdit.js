(function () {
    var controllerId = 'app.mobile.customerInfo.createOrEdit';
    appModule.controller(controllerId, ['$scope', '$uiModal', 'infrastructure.services.app.addressForFront', 'infrastructure.services.app.customerInfo', '$stateParams', '$state',
        function ($scope, $uiModal, addressService, customerInfoService, $stateParams, $state) {
            var vm = this;
            vm.customerInfo = null;
            vm.selectedAddresses = null;
            vm.address = null;
            vm.isSelectAddress = false;
            vm.getCustomerInfoForCreateOrEdit = function () {
                customerInfoService.getCustomerInfoForCreateOrEdit({
                    id: $stateParams.id
                }).success(function (result) {
                    vm.customerInfo = result;

                    if (vm.customerInfo.address) {
                        var text = "";
                        text=buildAddress(text, vm.customerInfo.address);
                        vm.address = text;
                    }
                });
            };
            function buildAddress(text,address) {
                text = address.name + text;

                if (address.parent) {
                    return buildAddress(text, address.parent);
                }
                return text;
            }
            vm.save = function () {
                customerInfoService.createOrEdit(vm.customerInfo).success(function (result) {
                    $state.go("customerInfo.list");
                });
            };
            vm.selectAddress = function () {

                if (vm.isSelectAddress) {
                    return;
                }
                var modalInstance = $uiModal.open({
                    templateUrl: '/Areas/Mobile/Views/Address/AddressSelectorModal.cshtml',
                    controller: 'app.mobile.address.addressSelectorModal as vm',
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

                for (var i =0;i< vm.selectedAddresses.length; i ++) {
                    var address = vm.selectedAddresses[i];
                    text += address.name;
                }
                vm.address = text;
                vm.customerInfo.addressId = vm.selectedAddresses[vm.selectedAddresses.length - 1].id;
            };
            function initialize() {
                vm.getCustomerInfoForCreateOrEdit();
            }
            initialize();
        }]);
})();