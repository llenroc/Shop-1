(function () {
    appModule.controller('app.manager.publicWechat.common.mediaIdOfImageSelectorModal', [
        '$scope', '$uiModalInstance', 'infrastructure.services.app.publicWechat',
        function ($scope, $uiModalInstance, publicWechatService) {
            var vm = this;
            vm.medias = null;
            vm.loading = false;
            vm.pictureToUpload = null;
            $uiModalInstance.onOk = function () {
                vm.save();
            };
            vm.getImageSrc = function (url) {
                return "http://read.html5.qq.com/image?src=forum&q=5&r=0&imgflag=7&imageUrl=" + url;
            };

            $scope.load=function () {
                var $mediasList = $('#mediasList');
                $mediasList.table({
                    paging: true,
                    sorting: true,
                    actions: {
                        listAction: {
                            method: publicWechatService.getMediaImages,
                            callback: function (result) {
                                vm.medias = result.items;
                            },
                            getTotalCountFromResult: function (result) {
                                return result.totalCount;
                            }
                        }
                    }
                });
                vm.upload = function () {

                    if (vm.pictureToUpload) {
                        publicWechatService.uploadMediaImage({ path: vm.pictureToUpload }).success(function () {
                            vm.pictureToUpload = null;
                            $mediasList.table().data("canknow.table").load();
                        });
                    }
                }
            };
            vm.select = function (media) {
                $uiModalInstance.close(media);
            };
        }
    ]);
})();