(function() {
    appModule.controller('app.manager.host.tenant.index', [
        '$scope', 'infrastructure.services.app.tenant',
        function ($scope, tenantService) {
            var vm = this;
            vm.tenants = [];
            vm.loading = false;
            vm.filterText = null;
            var $tenantsTable = $('#tenantsTable');
            var $filterForm = $('#auditLogFilterForm');

            $tenantsTable.table({
                paging: true,
                sorting: true,
                multiSorting: true,
                actions: {
                    listAction: {
                        method: tenantService.getTenants,
                        callback: function (result) {
                            vm.tenants = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                    tenancyName: {
                    },
                    name: {
                    },
                    active: {
                    }
                }
            });

            function createRequestParams() {
                var params = {};
                $filterForm.serializeArray().map(function (x) { params[x.name] = x.value; });
                return params;
            }

            vm.getTenants = function () {
                $auditLogsTable.table().data("canknow.table").load(createRequestParams());
            };
        }
    ]);
})();