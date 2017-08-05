(function () {
    appModule.controller('app.manager.host.maintenance.index', [
        '$scope', '$sce', '$window', 'infrastructure.services.app.caching', 'infrastructure.services.app.webLog',
        function ($scope, $sce, $window, cachingService, webLogService) {
            var vm = this;
            vm.loading = false;
            vm.caches = null;
            vm.logs = '';

            //Caching
            vm.getCaches = function () {
                vm.loading = true;
                cachingService.getAllCaches()
                    .then(function (result) {
                        vm.caches = result.data.items;
                    }).finally(function () {
                        vm.loading = false;
                    });
            };

            vm.clearCache = function (cacheName) {
                cachingService.clearCache({
                    id: cacheName
                }).then(function () {
                    infrastructure.notify.success(app.localize('CacheSuccessfullyCleared'));
                });
            }

            vm.clearAllCaches = function () {
                cachingService.clearAllCaches().then(function () {
                    infrastructure.notify.success(app.localize('AllCachesSuccessfullyCleared'));
                });
            };

            //Web Logs
            vm.getWebLogs = function () {
                webLogService.getLatestWebLogs({}).then(function (result) {   
                    vm.logs = $sce.trustAsHtml(vm.getFormattedLogs(result.data.latesWebLogLines));
                });
            };

            vm.downloadWebLogs = function () {
                webLogService.downloadWebLogs({}).then(function (result) {
                    app.downloadTempFile(result.data);
                });
            };

            vm.getFormattedLogs = function (logLines) {
                var resultHtml = '';
                angular.forEach(logLines, function (logLine) {
                    resultHtml += '<li class="log-line">' +logLine
                    .replace('DEBUG', '<span class="label success">DEBUG</span>')
                    .replace('INFO', '<span class="label info">INFO</span>')
                    .replace('WARN', '<span class="label warning">WARN</span>')
                    .replace('ERROR', '<span class="label danger">ERROR</span>')
                    .replace('FATAL', '<span class="label primary">FATAL</span>') + '</li>';
                });
                return resultHtml;
            }

            vm.init = function () {
                vm.getCaches();
                vm.getWebLogs();
            }
            vm.init();
        }
    ]);
})();