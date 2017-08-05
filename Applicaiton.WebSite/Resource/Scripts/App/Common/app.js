﻿var appModule = angular.module('app', ['ui.router', 'infrastructure', 'ui', 'ui.utils', 'angular-sortable-view', 'me-lazyload'])
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