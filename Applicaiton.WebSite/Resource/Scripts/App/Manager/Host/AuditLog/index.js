(function () {
    var controllerId = 'app.manager.host.auditLog.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.auditLog', '$state','$uiModal',
            function ($scope, auditLogService, $state, $uiModal) {
            var vm = $scope;
            vm.isLoaded = false;
            vm.auditLogs = [];
            var $auditLogsTable = $('#auditLogsTable');
            var $filterForm = $('#auditLogFilterForm');

            $auditLogsTable.table({
                paging: true,
                sorting: true,
                multiSorting: true,
                actions: {
                    listAction: {
                        method: auditLogService.getAuditLogs,
                        callback: function (result) {
                            vm.auditLogs = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                    id: {
                    },
                    executionTime: {
                    },
                    clientIpAddress: {
                    },
                    clientName: {
                        sorting: false
                    },
                    serviceName: {
                    },
                    executionDuration: {
                    },
                    browserInfo: {
                    },
                }
            });

            function createRequestParams() {
                var params = {};
                $filterForm.serializeArray().map(function (x) { params[x.name] = x.value; });
                return params;
            }

            vm.getAuditLogs = function () {
                $auditLogsTable.table().data("canknow.table").load(createRequestParams());
            };

            vm.openDetailModal = function (id) {
                var modalInstance = $uiModal.open({
                    fullPage: false,
                    autoCreateFrame:true,
                    templateUrl: '/Areas/Manager/Views/Host/AuditLog/detailModal.cshtml',
                    controller: "app.manager.host.auditLog.detailModal as vm",
                    resolve: {
                        id: function () {
                            return id;
                        }
                    }
                });
            };
        }
    ]);
})();