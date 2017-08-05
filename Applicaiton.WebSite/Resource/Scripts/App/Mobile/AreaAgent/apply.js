(function () {
    var controllerId = 'app.mobile.areaAgent.apply';
    appModule.controller(controllerId, ['$scope',
        'infrastructure.services.app.areaAgentForFront',
        'infrastructure.services.app.areaAgencyApplyOrder',
        '$uiModal',
        'appSession',
        function ($scope, areaAgentService, orderService, $uiModal, appSession) {
            var vm = this;
            vm.areaAgentId = document.getElementById("id").value;
            vm.areaAgent = null;
            vm.addresses = [];
            vm.userDetail = appSession.user.userDetail;
            vm.loaded = false;
            vm.isSubmitting = false;
            vm.normalAddressCount = 0;
            vm.developedAddressCount = 0;
            vm.money = 0;
            vm.getAreaAgent = function () {
                areaAgentService.get({ id: vm.areaAgentId }).success(function (result) {
                    vm.areaAgent = result;
                });
            };
            vm.confirmOrder = function () {
                var data = {
                    areaAgentId: vm.areaAgentId,
                    addressIds: vm.addresses.map(function (address) {
                        return address.id;
                    })
                };
                infrastructure.ui.setBusy();
                orderService.confirmOrder(data).success(function (result) {
                    vm.loaded = true;
                    vm.money = result.money;
                    vm.normalAddressCount = result.normalAddressCount;
                    vm.developedAddressCount = result.developedAddressCount;
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            vm.selectAddress = function () {
                var modalInstance = $uiModal.open({
                    templateUrl: '/Areas/Mobile/Views/AreaAgent/Address/AddressSelectorModal.cshtml',
                    controller: 'app.mobile.areaAgent.address.addressSelectorModal as vm',
                    backdrop: 'static',
                    resolve: {
                        level:vm.areaAgent.level,
                    }
                });
                modalInstance.result.then(function (result) {
                    var hasThisAddress = false;
                    vm.addresses.forEach(function (address) {

                        if (address.id == result.id) {
                            hasThisAddress = true;
                        }
                    });

                    if (!hasThisAddress) {
                        vm.addresses.push(result);
                        vm.confirmOrder();
                    }
                    else {
                        infrastructure.toast.error(app.localize("YouHasAddThisAddress"));
                    }
                });
            };
            vm.removeAddress = function (index) {
                vm.addresses.splice(index, 1);
                vm.confirmOrder();
            };
            vm.submit = function () {
                var data = {
                    areaAgentId: vm.areaAgentId,
                    addressIds: vm.addresses.map(function (address) {
                        return address.id;
                    }),
                    userDetail: vm.userDetail
                };
                var loading = infrastructure.ui.loading(app.localize("Submitting"));
                vm.isSubmitting = true;
                orderService.createOrder(data).success(function (result) {
                    window.location.href = "/Mobile/Pay/Index?id=" + result.id;
                }).error(function () {
                    loading.hide();
                }).finally(function () {
                    vm.isSubmitting = false;
                });
            };
            function initialize() {
                vm.getAreaAgent();
                vm.confirmOrder();
            };
            initialize();
        }]);
})();