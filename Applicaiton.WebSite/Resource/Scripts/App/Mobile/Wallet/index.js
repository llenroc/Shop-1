(function () {
    var controllerId = 'app.mobile.wallet.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.wallet', 
        function ($scope, walletService) {
            var vm = this;
            vm.walletInfo = null;
            vm.isWithdrawing = false;
            vm.getWalletInfo = function () {
                walletService.getWalletInfo().success(function (result) {
                    vm.walletInfo = result;
                });
            };
            vm.withdraw = function () {
                vm.isWithdrawing = true;
                walletService.withdraw().success(function (result) {
                    infrastructure.message.success(app.localize("SuccessfullyWithdraw"));
                    vm.getWalletInfo();
                }).finally(function (result) {
                    vm.isWithdrawing = false;
                });
            };
            function initiallize() {
                vm.getWalletInfo();
            }
            initiallize();
        }]);
})();