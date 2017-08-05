(function () {
    appModule.controller('app.manager.publicWechat.autoReply.index',
        ['$scope', 'infrastructure.services.app.autoReply',
        function ($scope, autoReplyService) {
            var vm = this;
            vm.autoReplys = [];
            vm.delete = function (autoReply) {
                autoReplyService.delete({
                    id: autoReply.id
                }).success(function () {
                    infrastructure.notify.info(app.localize('DeletedSuccessfully'));
                    vm.getAutoReplys();
                });
            };
            vm.getAutoReplys=function() {
                autoReplyService.getAll({}).success(function (result) {
                    vm.autoReplys = result.items;
                });
            }
            vm.getAutoReplys();
        }
        ]);
})();