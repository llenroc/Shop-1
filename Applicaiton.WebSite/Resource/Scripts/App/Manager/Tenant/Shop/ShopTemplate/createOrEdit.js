(function () {
    var controllerId = 'app.manager.shopTemplate.createOrEdit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.shopTemplate', 'infrastructure.services.app.productCategoryForFront', '$stateParams', '$state',
            function ($scope, shopTemplateService,productCategoryService, $stateParams, $state) {
                var vm = this;
                vm.shopTemplate = null;
                vm.preControl = null;
                vm.controls = [];
                vm.globalControl = {};
                vm.selectedControl = null;
                vm.controleOptions = [RichTextControl, PictureAdControl, NavControl, SliderControl, ProductListControl, ShopwindowControl];
                vm.productListMaxCountOptions = [2, 4, 8, 16];
                vm.productCategories = [];
                vm.productListStyleOptions = productListStyleOptions;
                vm.getShopTemplateForCreateOrEdit = function () {
                    shopTemplateService.getShopTemplateForCreateOrEdit({
                        id: $stateParams.id
                    }).success(function (result) {
                        vm.shopTemplate = result;

                        if (result.template) {
                            var controls = JSON.parse(result.template);
                            controls.forEach(function (control) {
                                vm.controls.push(new window[control.name](control));
                            });
                        }
                    });
                };
                vm.productCategories = function () {
                    productCategoryService.gets().success(function (result) {
                        vm.productCategories = result.items;
                    });
                };
                vm.getTemplateUrl = function (control) {
                    var templateUrl = '~/Areas/Mobile/Views/Home/ControlTemplates/' + control.name + ".cshtml";
                    return templateUrl;
                };
                vm.selectControl = function (control) {

                    if (vm.selectedControl)
                        vm.selectedControl.selected = false;

                    vm.selectedControl = control;
                    control.selected = true;
                };
                vm.selectControlOption = function (preControl) {
                    vm.preControl = preControl;
                };
                vm.addControl = function (controlType) {
                    var control = new controlType();

                    if (vm.preControl==vm.globalControl) {
                        vm.controls.push(control);
                    }
                    else {
                        vm.controls.splice(vm.controls.indexOf(vm.preControl) + 1, 0, control);
                    }
                    vm.preControl = null;

                    if (vm.selectedControl) {
                        vm.selectedControl.selected = false;
                    }
                    control.selected = true;
                    vm.selectedControl = control;
                };
                vm.removeControl = function (index) {
                    vm.controls.splice(index, 1);
                };
                vm.addItemOfNavControl = function (control) {
                    control.addItem();
                };
                vm.removeItemOfNavControl = function (control,index) {
                    control.removeItem(index);
                };
                vm.addItemOfSliderControl = function (control) {
                    control.addItem();
                };
                vm.removeItemOfSliderControl = function (control, index) {
                    control.removeItem(index);
                };
                vm.save = function () {
                    vm.shopTemplate.template = JSON.stringify(vm.controls); 
                    shopTemplateService.createOrUpdateShopTemplate(vm.shopTemplate).success(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $state.go("shopTemplate.index");
                    });
                };
                function initialize() {
                    vm.getShopTemplateForCreateOrEdit();
                    vm.productCategories();
                };
                initialize();
            }
        ]);
})();