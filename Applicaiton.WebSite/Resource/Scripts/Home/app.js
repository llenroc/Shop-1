var appModule = angular.module('app', ['ui.router', 'infrastructure', 'common', 'canknow', 'me-lazyload'])
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

(function () {
    'use strict';
    var app = appModule;

    infrastructure.event.on('infrastructure.signalr.connected', function () { //为连接事件注册
    });
    infrastructure.event.on('infrastructure.notifications.received', function (notification) {
        console.log(notification);
    });
})();