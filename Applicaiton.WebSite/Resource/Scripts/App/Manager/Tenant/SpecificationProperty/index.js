(function () {
    var controllerId = 'app.manager.specificationProperty.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.specificationPropertyForTenant', '$state', function ($scope, specificationPropertyForTenantService, $state) {
            var vm = this;
            vm.specificationPropertys = [];
            var $specificationPropertyTable = $('#specificationPropertyTable');

            var specificationPropertyTable = $specificationPropertyTable.table({
                paging: true,
                sorting: true,
                multiSorting: true,
                actions: {
                    listAction: {
                        method: specificationPropertyForTenantService.getAllOfPage,
                        callback: function (result) {
                            vm.specificationPropertys = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                    name: {                                                                                            
                    },
                }
            }).data("canknow.table");
            vm.delete = function (specificationProperty) {
                infrastructure.message.confirm(
                    app.localize('DeleteWarningMessage', specificationProperty.name),
                    function () {
                        specificationPropertyForTenantService.delete({
                            id: specificationProperty.id
                        }).then(function () {
                            specificationPropertyTable.load();
                            infrastructure.notify.success(app.localize('SuccessfullyDeleted'));
                        });
                    }
                );
            };
        }
    ]);
})();