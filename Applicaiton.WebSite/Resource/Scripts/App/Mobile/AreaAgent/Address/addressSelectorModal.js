(function () {
    var controllerId = 'app.mobile.areaAgent.address.addressSelectorModal';
    appModule.controller(controllerId, ['$scope', '$uiModalInstance', 'infrastructure.services.app.areaAgencyApplyOrder', 'level',
        function ($scope, $uiModalInstance, areaAgencyApplyOrderService, level) {
            var vm = this;
            vm.addresses = [];
            vm.currentParentAddress = null;
            vm.selectAddress = function (address) {
  
                if (address.level == level) {
                    $uiModalInstance.close(address);
                    return;
                }
                vm.currentParentAddress = address;
                vm.getAddresses();
            }
            vm.getAddresses = function () {
                infrastructure.ui.setBusy();
                var currentLevel = vm.currentParentAddress ? vm.currentParentAddress.level+1 : 1;
                var isLast = level == currentLevel;
                areaAgencyApplyOrderService.getAddresses({
                    parentId: vm.currentParentAddress ? vm.currentParentAddress.id : 1,
                    isLast: isLast
                }).success(function (result) {

                    if (result.length) {
                        vm.addresses = result;
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