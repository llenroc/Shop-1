(function () {
    var controllerId = 'app.manager.walletManager.withdrawApply.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.withdrawForEnd',
        function ($scope, withdrawApplyService) {
            var vm = this;
            vm.withdrawApplys = [];
            var $withdrawApplyTable = $('#withdrawApplyTable');
            $withdrawApplyTable.table({
                paging: true,
                sorting: true,
                actions: {
                    listAction: {
                        method: withdrawApplyService.getAllOfPage,
                        callback: function (result) {
                            vm.withdrawApplys = result.items;
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
                    failReason: {
                    },
                    creationTime: {
                    },
                    lastModificationTime: {

                    }
                }
            });
            vm.withdraw = function (withdrawApply,withdrawMethod) {
                infrastructure.ui.setBusy();
                withdrawApplyService.withdraw({ id: withdrawApply.id, withdrawMethod: withdrawMethod }).success(function (result) {
                }).finally(function () {
                    $withdrawApplyTable.table().data("canknow.table").load();
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