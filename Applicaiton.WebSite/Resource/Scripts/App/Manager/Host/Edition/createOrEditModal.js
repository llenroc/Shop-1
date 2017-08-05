(function () {
    var controllerId = 'app.manager.host.edition.createOrEditModal';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.edition', '$uiModalInstance', 'id',
            function ($scope, editionService, $uiModalInstance, id) {
                var vm = this;
                vm.saving = false;
                vm.edition = null;
                vm.featureEditData = null;

                vm.save = function () {
                    vm.saving = true;
                    editionService.createOrUpdateEdition({
                        edition: vm.edition,
                        featureValues: vm.featureEditData.featureValues
                    }).then(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $uiModalInstance.close();
                    }).finally(function () {
                        vm.saving = false;
                    });
                };

                function init() {
                    editionService.getEditionForEdit({
                        id: id
                    }).then(function (result) {
                        vm.edition = result.data.edition;
                        vm.featureEditData = {
                            features: result.data.features,
                            featureValues: result.data.featureValues
                        };
                    });
                }
                init();
            }
        ]);
})();