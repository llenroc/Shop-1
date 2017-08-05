(function () {
    var controllerId = 'app.mobile.article.content';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.articleForFront', 'infrastructure.services.app.share',
        function ($scope, articleService,shareService) {
            var vm = this;
            vm.article = null;
            vm.hasHint = false;
            vm.articleLike = null;
            vm.id = document.getElementById("id").value;
            vm.getArticle = function () {
                infrastructure.ui.setBusy();
                articleService.getArticle({ id: vm.id }).success(function (result) {
                    vm.article = result.article;
                    vm.articleLike = result.articleLike;
                    var sharePicture = vm.article.thumbnail;
                    sharePicture = "http://" + window.location.host + sharePicture;
                    shareService.getPreShare().success(function (result) {
                        initShare({
                            preShareData: result,
                            title: vm.article.title,
                            imgUrl: sharePicture,
                            desc: vm.article.description,
                        });
                    });
                }).finally(function () {
                    infrastructure.ui.clearBusy();
                });
            };
            vm.addLike = function (likeType) {
                articleService.addLike({ id: vm.id, likeType: likeType }).success(function (result) {
                    vm.articleLike = result;
                    vm.article.like++;
                });
            };
            function initialize() {
                vm.getArticle();
            }
            initialize();
        }]);
})();