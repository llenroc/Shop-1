(function () {
    var controllerId = 'app.manager.user.createOrEdit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.user', '$stateParams', '$state',
            function ($scope, userService, $stateParams, $state) {
                var vm = this;
                var userId = $stateParams.id;
                var parentUserId = $stateParams.parentUserId;
                vm.user = null;
                vm.roles = [];
                vm.setRandomPassword = (userId == null);
                vm.sendActivationEmail = (userId == null);
                vm.canChangeUserName = true;
                vm.saving = false;

                vm.save = function () {
                    var assignedRoles = $.grep(vm.roles, function (role) {
                        return role.isAssigned;
                    });
                    var assignedRoleNames = assignedRoles.map(function (role) {
                        return role.roleName;
                    });

                    if (vm.setRandomPassword) {
                        vm.user.password = null;
                    }
                    vm.saving = true;

                    userService.createOrUpdateUser({
                        user: vm.user,
                        assignedRoleNames: assignedRoleNames,
                        sendActivationEmail: vm.sendActivationEmail,
                        setRandomPassword: vm.setRandomPassword
                    }).then(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $state.go("user.index");
                    }).finally(function () {
                        vm.saving = false;
                    });
                };

                function init() {
                    userService.getUserForEdit({
                        id: userId,
                        parentUserId: parentUserId
                    }).then(function (result) {
                        vm.user = result.data.user;
                        vm.user.passwordRepeat = vm.user.password;
                        vm.roles = result.data.roles;
                        vm.canChangeUserName = vm.user.userName != "Admin";
                    });
                }

                init();
            }
        ]);
})();