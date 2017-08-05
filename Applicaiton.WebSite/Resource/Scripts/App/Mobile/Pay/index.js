(function () {
    var controllerId = 'app.mobile.pay.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.productOrder', '$http',
        function ($scope, orderService, $http) {
            var vm = this;
            vm.id = document.getElementById("id").value;
            vm.payParameters = null;
            vm.paying = function () {
                wx.chooseWXPay({
                    timestamp: vm.payParameters.timeStamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
                    nonceStr: vm.payParameters.nonceStr, // 支付签名随机串，不长于 32 位
                    package: vm.payParameters.package, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
                    signType: "MD5", // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
                    paySign: vm.payParameters.paySign, // 支付签名
                    success: function (res) {
                        window.location.href = "/Mobile/Order/Detail?id="+vm.id;
                    },
                    cancel: function (res) {
                        window.location.href = "/Mobile/Order/Detail?id=" + vm.id;
                    }
                });
            };
            function getPaySign() {
                $http.post("/Mobile/Pay/GetPaySign", { id: vm.id }).success(function (result) {
                    vm.payParameters = result;
                });
            };
            function initialize() {
                getPaySign();
            }
            initialize();
        }]);
})();