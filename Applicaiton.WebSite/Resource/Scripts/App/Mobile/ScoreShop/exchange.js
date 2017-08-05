(function () {
    var SubmitMode = {
        Buy: 1,
    };

    var controllerId = 'app.mobile.scoreShop.exchange';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.productForFront',
        'infrastructure.services.app.scoreExchangeOrder',
        function ($scope, productService, orderService) {
            var vm = this;
            vm.productId = document.getElementById("productId").value;
            vm.product = null;
            vm.isSubmitting = false;
            vm.customerInfo = null;
            vm.isNeedLogistics = false;
            vm.boughtItems = [];
            vm.customCustomerInfos = [];
            vm.noteOfCustomer = null;
            vm.selectedSpecification = null;
            vm.selectedSpecifications = [];
            vm.specificationPropertyGroupList = {};
            vm.unSelectedSpecificationPropertyGroups = [];
            vm.money = 0;
            vm.count = 0;
            vm.getProduct = function () {
                infrastructure.ui.setBusy();
                productService.getProduct({ id: vm.productId }).success(function (result) {
                    vm.product = result;
                    vm.initializeProduct();
                    vm.confirmOrder();
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            vm.initializeProduct = function () {
                vm.selectSpecification(vm.product.specifications[0]);
            };
            vm.selectSpecification = function (specification) {

                for (var i = 0; i < vm.product.specificationPropertyGroups.length; i++) {

                    for (j = 0; j < vm.product.specificationPropertyGroups[i].specificationPropertyValues.length; j++) {

                        for (var k = 0; k < specification.propertyValues.length; k++) {

                            if (vm.product.specificationPropertyGroups[i].specificationPropertyValues[j].specificationPropertyId == specification.propertyValues[k].specificationPropertyId &&
                                vm.product.specificationPropertyGroups[i].specificationPropertyValues[j].value == specification.propertyValues[k].value) {
                                vm.selectPropertyValue(vm.product.specificationPropertyGroups[i], vm.product.specificationPropertyGroups[i].specificationPropertyValues[j]);
                            }
                        }
                    }
                }
                vm.setSeletedSpecification(specification);
            };
            vm.setSeletedSpecification = function (specification) {
                vm.selectedSpecification = specification;

                if (specification) {

                    if (vm.count > specification.stock) {
                        vm.count = specification.stock;
                    }
                    else if (specification.stock > 0 && vm.count == 0) {
                        vm.count = 1;
                    }
                }
            };
            vm.getSpecificationsFromPropertyValues = function (propertyValues) {
                var specifications = [];

                for (var i = 0; i < vm.product.specifications.length; i++) {
                    var flag = true;


                    for (var j = 0; j < vm.product.specifications[i].propertyValues.length; j++) {

                        if (propertyValues[vm.product.specifications[i].propertyValues[j].specificationPropertyId] &&
                            propertyValues[vm.product.specifications[i].propertyValues[j].specificationPropertyId] != vm.product.specifications[i].propertyValues[j].value) {
                            flag = false;
                            break;
                        }
                    }

                    if (flag) {
                        specifications.push(vm.product.specifications[i]);
                    }
                }
                return specifications;
            };
            vm.cartHandler = function () {
                vm.submitMode = SubmitMode.Cart;
                infrastructure.ui.block();
            };
            vm.buyHandler = function () {
                vm.submitMode = SubmitMode.Buy;
                infrastructure.ui.block();
            };
            vm.closeSpecificationSelector = function () {
                vm.submitMode = null;
                infrastructure.ui.unblock();
            };
            vm.propertyValueClickHandler = function (specificationPropertyGroup, specificationPropertyValue) {

                if (specificationPropertyGroup.selectedSpecificationPropertyValue &&
                    specificationPropertyGroup.selectedSpecificationPropertyValue == specificationPropertyValue) {

                    specificationPropertyGroup.selectedSpecificationPropertyValue = null;
                    vm.selectedSpecification = null;
                }
                else {
                    vm.selectPropertyValue(specificationPropertyGroup, specificationPropertyValue);
                    var propertyValues = {};

                    for (var i = 0; i < vm.product.specificationPropertyGroups.length; i++) {

                        if (specificationPropertyGroup == vm.product.specificationPropertyGroups[i]) {
                            propertyValues[specificationPropertyValue.specificationPropertyId] = specificationPropertyValue.value;
                        }
                        else if (vm.product.specificationPropertyGroups[i].selectedSpecificationPropertyValue) {
                            propertyValues[vm.product.specificationPropertyGroups[i].selectedSpecificationPropertyValue.specificationPropertyId] = vm.product.specificationPropertyGroups[i].selectedSpecificationPropertyValue.value;
                        }
                    }
                    vm.selectedSpecifications = vm.getSpecificationsFromPropertyValues(propertyValues);

                    if (vm.selectedSpecifications.length == 1) {
                        vm.setSeletedSpecification(vm.selectedSpecifications[0]);
                    }
                    else {
                        vm.setSeletedSpecification(null);
                        infrastructure.message.error(app.localize("ThereIsNoThisSpecification"));
                    }
                }

            }
            vm.selectPropertyValue = function (specificationPropertyGroup, specificationPropertyValue) {
                specificationPropertyGroup.selectedSpecificationPropertyValue = specificationPropertyValue;
            };
            vm.decreaseCount = function (boughtItem) {

                if (boughtItem.count > 0) {
                    boughtItem.count--;
                    vm.confirmOrder();
                }
            };
            vm.increaseCount = function (boughtItem) {

                if (boughtItem.count < boughtItem.specification.stock) {
                    boughtItem.count++;
                    vm.confirmOrder();
                }
            };
            vm.isDisableDecreaseCount = function (boughtItem) {

                if (boughtItem.count <= 1) {
                    return true;
                }
                return false;
            };
            vm.isDisableIncreaseCount = function (boughtItem) {

                if (boughtItem.count >= boughtItem.specification.stock) {
                    return true;
                }
                return false;
            };
            vm.confirmOrder = function () {
                var data;

                if (vm.boughtItems.length) {
                    data = {
                        boughtItems: vm.boughtItems,
                        customerInfoId: document.getElementById("customerInfoId").value,
                    };
                }
                else {
                    var specificationId = vm.selectedSpecification.id || vm.product.specifications[0].id;
                    data = {
                        boughtItems: [
                            {
                                specificationId: specificationId,
                                count: vm.count,
                            }
                        ],
                        customerInfoId: document.getElementById("customerInfoId").value,
                    };
                }
                infrastructure.ui.setBusy();
                orderService.confirmOrder(data).success(function (result) {
                    vm.boughtItems = result.boughtItems;
                    vm.money = result.money;
                    vm.postage = result.postage;
                    vm.customerInfo = result.customerInfo;
                    vm.customCustomerInfos = result.customCustomerInfos;
                    vm.isNeedLogistics = result.isNeedLogistics;
                    vm.loaded = true;
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            vm.submit = function () {
                var data = {
                    boughtItems: [{
                        specificationId: vm.boughtItems[0].specificationId,
                        count: vm.boughtItems[0].count,
                    }],
                    noteOfCustomer: vm.noteOfCustomer,
                    customerInfoId: vm.customerInfo ? vm.customerInfo.id : null
                };
                data.orderCustomCustomerInfos = vm.customCustomerInfos.map(function (customCustomerInfo) {
                    return {
                        customCustomerInfoId: customCustomerInfo.id,
                        value: customCustomerInfo.value
                    };
                });
                var loading = infrastructure.toast.loading(app.localize("Submitting"));

                orderService.createOrder(data).success(function (result) {

                    if (result.PayMoney > 0) {
                        window.location.href = "/Mobile/Pay/Index?id=" + result.id;
                    }
                    else {
                        window.location.href = "/Mobile/Order/Detail?id=" + result.id;
                    }
                }).error(function () {
                    loading.hide();
                });
            };

            function initialize() {
                vm.getProduct();
            }
            initialize();
        }]);
})();