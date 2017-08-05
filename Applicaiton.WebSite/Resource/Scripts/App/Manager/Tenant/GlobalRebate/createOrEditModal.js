(function () {
    var controllerId = 'app.manager.globalRebate.createOrEditModal';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.globalRebate', 'infrastructure.services.app.user', '$uiModalInstance', 'id',
            function ($scope, globalRebateService,userService, $uiModalInstance, id) {
                var vm = this;
                vm.globalRebate = null;
                vm.user = null;
                vm.userName = null;
                vm.saving = false;
                vm.createOrEdit = function () {
                    vm.saving = true;
                    globalRebateService.createOrUpdateGlobalRebate(vm.globalRebate).then(function () {
                        infrastructure.notify.info(app.localize('CreateSuccessfully'));
                    }).finally(function () {
                        vm.saving = false;
                        $uiModalInstance.close();
                    });
                };
                vm.getUser = function (id) {
                    userService.get({ id: id }).success(function (result) {
                        vm.user = result;
                        vm.userName = vm.user.userName;
                    });
                };
                vm.getUserFromUserName = function (userName) {
                    userService.getUserFromUserName({ userName: userName }).success(function (result) {

                        if (result) {
                            vm.user = result;
                            vm.globalRebate.userId = vm.user.id;
                        }
                        else {
                            vm.user = null;
                        }
                    });
                };
                function init() {
                    globalRebateService.getGlobalRebateForEdit({
                        id: id
                    }).success(function (result) {
                        vm.globalRebate = result;

                        if (vm.globalRebate.userId) {
                            vm.getUser(vm.globalRebate.userId);
                        }
                    });
                }
                init();
            }
        ]);
})();