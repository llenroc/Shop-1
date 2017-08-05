(function () {
    var controllerId = 'app.manager.pictureTemplate.createOrEdit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.pictureTemplate', '$stateParams', '$state',
            function ($scope, pictureTemplateService, $stateParams, $state) {
                var vm = this;
                vm.pictureTemplate = null;
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
                vm.getPictureTemplateForCreateOrEdit = function () {
                    pictureTemplateService.getPictureTemplateForCreateOrEdit({
                        id: $stateParams.id
                    }).success(function (result) {
                        vm.pictureTemplate = result;
                    });
                };
                vm.addParameter = function () {
                    var parameter = {
                        coordinate: {
                            startX: null,
                            startY: null,
                            width: null,
                            height:null
                        },
                        fontStyle: {
                            size: 24
                        }
                    };

                    if (!vm.pictureTemplate.parameters) {
                        vm.pictureTemplate.parameters=[];
                    }
                    vm.pictureTemplate.parameters.push(parameter);
                };
                vm.deleteParameter = function (index) {
                    vm.pictureTemplate.parameters.splice(index,1);
                };
                vm.save = function () {
                    pictureTemplateService.createOrEdit(vm.pictureTemplate).success(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $state.go("pictureTemplate.index");
                    });
                };
                function initialize() {
                    vm.getPictureTemplateForCreateOrEdit();
                };
                initialize();
            }
        ]);
})();