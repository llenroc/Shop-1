(function () {
    var controllerId = 'app.manager.user.createOrEdit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.user', '$stateParams', '$state', '$uiModal',
            function ($scope, userService, $stateParams, $state, $uiModal) {
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
                vm.bindParent = function () {
                    var modalInstance = $uiModal.open({
                        templateUrl: '/Areas/Manager/Views/Common/User/UserSelectorModal.cshtml',
                        controller: 'app.manager.user.userSelectorModal as vm',
                    });
                    modalInstance.result.then(function (result) {
                        userService.bindParent({
                            sourceUserId: vm.user.id,
                            targetUserId: result.id
                        }).then(function (result) {
                            vm.getUser();
                        });
                    });
                };
                vm.getUser = function () {
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
                function init() {
                    vm.getUser();
                }
                init();
            }
        ]);
})();