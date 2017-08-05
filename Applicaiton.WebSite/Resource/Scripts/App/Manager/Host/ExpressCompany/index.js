(function () {
    appModule.controller('app.manager.expressCompany.index', ['$scope', 'infrastructure.services.app.expressCompany',
        function ($scope, expressCompanyService) {
            var vm = this;
            vm.expressCompanys = [];
           
            vm.getExpressCompanys=function() {
                expressCompanyService.getAll({}).success(function (result) {
                    vm.expressCompanys = result.items;
                });
            };
            vm.delete = function (expressCompany) {
                infrastructure.message.confirm(app.localize("AreYouSure"), function () {
                    expressCompanyService.delete({ id: expressCompany .id}).success(function (result) {
                        vm.getExpressCompanys();
                    });
                });
            }
            function initialize() {
                vm.getExpressCompanys();
            }
            initialize();
        }
    ]);
})();