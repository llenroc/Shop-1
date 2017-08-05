(function () {
    var controllerId = 'app.manager.freightTemplate.createOrEdit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.freightTemplate', 'addressSession', '$stateParams', '$state', '$uiModal',
            function ($scope, freightTemplateService, addressSession, $stateParams, $state, $uiModal) {
                var vm = this;
                vm.freightTemplate = null;
                vm.addressTree = addressSession.addressTree;
                vm.getFreightTemplateForCreateOrEdit = function () {
                    freightTemplateService.getFreightTemplateForCreateOrEdit({
                        id: $stateParams.id
                    }).success(function (result) {
                        vm.freightTemplate = result;
                    });
                };
                vm.addDeliveryArea = function () {
                    vm.freightTemplate.deliveryAreas = vm.freightTemplate.deliveryAreas || [];
                    vm.freightTemplate.deliveryAreas.push({
                        firstAmount: 1,
                        firstFee: 0,
                        additionalAmount: 0,
                        additionalFee:0
                    });
                };
                vm.removeDeliveryArea = function (index) {
                    vm.freightTemplate.deliveryAreas.splice(index, 1);
                };
                vm.save = function () {
                    freightTemplateService.createOrUpdateFreightTemplate(vm.freightTemplate).success(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $state.go("freightTemplate.index");
                    });
                };
                vm.selectorAddresses = function (deliveryArea) {
                    var modalInstance = $uiModal.open({
                        fullPage: true,
                        autoCreateFrame: false,
                        templateUrl: '/Areas/Manager/Views/Tenant/FreightTemplate/AddressesSelectorModal.cshtml',
                        controller: "app.manager.freightTemplate.addressesSelectorModal as vm",
                        resolve: {
                            addresses: function () {
                                var addresses = deliveryArea.addresses?deliveryArea.addresses.split(','):[];
                                return addresses;
                            }
                        }
                    });
                    modalInstance.result.then(function (result) {
                        var addresses = result.join(",");
                        deliveryArea.addresses = addresses;
                    });
                };
                function initialize() {
                    vm.getFreightTemplateForCreateOrEdit();
                };
                initialize();
            }
        ]);
})();