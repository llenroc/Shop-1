(function () {
    var controllerId = 'app.manager.freightTemplate.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.freightTemplate', '$state',
            function ($scope, freightTemplateService, $state) {
                var vm = this;
                vm.freightTemplates = [];
                vm.getSpreadPosterTemplates = function () {
                    freightTemplateService.getAll().success(function (result) {
                        vm.freightTemplates = result.items;
                    });
                };
                vm.delete = function (freightTemplate) {
                    infrastructure.message.confirm(
                        app.localize('UserSpreadPosterTemplateWarningMessage', freightTemplate.name),
                        function () {
                            freightTemplateService.delete({
                                id: freightTemplate.id
                            }).then(function () {
                                freightTemplateTable.load();
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