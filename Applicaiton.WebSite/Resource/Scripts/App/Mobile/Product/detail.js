(function () {
    var SubmitMode = {
        Cart: 1,
        Buy: 2
    };
    var controllerId = 'app.mobile.product.detail';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.productForFront', 'infrastructure.services.app.shopCartForFront', 'infrastructure.services.app.productOrder', 'infrastructure.services.app.share',
        function ($scope, productService, shopCartService,orderService,shareService) {
            var vm = this;
            vm.id = document.getElementById("id").value;
            vm.product = null;
            vm.comments = null;
            vm.submitMode = null;
            vm.isSubmitting = false;
            vm.selectedSpecification = null;
            vm.selectedSpecifications = [];
            vm.specificationPropertyGroupList = {};
            vm.unSelectedSpecificationPropertyGroups = [];
            vm.count = 0;
            vm.getProduct = function () {
                infrastructure.ui.setBusy();
                productService.getProduct({ id: vm.id }).success(function (result) {
                    vm.product = result;
                    vm.initializeShare();
                    vm.initializeProduct();
                    infrastructure.ui.clearBusy();
                });
            };
            vm.getComments = function () {
                $('#commentList').table({
                    paging: true,
                    actions: {
                        listAction: {
                            method: productService.getComments,
                            parameters:{ productId: vm.id },
                            callback: function (result) {
                                vm.comments = result.items;
                            },
                            getTotalCountFromResult: function (result) {
                                return result.totalCount;
                            }
                        }
                    }
                });
            };
            vm.initializeProduct = function () {
                vm.selectSpecification(vm.product.specifications[0]);
            };
            vm.initializeShare = function () {
                var sharePicture = vm.product.sharePicture;

                if (!sharePicture) {
                    sharePicture = vm.product.specifications[0]?vm.product.specifications[0].picture : null;
                }
                sharePicture = "http://" + window.location.host + sharePicture;
                shareService.getPreShare().success(function (result) {
                    initShare({
                        preShareData: result,
                        title:vm.product.shareTitle||vm.product.name,
                        imgUrl: sharePicture,
                        desc: vm.product.shareDescription||vm.product.name,
                    });
                });
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
            vm.decreaseCount = function () {

                if (vm.count >0) {
                    vm.count--;
                }
            };
            vm.increaseCount = function () {

                if (vm.count <vm.selectedSpecification.stock) {
                    vm.count++;
                }
            };
            vm.isDisableDecreaseCount = function () {

                if (vm.count <= 1) {
                    return true;
                }
                return false;
            };
            vm.isDisableIncreaseCount = function () {

                if (!vm.selectedSpecification) {
                    return true;
                }

                if (vm.count >= vm.selectedSpecification.stock) {
                    return true;
                }
                return false;
            };
            vm.submit = function () {

                if (vm.submitMode == SubmitMode.Buy) {
                    vm.isSubmitting = true;
                    var parametersString = "productId=" + vm.product.id + "&specificationId=" + vm.selectedSpecification.id+"&count="+vm.count;
                    window.location.href="/Mobile/Order/confirmOrder?"+parametersString;
                }
                else {
                    vm.isSubmitting = true;
                    var data = {
                        specificationId: vm.selectedSpecification.id,
                        count: vm.count
                    };
                    shopCartService.addItem(data).success(function (result) {
                        infrastructure.toast.success(app.localize("AddSuccessfully"));
                        vm.closeSpecificationSelector();
                    }).finally(function () {
                        vm.isSubmitting = false;
                    });
                }
            };

            function initialize() {
                vm.getProduct();
            }
            initialize();
        }]);
})();