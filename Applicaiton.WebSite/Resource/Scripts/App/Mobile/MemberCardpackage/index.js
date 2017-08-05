(function () {
    var controllerId = 'app.mobile.memberCardPackage.index';
    appModule.controller(controllerId, ['$scope',
        'infrastructure.services.app.memberCardPackage',
        'infrastructure.services.app.memberCardPackageOrder',
        function ($scope, memberCardPackageService,memberCardPackageOrderService) {
            var vm = this;
            vm.memberCardPackages = [];
            vm.selectedMemberCardPackage = null;
            vm.select = function (memberCardPackage) {
                vm.selectedMemberCardPackage = memberCardPackage;
            };
            memberCardPackageService.getAll().success(function (result) {
                vm.memberCardPackages = result.items;
                vm.selectedMemberCardPackage = vm.memberCardPackages[0];
            });
            vm.submit = function () {

                if (!vm.selectedMemberCardPackage) {
                    $.message.error("Please select memberCardPackage!");
                }
                var $loading=$.message.loading("Submitting!");
                memberCardPackageOrderService.createOrder({ memberCardPackageId: vm.selectedMemberCardPackage.id }).success(function (result) {
                    window.location.href = "/Mobile/Pay/Index?id=" + result.id;
                }).finally(function () {
                    $loading.hide();
                });
            };
    }]);
})();