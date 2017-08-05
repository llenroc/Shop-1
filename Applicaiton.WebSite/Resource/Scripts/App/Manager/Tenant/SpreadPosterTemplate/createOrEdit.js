(function () {
    var controllerId = 'app.manager.spreadPosterTemplate.createOrEdit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.spreadPosterTemplate', '$stateParams', '$state',
            function ($scope, spreadPosterTemplateService, $stateParams, $state) {
                var vm = this;
                vm.spreadPosterTemplate = null;
                vm.parameterTypeToAdd = "avatar";
                vm.parameterTypes = [
                    {
                        name: "Text",
                        value:0
                    },
                    {
                        name: "Picture",
                        value: 1
                    }
                ];
                vm.getSpreadPosterTemplateForCreateOrEdit = function () {
                    spreadPosterTemplateService.getSpreadPosterTemplateForCreateOrEdit({
                        id: $stateParams.id
                    }).success(function (result) {
                        vm.spreadPosterTemplate = result;
                    });
                };
                vm.addParameter = function () {
                    var parameter = {
                        coordinate: {
                            startX: null,
                            startY: null,
                            width: null,
                            height:null
                        }
                    };

                    switch (vm.parameterTypeToAdd) {
                        case "avatar":
                            parameter.displayName =app.localize("Avatar");
                            parameter.name = "avatar";
                            parameter.type = vm.parameterTypes[1].value;
                            break;
                        case "nickName":
                            parameter.displayName = app.localize("NickName");
                            parameter.name = "nickName";
                            parameter.type = vm.parameterTypes[0].value;
                            parameter.fontStyle = {
                                size: 24
                            };
                            break;
                        case "qrcode":
                            parameter.displayName =app.localize("Qrcode");
                            parameter.name = "qrcode";
                            parameter.type = vm.parameterTypes[1].value;
                            break;
                    }

                    if (!vm.spreadPosterTemplate.parameters) {
                        vm.spreadPosterTemplate.parameters=[];
                    }
                    vm.spreadPosterTemplate.parameters.push(parameter);
                };
                vm.deleteParameter = function (index) {
                    vm.spreadPosterTemplate.parameters.splice(index);
                };
                vm.save = function () {
                    spreadPosterTemplateService.createOrEdit(vm.spreadPosterTemplate).success(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $state.go("spreadPosterTemplate.index");
                    });
                };
                function initialize() {
                    vm.getSpreadPosterTemplateForCreateOrEdit();
                };
                initialize();
            }
        ]);
})();