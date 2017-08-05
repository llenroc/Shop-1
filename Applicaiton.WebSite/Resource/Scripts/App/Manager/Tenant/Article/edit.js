(function () {
    var controllerId = 'app.manager.article.edit';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.articleForEnd', '$stateParams', '$state',
            function ($scope, articleService, $stateParams, $state) {
            var vm = this;
            vm.article = null;
            var $editor;
            articleService.get({ id: $stateParams.id }).success(function (result) {
                vm.article = result;
                $editor=$("#content").richTextEditor({
                    onImageUpload: function (files, editor) {
                        infrastructure.ui.setBusy();
                        var formData = new FormData();
                        var file = files[0];
                        formData.append("file", file);
                        var xhr = new XMLHttpRequest();
                        xhr.open('POST', "/Manager/Home/Upload", true);
                        xhr.onreadystatechange = function () {

                            if (xhr.readyState == 4) {

                                if (xhr.status == 200) {
                                    var result = JSON.parse(xhr.responseText);
                                    var path;

                                    if (result.__infrastructure) {
                                        path = result.result.path;
                                    }
                                    else {
                                        path = result.path;
                                    }
                                    editor.insertImage(path);
                                }
                            }
                            infrastructure.ui.clearBusy();
                        }
                        xhr.send(formData);
                    }
                }).data("canknow.richTextEditor").setContent(vm.article.content);
            });
            vm.save = function () {
                var article = vm.article;
                article.content = $editor.getContent();
                articleService.update(article).success(function (result) {
                    infrastructure.notify.success(app.localize('SavedSuccessfully'));
                    infrastructure.event.trigger('infrastructure.updateArticleModalSaved');
                    $state.go("article.index");
                }).error(function (result) {
                    infrastructure.notify.error(result.error.message);
                });
            };
        }
        ]);
})();