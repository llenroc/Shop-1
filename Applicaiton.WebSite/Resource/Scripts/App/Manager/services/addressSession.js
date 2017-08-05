(function () {
    appModule.factory('addressSession', [
            function () {
                var _session = {
                    addressTree: null,
                };
                infrastructure.services.app.address.getAddressesTree({}).done(function (result) {
                    _session.addressTree = result.items;
                });
                return _session;
            }
    ]);
})();