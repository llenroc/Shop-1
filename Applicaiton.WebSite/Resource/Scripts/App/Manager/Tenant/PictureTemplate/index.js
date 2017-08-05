(function () {
    var controllerId = 'app.manager.pictureTemplate.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.pictureTemplate', '$state',
            function ($scope, pictureTemplateService, $state) {
                var vm = this;
                vm.pictureTemplates = [];
                vm.getPictureTemplates = function () {
                    pictureTemplateService.getAll().success(function (result) {
                        vm.pictureTemplates = result.items;
                    });
                };
                vm.setAsDefault = function (pictureTemplate) {
                    pictureTemplateService.setAsDefault({
                        id: pictureTemplate.id
                    }).success(function (result) {
                        infrastructure.message.success(app.localize("SuccessfullySeted"));
                        vm.getPictureTemplates();
                    });
                };
                vm.delete = function (pictureTemplate) {
                    infrastructure.message.confirm(
                        app.localize('DeletePictureTemplateWarningMessage', pictureTemplate.name),
                        function () {
                            pictureTemplateService.delete({
                                id: pictureTemplate.id
                            }).then(function () {
                                pictureTemplateTable.load();
                                infrastructure.notify.success(app.localize('SuccessfullyDeleted'));
                            });
                        }
                    );
                };
                vm.initialize = function () {
                    vm.getPictureTemplates();
                };
                vm.initialize();
            }
        ]);
})();