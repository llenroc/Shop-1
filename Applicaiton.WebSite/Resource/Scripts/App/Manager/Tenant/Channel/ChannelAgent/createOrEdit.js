(function () {
    var controllerId = 'app.manager.channel.channelAgent.createOrEdit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.channelAgentForEnd', 'infrastructure.services.app.productForTenant', 'infrastructure.services.app.pictureTemplate', '$stateParams', '$state',
            function ($scope, channelAgentService,productService,pictureTemplateService, $stateParams, $state) {
                var vm = this;
                vm.channelAgent = null;
                vm.products = [];
                vm.channelAgentAssortments = [];
                vm.channelAgentDistributions = [];
                vm.saving = false;
                vm.pictureTemplates = [];
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
                    vm.channelAgentDistributions = vm.channelAgentDistributions || [];
                    vm.channelAgentDistributions.push(distribution);
                };
                vm.removeDistribution = function (index) {
                    var distribution = vm.channelAgentDistributions[index];

                    if (distribution.id) {
                        channelAgentService.removeDistribution({
                            id: distribution.id
                        }).then(function (result) {
                            vm.channelAgentDistributions.splice(index, 1);
                        });
                    }
                    else {
                        vm.channelAgentDistributions.splice(index, 1);
                    }
                };
                vm.addChannelAgentAssortment = function () {
                    var channelAgentAssortment = {
                        specificationId: 0,
                        count: 0,
                    };
                    vm.channelAgentAssortments = vm.channelAgentAssortments || [];
                    vm.channelAgentAssortments.push(channelAgentAssortment);
                };
                vm.removeChannelAgentAssortment = function (index) {
                    var channelAgentAssortment = vm.channelAgentAssortments[index];

                    if (channelAgentAssortment.id) {
                        channelAgentService.removeChannelAgentAssortment({
                            id: channelAgentAssortment.id
                        }).then(function (result) {
                            vm.channelAgentAssortments.splice(index, 1);
                        });
                    }
                    else {
                        vm.channelAgentAssortments.splice(index, 1);
                    }
                };
                vm.createOrEdit = function () {
                    vm.saving = true;
                    channelAgentService.createOrEdit({
                        channelAgent: vm.channelAgent,
                        channelAgentDistributions: vm.channelAgentDistributions,
                        channelAgentAssortments: vm.channelAgentAssortments
                    }).then(function () {
                        infrastructure.notify.success(app.localize('SaveSuccessfully'));
                        $state.go("channel.channelAgent.index");
                    }).finally(function () {
                        vm.saving = false;
                    });
                };
                function init() {
                    productService.getAll().success(function (result) {
                        vm.products = result.items;
                    });
                    channelAgentService.getChannelAgentForCreateOrEdit({
                        id: $stateParams.id
                    }).success(function (result) {
                        vm.channelAgent = result.channelAgent;
                        vm.channelAgentDistributions = result.channelAgentDistributions;
                        vm.channelAgentAssortments = result.channelAgentAssortments;
                    });
                    vm.getPictureTemplates();
                }
                init();
            }
        ]);
})();