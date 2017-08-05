(function () {
    appModule.filter('localize', function () {
        return function (data) {
            var args = Array.prototype.slice.call(arguments, 1);
            args.splice(0, 0, data);
            return app.localize.apply(this, args);
        };
    });
})();