(function () {
    appModule.controller('app.mobile.group.potentialCustomerList',
        ['$scope', 'infrastructure.services.app.group', 'appSession',
        function ($scope, groupService, appSession) {
            var vm = this;
            vm.customers = null;
            vm.getCustomers = function () {
                groupService.getCustomers({ depth: 1, shouldBePotential:true }).success(function (result) {
                    vm.customers = result.items;
                });
            };
            function initialize() {
                vm.getCustomers();
            }
            initialize();
        }
        ]);
})();