(function () {
    var controllerId = 'app.manager.product.createOrEdit';
    appModule.controller(controllerId,
        ['$scope', '$uiModal', 'infrastructure.services.app.productForTenant', 'infrastructure.services.app.channelAgentForEnd', 'infrastructure.services.app.freightTemplate', '$stateParams', '$state',
            function ($scope, $uiModal, productForTenantService, channelAgentService,freightTemplateService, $stateParams, $state) {
                var vm = this;
                vm.product = null;
                vm.productCategorys = [];
                vm.freightTemplates = [];
                vm.templates = [{
                    value:1,
                    name:app.localize("DetailTemplate"),
                }, {
                    value: 2,
                    name: app.localize("ArticleTemplate"),
                }];
                vm.virtualProductTypes = [{
                    value: 0,
                    name: app.localize("VirtualCard"),
                }, {
                    value: 1,
                    name: app.localize("Coupons"),
                }];
                vm.channelAgents = [];
                vm.getChannelAgents = function () {
                    channelAgentService.getAll({
                    }).then(function (result) {
                        vm.channelAgents = result.data.items;
                    });
                };
                vm.saving = false;
                vm.buyWhens = [
                    { name: "NoLimit", value: 0 },
                    { name: "First", value: 1 },
                    { name: "Next", value: 2 },
                ];
                vm.customCustomerInfoTypes = [
                   { name: "Text", value: 0 },
                   { name: "PhoneNumber", value: 1 },
                   { name: "Picture", value: 2 },
                   { name: "DateTime", value: 3 },
                ];
                vm.specificationPropertys = [];
                vm.specifications = [];
                vm.distributions = [];
                vm.channelAgentProductDistributions = [];
                vm.properties = [];
                vm.productUnits = [];
                vm.customCustomerInfos = [];
                vm.openMediaIdOfImageSelector = function () {
                    var modalInstance = $uiModal.open({
                        fullPage: true,
                        autoCreateFrame: false,
                        templateUrl: '/Areas/Manager/Views/Tenant/PublicWechat/Common/mediaIdOfImageSelectorModal.cshtml',
                        controller: "app.manager.publicWechat.common.mediaIdOfImageSelectorModal as vm",
                    });
                    modalInstance.result.then(function (result) {
                        vm.product.masterQrcode = result.media_id;
                    });
                };
                vm.getSpecificationPropertyName = function (propertyValue) {

                    vm.specificationPropertys.forEach(function (specificationProperty) {

                        if (specificationProperty.id == propertyValue.specificationPropertyId) {
                            return specificationProperty.name;
                        }
                    })
                };
                vm.getFreightTemplates = function () {
                    freightTemplateService.getAll().success(function (result) {
                        vm.freightTemplates = result.items;
                    });
                };
                vm.addSpecificationProperty = function (specificationProperty) {

                    if (!specificationProperty) {
                        return;
                    }

                    for (var i = 0; i < vm.product.specificationPropertys.length; i++) {

                        if (vm.product.specificationPropertys[i].id == specificationProperty.id) {
                            return false;
                        }
                    }
                    vm.product.specificationPropertys.push(specificationProperty);
                    vm.specifications.forEach(function (specification) {
                        specification.propertyValues.push({
                            specificationProperty: specificationProperty,
                            specificationPropertyId: specificationProperty.id,
                            value: ""
                        });
                    });
                };
                vm.removeSpecificationProperty = function (index) {

                    if (vm.specifications.length) {
                        infrastructure.message.error(app.localize("ThereHasSpecification"));
                        return;
                    }
                    infrastructure.message.confirm(app.localize("AreYouSure"), function () {

                        $scope.$apply(function () {
                            vm.product.specificationPropertys.splice(index, 1);
                        });
                    });
                };
                vm.addSpecification = function () {

                    if (!vm.product.specificationPropertys.length) {
                        infrastructure.message.error(app.localize("PleaseAddSpecificationPropertyFirst"));
                        return;
                    }
                    var specification = {
                        stock: 0,
                        propertyValues: []
                    };
                    vm.product.specificationPropertys.forEach(function (specificationProperty) {
                        specification.propertyValues.push({
                            specificationProperty: specificationProperty,
                            specificationPropertyId: specificationProperty.id,
                            value: ""
                        });
                    });
                    vm.specifications = vm.specifications || [];
                    vm.specifications.push(specification);
                };
                vm.removeSpecification = function (index) {
                    var specification = vm.specifications[index];

                    infrastructure.message.confirm(app.localize("AreYouSure"), function () {

                        $scope.$apply(function () {

                            if (specification.id) {
                                productForTenantService.removeSpecification({
                                    id: specification.id
                                }).then(function (result) {
                                    vm.specifications.splice(index, 1);
                                });
                            }
                            else {
                                vm.specifications.splice(index, 1);
                            }
                            vm.specifications.splice(index, 1);
                        });
                    });
                };
                vm.addProperty = function () {
                    var property = {
                        name: '',
                        value: '',
                    };
                    vm.properties = vm.properties || [];
                    vm.properties.push(property);
                };
                vm.removeProperty = function (index) {
                    var property = vm.properties[index];

                    if (property.id) {
                        productForTenantService.removeProperty({
                            id: property.id
                        }).then(function (result) {
                            vm.properties.splice(index, 1);
                        });
                    }
                    else {
                        vm.properties.splice(index, 1);
                    }
                };
                vm.addProductUnit = function () {
                    var productUnit = {
                        name: '',
                        ratio: 1,
                    };
                    vm.productUnits = vm.productUnits || [];
                    vm.productUnits.push(productUnit);
                };
                vm.removeProductUnit = function (index) {
                    var productUnit = vm.productUnits[index];

                    if (productUnit.id) {
                        productForTenantService.removeProductUnit({
                            id: productUnit.id
                        }).then(function (result) {
                            vm.productUnits.splice(index, 1);
                        });
                    }
                    else {
                        vm.productUnits.splice(index, 1);
                    }
                };
                vm.addDistribution = function () {
                    var distribution = {
                        level: 0,
                        money: 0,
                        ratio: 0
                    };
                    vm.distributions = vm.distributions || [];
                    vm.distributions.push(distribution);
                };
                vm.removeDistribution = function (index) {
                    var distribution = vm.distributions[index];

                    if (distribution.id) {
                        productForTenantService.removeDistribution({
                            id: distribution.id
                        }).then(function (result) {
                            vm.distributions.splice(index, 1);
                        });
                    }
                    else {
                        vm.distributions.splice(index, 1);
                    }
                };
                vm.addChannelAgentProductDistribution = function () {
                    var distribution = {
                        level: 0,
                        money: 0,
                        ratio: 0
                    };
                    vm.channelAgentProductDistributions = vm.channelAgentProductDistributions || [];
                    vm.channelAgentProductDistributions.push(distribution);
                };
                vm.removeChannelAgentProductDistribution = function (index) {
                    var distribution = vm.channelAgentProductDistributions[index];

                    if (distribution.id) {
                        productForTenantService.removeChannelAgentProductDistribution({
                            id: distribution.id
                        }).then(function (result) {
                            vm.channelAgentProductDistributions.splice(index, 1);
                        });
                    }
                    else {
                        vm.channelAgentProductDistributions.splice(index, 1);
                    }
                };
                vm.addCustomCustomerInfo = function () {
                    var customCustomerInfo = {
                        required: true,
                        type:vm.customCustomerInfoTypes[0].value
                    };
                    vm.customCustomerInfos = vm.customCustomerInfos || [];
                    vm.customCustomerInfos.push(customCustomerInfo);
                };
                vm.removeCustomCustomerInfo = function (index) {
                    var customCustomerInfo = vm.customCustomerInfos[index];

                    if (customCustomerInfo.id) {
                        productForTenantService.removeCustomCustomerInfo({
                            id: customCustomerInfo.id
                        }).then(function (result) {
                            vm.customCustomerInfos.splice(index, 1);
                        });
                    }
                    else {
                        vm.customCustomerInfos.splice(index, 1);
                    }
                };
                vm.createOrEdit = function () {
                    vm.saving = true;
                    var product = vm.product;

                    if (!product.specificationPropertys || !product.specificationPropertys.length) {
                        infrastructure.message.error(app.localize('PleaseAddAtLeastOneSpecificationProperty'));
                        return false;
                    }

                    if (!vm.specifications || !vm.specifications.length) {
                        infrastructure.message.error(app.localize('PleaseAddAtLeastOneSpecification'));
                        return false;
                    }
                    productForTenantService.createOrEdit({
                        product: vm.product,
                        specifications: vm.specifications,
                        distributions: vm.distributions,
                        channelAgentProductDistributions:vm.channelAgentProductDistributions,
                        properties: vm.properties,
                        productUnits: vm.productUnits,
                        customCustomerInfos:vm.customCustomerInfos
                    }).then(function () {
                        infrastructure.notify.success(app.localize('SaveSuccessfully'));
                        $state.go("product.index");
                    }).finally(function () {
                        vm.saving = false;
                    });
                };

                vm.getProductForCreateOrEdit = function () {
                    productForTenantService.getProductForCreateOrEdit({
                        id: $stateParams.id
                    }).then(function (result) {
                        vm.product = result.data.product;
                        vm.product.specificationPropertys = vm.product.specificationPropertys ? vm.product.specificationPropertys : [];
                        vm.productCategorys = result.data.productCategorys;
                        vm.specificationPropertys = result.data.specificationPropertys;
                        vm.specifications = result.data.specifications || [];
                        vm.distributions = result.data.distributions;
                        vm.channelAgentProductDistributions = result.data.channelAgentProductDistributions;
                        vm.properties = result.data.properties;
                        vm.productUnits = result.data.productUnits;
                        vm.customCustomerInfos = result.data.customCustomerInfos;
                    });
                };
                function init() {
                    vm.getChannelAgents();
                    vm.getProductForCreateOrEdit();
                    vm.getFreightTemplates();
                }
                init();
            }
        ]);
})();