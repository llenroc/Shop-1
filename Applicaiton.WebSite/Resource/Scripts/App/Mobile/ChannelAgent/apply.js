(function () {
    var controllerId = 'app.mobile.channelAgent.apply';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.channelAgencyApplyOrder','appSession',
        function ($scope, orderService, appSession) {
            var vm = this;
            vm.channelAgentId = document.getElementById("channelAgentId").value;
            vm.isNeedLogistics = false;
            vm.loaded = false;
            vm.userDetail = appSession.user.userDetail;
            vm.customerInfo = null;
            vm.customCustomerInfos = [];
            vm.noteOfCustomer = null;
            vm.confirmOrder = function () {
                var data = {
                    channelAgentId: vm.channelAgentId,
                };
                infrastructure.ui.setBusy();
                orderService.confirmOrder(data).success(function (result) {
                    vm.boughtItems = result.boughtItems;
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
                    channelAgentId:vm.channelAgentId,
                    noteOfCustomer: vm.noteOfCustomer,
                    customerInfoId: vm.customerInfo ? vm.customerInfo.id : null,
                    userDetail: vm.userDetail
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
                vm.confirmOrder();
            };
            initialize();
        }]);
})();