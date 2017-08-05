(function () {
    var controllerId = 'app.manager.shopTemplate.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.shopTemplate', '$state',
            function ($scope, shopTemplateService, $state) {
                var vm = this;
                vm.shopTemplates = [];
                vm.getSpreadPosterTemplates = function () {
                    shopTemplateService.getAll().success(function (result) {
                        vm.shopTemplates = result.items;
                    });
                };
                vm.setAsDefault = function (shopTemplate) {
                    shopTemplateService.setAsDefault({
                        id: shopTemplate.id
                    }).success(function (result) {
                        infrastructure.message.success(app.localize("SuccessfullySeted"));
                        vm.getSpreadPosterTemplates();
                    });
                };
                vm.delete = function (shopTemplate) {
                    infrastructure.message.confirm(
                        app.localize('UserSpreadPosterTemplateWarningMessage', shopTemplate.name),
                        function () {
                            shopTemplateService.delete({
                                id: shopTemplate.id
                            }).then(function () {
                                shopTemplateTable.load();
                                infrastructure.notify.success(app.localize('SuccessfullyDeleted'));
                            });
                        }
                    );
                };
                vm.initialize = function () {
                    vm.getSpreadPosterTemplates();
                };
                vm.initialize();
            }
        ]);
})();