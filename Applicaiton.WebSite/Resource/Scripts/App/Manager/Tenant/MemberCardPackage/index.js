(function () {
    appModule.controller('app.manager.memberCardPackage.index', ['$scope', 'infrastructure.services.app.memberCardPackage',
        function ($scope, memberCardPackageService) {
            var vm = this;
            vm.memberCardPackages = [];

            function getMemberCardPackages() {
                memberCardPackageService.getAll({}).success(function (result) {
                    vm.memberCardPackages = result.items;
                });
            }
            getMemberCardPackages();
        }
    ]);
})();