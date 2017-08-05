(function () {
    var controllerId = 'app.manager.expressCompany.create';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.expressCompany', '$stateParams', '$state',
            function ($scope, expressCompanyService, $stateParams, $state) {
                var vm = this;
                vm.expressCompany = null;
                vm.expressCompanys = expressCompanys;
                vm.create = function () {
                    vm.expressCompanys.forEach(function (expressCompany) {

                        if (expressCompany.name == vm.expressCompany.name) {
                            vm.expressCompany.code = expressCompany.code;
                        }
                    });
                    expressCompanyService.create(vm.expressCompany).success(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $state.go("expressCompany.index");
                    });
                };
            }
        ]);
})();