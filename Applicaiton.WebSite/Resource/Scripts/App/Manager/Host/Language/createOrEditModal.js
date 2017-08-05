(function () {
    appModule.controller('app.manager.host.language.createOrEditModal', [
        '$scope', '$uiModalInstance', 'infrastructure.services.app.language', 'languageId',
        function ($scope, $uiModalInstance, languageService, languageId) {
            var vm = this;

            vm.saving = false;
            vm.language = null;
            vm.languageNames = [];
            vm.flags = [];
            vm.loading = false;

            vm.save = function () {
                vm.saving = true;
                languageService.createOrUpdateLanguage({
                    language: vm.language
                }).then(function () {
                    infrastructure.notify.info(app.localize('SavedSuccessfully'));
                    $uiModalInstance.close();
                }).finally(function () {
                    vm.saving = false;
                });
            };
            $uiModalInstance.onOk = function () {
                vm.save();
            }
            function init() {
                vm.loading = true;
                languageService.getLanguageForEdit({
                    id: languageId
                }).then(function (result) {
                    vm.language = result.data.language;
                    vm.languageNames = result.data.languageNames;
                    vm.flags = result.data.flags;
                    vm.loading = false;
                });
            }
            init();
        }
    ]);
})();