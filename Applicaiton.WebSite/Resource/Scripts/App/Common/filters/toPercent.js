(function () {
    appModule.filter('toPercent', function () {
        return function (data) {
            return data*100+"%";
        };
    });
})();