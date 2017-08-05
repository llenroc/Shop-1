(function () {
    appModule.controller('app.manager.publicWechat.common.mediaIdOfNewsSelectorModal', [
        '$scope', '$uiModalInstance', 'infrastructure.services.app.publicWechat',
        function ($scope, $uiModalInstance, publicWechatService) {
            var vm = this;
            vm.medias = null;
            vm.loading = false;
            $uiModalInstance.onOk = function () {
                vm.save();
            };
            vm.getImageSrc = function (url) {
                return "http://read.html5.qq.com/image?src=forum&q=5&r=0&imgflag=7&imageUrl=" + url;
            };
            vm.select = function (media) {
                $uiModalInstance.close(media);
            };
            function init() {
                vm.loading = true;
                publicWechatService.getMediaNews({
                    pageSize:10
                }).success(function (result) {
                    vm.medias = result.items;
                    vm.loading = false;
                });
            }
            init();
        }
    ]);
})();