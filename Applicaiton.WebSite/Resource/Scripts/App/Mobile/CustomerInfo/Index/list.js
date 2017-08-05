(function () {
    var controllerId = 'app.mobile.customerInfo.list';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.customerInfo',
        function ($scope, customerInfoService) {
            var vm = this;
            vm.customerInfos = null;
            vm.returnUrl = document.getElementById("returnUrl").value;
            vm.getCustomerInfos = function () {
                customerInfoService.getAllOfPage({
                    pageIndex: 1,
                    pageSize:10,
                }).success(function (result) {
                    vm.customerInfos = result.items;
                });
            };
            vm.select = function (customerInfo) {

                if (vm.returnUrl) {
                    var returnUrl=vm.returnUrl;

                    if (returnUrl.indexOf("customerInfoId") > 0) {
                        returnUrl = returnUrl.replace(/(?![?&])(customerInfoId)=\w+/gi, "customerInfoId=" + customerInfo.id);
                    }
                    else if (returnUrl.indexOf("?") > 0) {
                        returnUrl = returnUrl + "&customerInfoId=" + customerInfo.id;
                    }
                    else {
                        returnUrl = returnUrl + "?customerInfoId=" + customerInfo.id;
                    }
                    window.location.href = returnUrl;
                }
                $scope.$broadcast('selectCustomerInfo', { customerInfo: customerInfo });
            };
            vm.setAsDefault = function (customerInfo) {
                infrastructure.ui.setBusy();
                customerInfoService.setAsDefault({
                    id: customerInfo.id
                }).success(function (result) {
                    vm.customerInfos.forEach(function (customerInfoItem) {

                        if (customerInfoItem.isDefault) {
                            customerInfoItem.isDefault = false;
                        }
                        return false;
                    });
                    customerInfo.isDefault = true;
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            vm.delete = function (customerInfo, index) {
                $.confirm(app.localize("EnsureDelete"), function () {
                    infrastructure.ui.setBusy();
                    customerInfoService.delete({
                        id: customerInfo.id
                    }).success(function (result) {
                        vm.customerInfos.splice(index,1);
                    }).finally(function () {
                        infrastructure.ui.clearBusy();
                    });
                });
            };
            function initialize() {
                vm.getCustomerInfos();
            }
            initialize();
        }]);
})();