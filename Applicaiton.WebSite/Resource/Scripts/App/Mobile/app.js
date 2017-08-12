(function () {
    'use strict';
    Table.DefaultSettings.simplePaging = true;
})();
var appModule = angular.module('app', ['ui.router', 'infrastructure', 'common','canknow', 'me-lazyload'])
.run(["$rootScope", function ($rootScope) {
    $rootScope.safeApply = function (fn) {
        var phase = this.$root.$$phase;

        if (phase == '$apply' || phase == '$digest') {

            if (fn && (typeof (fn) === 'function')) {
                fn();
            }
        }
        else {
            this.$apply(fn);
        }
    };
}]);