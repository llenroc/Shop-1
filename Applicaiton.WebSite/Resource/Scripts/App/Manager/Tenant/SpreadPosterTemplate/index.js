(function () {
    var controllerId = 'app.manager.spreadPosterTemplate.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.spreadPosterTemplate', '$state',
            function ($scope, spreadPosterTemplateService, $state) {
                var vm = this;
                vm.spreadPosterTemplates = [];
                vm.getSpreadPosterTemplates = function () {
                    spreadPosterTemplateService.getAll().success(function (result) {
                        vm.spreadPosterTemplates = result.items;
                    });
                };
                vm.setAsDefault = function (spreadPosterTemplate) {
                    spreadPosterTemplateService.setAsDefault({
                        id: spreadPosterTemplate.id
                    }).success(function (result) {
                        infrastructure.message.success(app.localize("SuccessfullySeted"));
                        vm.getSpreadPosterTemplates();
                    });
                };
                vm.delete = function (spreadPosterTemplate) {
                    infrastructure.message.confirm(
                        app.localize('UserSpreadPosterTemplateWarningMessage', spreadPosterTemplate.name),
                        function () {
                            spreadPosterTemplateService.delete({
                                id: spreadPosterTemplate.id
                            }).then(function () {
                                spreadPosterTemplateTable.load();
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