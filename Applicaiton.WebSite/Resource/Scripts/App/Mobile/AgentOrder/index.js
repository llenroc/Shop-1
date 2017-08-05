/// <reference path="H:\Project\Personal\Shop\Applicaiton.WebSite\Content/Infrastructure/Framework/Scripts/infrastructure.js" />
/// <reference path="../../../Common/app.js" />
(function () {
    var controllerId = 'app.mobile.agentOrder.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.agentOrder', 'infrastructure.services.app.productForFront',
        function ($scope,orderService,productService) {
            var vm = this;
            vm.boughtItems = [];
            vm.isNeedLogistics = false;
            vm.loaded = false;
            vm.customerInfo = null;
            vm.customCustomerInfos = [];
            vm.specifications = [];
            vm.noteOfCustomer = null;
            vm.money = 0;
            vm.postage = 0;
            vm.minAgentOrderMoney = 0;
            vm.getMinAgentOrderMoney = function () {
                orderService.getMinAgentOrderMoney().success(function (result) {
                    vm.minAgentOrderMoney = result;
                });
            }
            vm.getSpecifications = function () {
                productService.getSpecificationForAgentOrder().success(function (result) {
                    vm.specifications = result.items;

                    if (vm.specifications.length) {
                        vm.selectedSpecification = vm.specifications[0];
                        vm.addBoughtItem();
                    }
                }).error(function () {
                });
            };
            vm.addBoughtItem = function () {

                for (var i in vm.boughtItems) {

                    if (vm.boughtItems[i].specificationId == vm.selectedSpecification.id) {
                        infrastructure.message.error(app.localize("YouHasAddThisSpecification"));
                        return;
                    }
                }
                var boughtItem = {
                    specificationId: vm.selectedSpecification.id,
                    specification: vm.selectedSpecification,
                    count:1,
                };
                var boughtItems = deepClone(vm.boughtItems);
                boughtItems.push(boughtItem);
                vm.confirmOrder(boughtItems);
            };
            vm.removeBoughtItem = function (index) {
                vm.boughtItems.splice(index, 1);
                vm.confirmOrder();
            };
            vm.changeCount = function (boughtItem) {

                if (boughtItem.count <= 0) {
                    boughtItem.count = 1;
                }

                if (boughtItem.count > boughtItem.specification.stock) {
                    boughtItem.count = boughtItem.specification.stock;
                }
                vm.confirmOrder();
            };

            function parseUnit(boughtItem) {

                if (!boughtItem.specification.product.productUnits.length) {
                    boughtItem.specification.product.productUnits = [
                        {
                            name: "",
                            ratio:1
                        }
                    ]
                }
                else {
                    boughtItem.specification.product.productUnits.sort(function (a, b) {
                        return b.ratio - a.ratio;
                    });
                }
                var count = boughtItem.count;
                boughtItem.specification.product.productUnits.forEach(function (productUnit) {
                    productUnit.count = parseInt(count / productUnit.ratio);
                    count = count % productUnit.ratio;
                });
            }

            function computeCount(boughtItem) {
                var count = 0;
                boughtItem.specification.product.productUnits.forEach(function (productUnit) {
                    count += productUnit.count;
                });
                boughtItem.count = count;
            }
            vm.confirmOrder = function (boughtItems) {
                var data;
                
                if (boughtItems) {
                    data = {
                        boughtItems: boughtItems,
                        customerInfoId: document.getElementById("customerInfoId").value,
                    };
                }
                else if (vm.boughtItems.length) {
                    data = {
                        boughtItems: vm.boughtItems,
                        customerInfoId: document.getElementById("customerInfoId").value,
                    };
                }
                else {
                    return;
                }
                infrastructure.ui.setBusy();
                orderService.confirmOrder(data).success(function (result) {
                    vm.boughtItems = result.boughtItems;
                    vm.boughtItems.forEach(function (boughtItem) {
                        parseUnit(boughtItem);
                    })
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
            vm.decreaseCount = function (boughtItem,productUnit) {
                var count = boughtItem.count - productUnit.ratio;

                if (count <= 0) {
                    return false;
                }
                productUnit.count--;
                boughtItem.count=count;
                vm.confirmOrder();
            };
            vm.increaseCount = function (boughtItem, productUnit) {
                var count = boughtItem.count + productUnit.ratio;

                if (count > boughtItem.specification.stock) {
                    infrastructure.toast.error(app.localize("StockOverflow"));
                    return false;
                }
                productUnit.count++;
                boughtItem.count = count;
                vm.confirmOrder();
            };
            vm.submit = function () {

                if (vm.money < vm.minAgentOrderMoney) {
                    infrastructure.toast.error(app.localize("MinAgentOrderMoneyNote", vm.minAgentOrderMoney));
                    return;
                }
                var data = {
                    boughtItems: vm.boughtItems,
                    noteOfCustomer: vm.noteOfCustomer,
                    customerInfoId: vm.customerInfo ? vm.customerInfo.id : null
                };
                data.orderCustomCustomerInfos = vm.customCustomerInfos.map(function (customCustomerInfo) {
                    return {
                        customCustomerInfoId: customCustomerInfo.id,
                        value: customCustomerInfo.value
                    };
                });
                var loading=infrastructure.ui.loading(app.localize("Submitting"));
                orderService.createOrder(data).success(function (result) {
                    window.location.href = "/Mobile/Pay/Index?id=" + result.id;
                }).error(function () {
                    loading.hide();
                });
            };
            function initialize() {
                vm.getMinAgentOrderMoney();
                vm.getSpecifications();
            };
            initialize();
        }]);
})();