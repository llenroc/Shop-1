(function () {
    var controllerId = 'app.mobile.home.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.shopTemplate', 'infrastructure.services.app.productForFront', 'infrastructure.services.app.shopCartForFront', 'infrastructure.services.app.session', 'infrastructure.services.app.share',
        function ($scope,shopTemplateService, productService, shopCartService, sessionService, shareService) {
            var vm = this;
            vm.shop = null;
            vm.controls = [];
            vm.shopTemplate = null;
            vm.getShopTemplate = function () {
                shopTemplateService.getShopTemplateOfShopAsync().success(function (result) {

                    if (result) {
                        vm.shopTemplate = result;

                        if (result.template) {
                            vm.controls = JSON.parse(result.template);
                        }
                    }
                });
            };
            vm.getTemplateUrl = function (control) {
                var templateUrl = '~/Areas/Mobile/Views/Home/ControlTemplates/' + control.name + ".cshtml";
                return templateUrl;
            };
            vm.initializeShare = function () {
                sessionService.getShopInformations().success(function (result) {
                    vm.shop = result;
                    var sharePicture = vm.shop.sharePicture;
                    sharePicture = "http://" + window.location.host + sharePicture;
                    shareService.getPreShare().success(function (result) {
                        initShare({
                            preShareData: result,
                            title: vm.shop.shareTitle,
                            imgUrl: sharePicture,
                            desc: vm.shop.shareDescription,
                        });
                    });
                });
            };
            function initialize() {
                vm.getShopTemplate();
                vm.initializeShare();
            }
            initialize();
        }]);
})();