(function () {
    var controllerId = 'app.manager.freightTemplate.addressesSelectorModal';
    appModule.controller(controllerId,
        ['$scope', '$uiModalInstance', 'infrastructure.services.app.address', '$sce', 'addresses',
        function ($scope, $uiModalInstance, addressService, $sce, addresses) {
            var vm = this;
            vm.addressTree = null;
            vm.addresses = addresses;
            vm.toggleOpenStatus = function (address) {
                address.opened = !address.opened;
            };
            vm.selectAddresses = function () {
                vm.addresses = [];
                vm.addressTree.forEach(function (childAddress) {
                    recursionGetSelectedAddresses(childAddress);
                });
                $uiModalInstance.close(vm.addresses);
            };
            function recursionGetSelectedAddresses(parent) {

                if (parent.selected) {
                    vm.addresses.push(parent.id);
                }

                if (parent.children && parent.children.length) {
                    parent.children.forEach(function (childAddress) {
                        recursionGetSelectedAddresses(childAddress);
                    });
                }
            }
            vm.toggleSelect = function (address) {
                vm.recursionToggleSelectChildren(address, address.selected);
            };
            vm.recursionToggleSelectChildren = function (parent, selected) {

                if (parent.children && parent.children.length) {
                    parent.children.forEach(function (childAddress) {
                        childAddress.selected = selected;
                        vm.recursionToggleSelectChildren(childAddress, selected);
                    });
                }
            };
            function formatAddressTreeData(item, parent) {
                item.opened = false;
                item.parent = parent;
                item.selected = vm.addresses.contains(item.id);

                if (item.children && item.children.length) {
                    item.children.forEach(function (childItem) {
                        formatAddressTreeData(childItem, item);
                    });
                }
                return item;
            }
            function initialize() {
                addressService.getAddressesTree({}).success(function (result) {
                    var addressTree = result.items;

                    addressTree.forEach(function (childItem) {
                        formatAddressTreeData(childItem, null);
                    });
                    vm.addressTree = addressTree;
                });
            }
            initialize();
        }]);
})();