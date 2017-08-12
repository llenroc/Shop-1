(function () {
    commonModule.filter('toPercent', function () {
        return function (data) {
            return data*100+"%";
        };
    });
})();