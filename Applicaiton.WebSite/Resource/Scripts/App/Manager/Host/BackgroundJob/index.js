(function () {
    var controllerId = 'app.manager.host.backgroundJob.index';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.backgroundJob', function ($scope, backgroundJobService) {
            var vm = this;
            vm.backgroundJobs = null;
            var $backgroundJobTable = $('#backgroundJobTable');
            $backgroundJobTable.table({
                paging: true,
                sorting: true,
                multiSorting: true,
                actions: {
                    listAction: {
                        method: backgroundJobService.getAllOfPage,
                        callback: function (result) {
                            vm.backgroundJobs = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                    jobType: {
                    },
                    jobArgs: {
                    },
                    tryCount: {
                        sorting: false
                    },
                    nextTryTime: {
                    },
                    lastTryTime: {
                    },
                    isAbandoned: {
                    },
                }
            });
        }
    ]);
})();