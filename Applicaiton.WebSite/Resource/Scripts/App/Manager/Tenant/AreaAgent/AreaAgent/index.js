(function () {
    appModule.controller('app.manager.areaAgent.areaAgent.index',
        ['$scope', 'infrastructure.services.app.areaAgentForEnd',
        function ($scope, areaAgentService) {
            var vm = this;
            vm.areaAgents = [];

            function getAreaAgents() {
                areaAgentService.getAll({}).success(function (result) {
                    vm.areaAgents = result.items;
                });
            }
            getAreaAgents();
        }
    ]);
})();