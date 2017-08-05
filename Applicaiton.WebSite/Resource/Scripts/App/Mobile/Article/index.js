(function () {
    var controllerId = 'app.mobile.article.index';
    appModule.controller(controllerId, ['$scope', 'infrastructure.services.app.articleForFront',
        function ($scope, articleService) {
            var vm = this;
            vm.articles = [];
            vm.isLoaded = false;
            var $articleList = $('#articleList');
            $articleList.table({
                paging: true,
                onInitializeLoadSuccess:function(){
                    vm.isLoaded = true;
                },
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
                }
            });
            vm.localize = function (text) {
                return app.localize(text);
            };
            function createRequestParams() {
                var params = {};
                $filterForm.serializeArray().map(function (x) { params[x.name] = x.value; });
                return params;
            }
        }]);
})();