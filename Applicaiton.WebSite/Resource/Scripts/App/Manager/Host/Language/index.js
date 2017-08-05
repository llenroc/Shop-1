(function () {
    appModule.controller('app.manager.host.language.index', [
        '$scope', '$state', '$uiModal', 'infrastructure.services.app.language',
        function ($scope, $state, $uiModal, languageService) {
            var vm = this;
            vm.loading = false;
            vm.languages = null;
            vm.defaultLanguageName = null;
            vm.currentTenantId = infrastructure.session.tenantId;
            vm.filterText = '';

            vm.getLanguages = function () {
                vm.loading = true;
                languageService.getLanguages({}).then(function (result) {
                    vm.languages = result.data.items;
                    vm.defaultLanguageName = result.data.defaultLanguageName;
                }).finally(function () {
                    vm.loading = false;
                });
            };

            vm.editLanguage = function (language) {
                openCreateOrEditLanguageModal(language.id); //TODO: CAN EDIT?
            };

            vm.deleteLanguage = function (language) {
                infrastructure.message.confirm(
                    app.localize('LanguageDeleteWarningMessage', language.displayName),

                    function () {
                        languageService.deleteLanguage({
                            id: language.id
                        }).then(function () {
                            vm.getLanguages();
                            infrastructure.notify.success(app.localize('SuccessfullyDeleted'));
                        });
                    }
                );
            };

            vm.createLanguage = function () {
                openCreateOrEditLanguageModal(null);
            };

            vm.setAsDefaultLanguage = function (language) {
                languageService.setDefaultLanguage({
                    name: language.name
                }).then(function () {
                    vm.getLanguages();
                    infrastructure.notify.success(app.localize('SuccessfullySaved'));
                });
            };

            vm.changeTexts = function (language) {
                $state.go('languageTexts', {
                    languageName: language.name
                });
            }

            function openCreateOrEditLanguageModal(id) {
                var modalInstance = $uiModal.open({
                    autoCreateFrame: true,
                    responsive:true,
                    templateUrl: '/Areas/Manager/Views/Host/Language/createOrEditModal.cshtml',
                    controller: 'app.manager.host.language.createOrEditModal as vm',
                    backdrop: 'static',
                    resolve: {
                        languageId: function () {
                            return id;
                        }
                    }
                });

                modalInstance.result.then(function (result) {
                    vm.getLanguages();
                });
            }
            vm.getLanguages();
        }
    ]);
})();