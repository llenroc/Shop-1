(function () {
    appModule.controller('app.manager.channel.channelAgent.index',
        ['$scope', 'infrastructure.services.app.channelAgentForEnd',
        function ($scope, channelAgentService) {
            var vm = this;
            vm.channelAgents = [];

            function getChannelAgents() {
                channelAgentService.getAll({}).success(function (result) {
                    vm.channelAgents = result.items;
                });
            }
            getChannelAgents();
        }
    ]);
})();