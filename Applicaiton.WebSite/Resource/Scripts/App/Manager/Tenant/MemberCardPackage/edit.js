(function () {
    var controllerId = 'app.manager.memberCardPackage.edit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.memberCardPackage', 'infrastructure.services.app.memberLevel', '$stateParams', '$state',
            function ($scope, memberCardPackageService,memberLevelService, $stateParams, $state) {
            var vm = this;
            vm.memberLevels = null;
            vm.memberCardPackage = null;
            var $memberCardPackageInformationForm = $("form");
            memberCardPackageService.get({ id: $stateParams.id }).success(function (result) {
                vm.memberCardPackage = result;
            });
            memberLevelService.getAll().success(function (result) {
                vm.memberLevels = result.items;
            });
            vm.update = function (){
                var memberCardPackage = $memberCardPackageInformationForm.serializeObject();
                memberCardPackageService.update(memberCardPackage).success(function (result) {
                    infrastructure.notify.success(app.localize('SavedSuccessfully'));
                    infrastructure.event.trigger('infrastructure.updatememberCardPackageModalSaved');
                    $state.go("memberCardPackage.index");
                }).error(function (result) {
                    infrastructure.notify.error(result.error.message);
                });
            };
        }
        ]);
})();