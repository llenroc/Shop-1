(function () {
    var controllerId = 'app.manager.host.auditLog.detailModal';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.auditLog', 'id',
            function ($scope, auditLogService, id) {
                var vm = this;
                vm.auditLog = null;
                vm.getAuditLog = auditLogService.getAuditLog({ id: id }).success(function (result) {
                    vm.auditLog = result;
                });
                vm.getExecutionTime = function () {

                    if (vm.auditLog) {
                        return moment(vm.auditLog.executionTime).fromNow() + ' (' + moment(vm.auditLog.executionTime).format('YYYY-MM-DD HH:mm:ss') + ')';
                    }
                };
                vm.getFormattedParameters = function () {
                    var json = JSON.parse(vm.auditLog.parameters);
                    return JSON.stringify(json, null, 4);
                }
            }
        ]);
})();