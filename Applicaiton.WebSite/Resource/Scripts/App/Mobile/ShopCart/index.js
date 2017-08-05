(function () {
    var controllerId = 'app.mobile.shopCart.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.shopCartForFront', 'infrastructure.services.app.productOrder',
        function ($scope, shopCartService, orderService) {
            var vm = this;
            vm.shopCartItems = null;
            vm.money = 0;
            vm.isLoading = false;
            vm.getShopCart = function () {
                vm.isLoading = true;
                shopCartService.getShopCart().success(function (result) {
                    vm.shopCartItems = result.shopCartItems;
                }).finally(function () {
                    vm.isLoading = false;
                });
            };
            vm.syncCountOfShopCartItem = function (id, count, callback) {
                infrastructure.ui.setBusy();
                shopCartService.setCount({
                    id: id,
                    count: count
                }).success(function (result) {
                    callback.call(vm);
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            vm.removeItem = function (index) {
                var shopCartItem = vm.shopCartItems[index];
                infrastructure.ui.setBusy();
                shopCartService.removeItem({
                    id: shopCartItem.id,
                }).success(function (result) {
                    vm.shopCartItems.splice(index,1);
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            }
            vm.changeCount = function (shopCartItem) {
                var count = shopCartItem.count;

                if (count <= 0) {
                    count = 1;
                }

                if (count > shopCartItem.specification.stock) {
                    count = shopCartItem.specification.stock;
                }
                vm.syncCountOfShopCartItem(shopCartItem.id,count, function () {
                    shopCartItem.count = count;
                });
            };
            vm.decreaseCount = function (shopCartItem) {
                var count = shopCartItem.count - 1;

                if (count <= 0) {
                    return false;
                }
                vm.syncCountOfShopCartItem(shopCartItem.id, count, function () {
                    shopCartItem.count = count;
                });
            };
            vm.increaseCount = function (shopCartItem) {
                var count = shopCartItem.count + 1;

                if (count > shopCartItem.specification.stock) {
                    return false;
                }
                vm.syncCountOfShopCartItem(shopCartItem.id, count, function () {
                    shopCartItem.count = count;
                });
            };
            function initialize() {
                vm.getShopCart();
            };
            initialize();
        }]);
})();