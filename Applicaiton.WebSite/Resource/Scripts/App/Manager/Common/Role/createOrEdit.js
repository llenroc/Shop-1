(function () {
    var controllerId = 'app.manager.role.createOrEdit';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.role', '$stateParams', '$state',
        function ($scope, roleService, $stateParams, $state) {
            var vm = this;

            vm.saving = false;
            vm.role = null;
            vm.permissionEditData = null;

            vm.save = function () {
                vm.saving = true;
                roleService.createOrUpdateRole({
                    role: vm.role,
                    grantedPermissionNames: vm.permissionEditData.grantedPermissionNames
                }).then(function () {
                    infrastructure.notify.info(app.localize('SavedSuccessfully'));
                    $state.go("role.index");
                }).finally(function () {
                    vm.saving = false;
                });
            };

            function init() {
                roleService.getRoleForEdit({
                    id: $stateParams.id
                }).then(function (result) {
                    vm.role = result.data.role;
                    vm.permissionEditData = {
                        permissions: result.data.permissions,
                        grantedPermissionNames: result.data.grantedPermissionNames
                    };
                });
            }
            init();
        }
    ]);
})();