(function () {
    appModule.controller('app.manager.article.index', ['$scope', 'infrastructure.services.app.articleForEnd',
        function ($scope, articleService) {
            var vm = this;
            vm.articles = [];
            var $articleTable = $('#articleTable');
            $articleTable.table({
                paging: true,
                sorting: true,
                actions: {
                    listAction: {
                        method: articleService.getAllOfPage,
                        callback: function (result) {
                            vm.articles = result.items;
                        },
                        getTotalCountFromResult: function (result) {
                            return result.totalCount;
                        }
                    }
                },
                fields: {
                    id: {
                    },
                }
            });
            vm.delete = function (article) {
                infrastructure.message.confirm(app.localize("AreYouSure"), function () {
                    articleService.delete({ id: article .id}).success(function (result) {
                        $articleTable.table().data("canknow.table").load();
                    });
                });
            }
        }
    ]);
})();