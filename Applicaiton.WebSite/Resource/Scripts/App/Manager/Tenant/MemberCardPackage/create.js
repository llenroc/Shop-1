(function () {
    var controllerId = 'app.manager.memberCardPackage.create';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.memberCardPackage', 'infrastructure.services.app.memberLevel', '$stateParams', '$state',
            function ($scope, memberCardPackageService, memberLevelService, $stateParams, $state) {
                var vm = this;
                vm.memberCardPackage = {};
                var $memberCardPackageInformationForm = $("form");

                vm.memberLevels = null;
                memberLevelService.getAll().success(function (result) {
                    vm.memberLevels = result.items;
                });

                vm.create = function () {
                    var memberCardPackage = $memberCardPackageInformationForm.serializeObject();
                    memberCardPackageService.create(memberCardPackage).success(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        infrastructure.event.trigger('infrastructure.createMoiverModalSaved');
                        $state.go("memberCardPackage.index");
                    });
                };
            }
        ]);
})();