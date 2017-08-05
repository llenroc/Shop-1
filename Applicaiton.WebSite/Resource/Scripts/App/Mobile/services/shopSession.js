(function () {
    appModule.factory('shopSession', [
        function () {
            var _session = {
                shop: null,
            };
            infrastructure.services.app.session.getShopInformations().done(function (result) {
                _session.shop = result;
            });
            return _session;
        }
    ]);
})();