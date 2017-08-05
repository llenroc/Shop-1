(function () {
    var controllerId = 'app.manager.walletManager.walletRecord.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.walletRecordForEnd',
        function ($scope, walletRecordService) {
            var vm = this;
            vm.walletRecords = [];
            var $walletRecordTable = $('#walletRecordTable');
            $walletRecordTable.table({
                paging: true,
                sorting: true,
                actions: {
                    listAction: {
                        method: walletRecordService.getAllOfPage,
                        callback: function (result) {
                            vm.walletRecords = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                    serialNumber: {
                    },
                    avatar: {
                        disabled: true
                    },
                    money: {
                    },
                    type: {
                    },
                    remark: {
                    },
                    payType: {
                    },
                    payStatus: {
                    },
                    fetchStatus: {
                    },
                    failReason: {
                    },
                    creationTime: {
                    },
                    lastModificationTime: {

                    }
                }
            });
            vm.delete = function (index) {
                infrastructure.message.confirm(
                    app.localize('AreYouSureToDelete'),
                    function () {
                        infrastructure.ui.setBusy();
                        walletRecordService.delete({ id: vm.walletRecords[index].id }).success(function (result) {
                            $walletRecordTable.table().data("canknow.table").load();
                        }).finally(function () {
                            infrastructure.ui.clearBusy();
                        });
                    }
                    );
            };
            vm.withdraw = function (walletRecord) {
                infrastructure.ui.setBusy();
                walletRecordService.withdraw({ id: walletRecord.id }).success(function (result) {
                    $walletRecordTable.table().data("canknow.table").load();
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            function createRequestParams() {
                var params = {};
                $filterForm.serializeArray().map(function (x) { params[x.name] = x.value; });
                return params;
            }
        }]);
})();