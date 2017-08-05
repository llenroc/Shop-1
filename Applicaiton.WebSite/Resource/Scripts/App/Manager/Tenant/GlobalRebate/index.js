(function () {
    var controllerId = 'app.manager.globalRebate.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.globalRebate', '$state', '$uiModal',
            function ($scope, globalRebateService, $state, $uiModal) {
                var vm = this;
                vm.globalRebates = [];
                vm.getGlobalRebates = function () {
                    globalRebateService.getAll().success(function (result) {
                        vm.globalRebates = result.items;
                    });
                };
                vm.openCreateOrEditModal = function (id) {
                    var modalInstance = $uiModal.open({
                        fullPage: false,
                        templateUrl: '/Areas/Manager/Views/Tenant/GlobalRebate/createOrEditModal.cshtml',
                        controller: "app.manager.globalRebate.createOrEditModal as vm",
                        resolve: {
                            id: function () {
                                return id;
                            }
                        }
                    });
                    modalInstance.result.then(function (result) {
                        vm.getGlobalRebates();
                    });
                };
                vm.delete = function (globalRebate) {
                    infrastructure.message.confirm(
                        app.localize('UserGlobalRebateWarningMessage', globalRebate.name),
                        function () {
                            globalRebateService.delete({
                                id: globalRebate.id
                            }).then(function () {
                                vm.getGlobalRebates();
                                infrastructure.notify.success(app.localize('SuccessfullyDeleted'));
                            });
                        }
                    );
                };
                vm.initialize = function () {
                    vm.getGlobalRebates();
                };
                vm.initialize();
            }
        ]);
})();