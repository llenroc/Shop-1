(function () {
    appModule.controller('app.manager.host.language.texts', [
        '$scope', '$state', '$stateParams', '$uiModal', 'infrastructure.services.app.language',
        function ($scope, $state, $stateParams, $uiModal, languageService) {
            var vm = this;

            //Combobox values
            vm.sourceNames = [];
            vm.languages = [];
            vm.languageTexts = [];

            //Filters
            vm.targetLanguageName = $stateParams.languageName;
            vm.sourceName = $stateParams.sourceName || 'Application';
            vm.baseLanguageName = $stateParams.baseLanguageName || infrastructure.localization.currentLanguage.name;
            vm.targetValueFilter = $stateParams.targetValueFilter || 'ALL';
            vm.filterText = $stateParams.filterText || '';
            var $languagesTable = $("#languageTextsTable");
            var table=$languagesTable.table({
                paging: true,
                sorting: true,
                multiSorting: true,
                initializeLoad:false,
                actions: {
                    listAction: {
                        method: languageService.getLanguageTexts,
                        callback: function (result) {
                            vm.languageTexts = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                    key: {
                    },
                    baseValue: {
                    },
                    targetValue: {
                        sorting: false
                    },
                }
            }).data("canknow.table");

            function createRequestParams() {
                var params = {
                    sourceName: vm.sourceName,
                    baseLanguageName: vm.baseLanguageName,
                    targetLanguageName: vm.targetLanguageName
                };
                params.filterText = vm.filterText;
                return params;
            }

            vm.getLanguageTexts = function () {
                table.load(createRequestParams());
            };

            vm.openTextEditModal = function (text) {
                $uiModal.open({
                    templateUrl: '~/Areas/Manager/Views/Host/Language/editTextModal.cshtml',
                    controller: 'app.manager.host.language.editTextModal as vm',
                    resolve: {
                        sourceName: function () {
                            return vm.sourceName;
                        },
                        baseLanguageName: function () {
                            return vm.baseLanguageName;
                        },
                        languageName: function () {
                            return vm.targetLanguageName;
                        },
                        allTexts: function () {
                            return vm.languageTexts;
                        },
                        initialText: function () {
                            return text;
                        }
                    }
                });
            };

            function initializeFilters() {
                var sources = infrastructure.localization.sources.filter(function (source) {
                    return source.type == 'MultiTenantLocalizationSource';
                });
                vm.sourceNames = sources.map(function (value) {
                    return value.name;
                });
                vm.languages = infrastructure.localization.languages;

                function reloadWhenChange(variableName) {

                    $scope.$watch(variableName, function (newValue, oldValue) {

                        if (newValue == oldValue) {
                            return;
                        }
                        $state.go('languageTexts', {
                            languageName: vm.targetLanguageName,
                            sourceName: vm.sourceName,
                            baseLanguageName: vm.baseLanguageName,
                            targetValueFilter: vm.targetValueFilter,
                            filterText: vm.filterText
                        },
                        {
                            location: 'replace'
                        });
                    });
                }
                reloadWhenChange('vm.sourceName');
                reloadWhenChange('vm.baseLanguageName');
                reloadWhenChange('vm.targetLanguageName');
            }
           

            function initialize() {
                initializeFilters();
                vm.getLanguageTexts();
            }
            initialize();
        }
    ]);
})();