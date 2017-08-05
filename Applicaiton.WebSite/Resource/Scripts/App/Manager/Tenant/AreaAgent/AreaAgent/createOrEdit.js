(function () {
    var controllerId = 'app.manager.areaAgent.areaAgent.createOrEdit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.areaAgentForEnd', 'infrastructure.services.app.pictureTemplate', '$stateParams', '$state',
            function ($scope, areaAgentService,pictureTemplateService, $stateParams, $state) {
                var vm = this;
                vm.areaAgent = null;
                vm.saving = false;
                vm.areaAgentDistributions = [];
                vm.pictureTemplates = [];
                vm.levels = [
                    { name: "省级", value: 1 },
                    { name: "市级", value: 2},
                    { name: "区级", value: 3 },
                ]
                vm.getPictureTemplates = function () {
                    pictureTemplateService.getAll().success(function (result) {
                        vm.pictureTemplates = result.items;
                    });
                };
                vm.addDistribution = function () {
                    var distribution = {
                        level: 0,
                        money: 0,
                        ratio: 0
                    };
                    vm.areaAgentDistributions = vm.areaAgentDistributions || [];
                    vm.areaAgentDistributions.push(distribution);
                };
                vm.removeDistribution = function (index) {
                    var distribution = vm.areaAgentDistributions[index];

                    if (distribution.id) {
                        areaAgentService.removeDistribution({
                            id: distribution.id
                        }).then(function (result) {
                            vm.areaAgentDistributions.splice(index, 1);
                        });
                    }
                    else {
                        vm.areaAgentDistributions.splice(index, 1);
                    }
                };
                vm.createOrEdit = function () {
                    vm.saving = true;
                    areaAgentService.createOrEdit({
                        areaAgent: vm.areaAgent,
                        areaAgentDistributions: vm.areaAgentDistributions,
                    }).then(function () {
                        infrastructure.notify.success(app.localize('SaveSuccessfully'));
                        $state.go("areaAgent.areaAgent.index");
                    }).finally(function () {
                        vm.saving = false;
                    });
                };
                function init() {
                    areaAgentService.getAreaAgentForCreateOrEdit({
                        id: $stateParams.id
                    }).success(function (result) {
                        vm.areaAgent = result.areaAgent;
                        vm.areaAgentDistributions = result.areaAgentDistributions;
                    });
                    vm.getPictureTemplates();
                }
                init();
            }
        ]);
})();