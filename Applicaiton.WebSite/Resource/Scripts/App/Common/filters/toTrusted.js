﻿(function () {
    commonModule.filter('toTrusted', ['$sce', function ($sce) {
        return function (text) {
            return $sce.trustAsHtml(text);
        };
    }]);
})();