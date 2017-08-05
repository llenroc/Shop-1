(function () {
    var controllerId = 'app.manager.host.edition.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.edition', '$state', '$uiModal',
            function ($scope, editionService, $state, $uiModal) {
                var vm = this;
                vm.isLoaded = false;
                vm.editions = [];
                var $editionsTable = $('#editionsTable');

                $editionsTable.table({
                    paging: true,
                    sorting: true,
                    multiSorting: true,
                    actions: {
                        listAction: {
                            method: editionService.getEditions,
                            callback: function (result) {
                                vm.editions = result.items;
                            },
                            getTotalCountFromResult: function (result) {
                                return result.totalCount;
                            }
                        }
                    },
                    fields: {
                        displayName: {
                        },
                        name: {
                        },
                    }
                });

                vm.getEditions = function () {
                    $editionsTable.table().data("canknow.table").load();
                };
                vm.createEdition = function () {
                    openCreateOrEditEditionModal(null);
                };
                vm.editEdition = function (edition) {
                    openCreateOrEditEditionModal(edition.id);
                };
                function openCreateOrEditEditionModal(id) {
                    var modalInstance = $uiModal.open({
                        fullPage: false,
                        templateUrl: '/Areas/Manager/Views/Host/Edition/createOrEditModal.cshtml',
                        controller: "app.manager.host.edition.createOrEditModal as vm",
                        resolve: {
                            id: function () {
                                return id;
                            }
                        }
                    });
                    modalInstance.result.then(function (result) {
                        vm.getEditions();
                    });
                };
            }
        ]);
})();