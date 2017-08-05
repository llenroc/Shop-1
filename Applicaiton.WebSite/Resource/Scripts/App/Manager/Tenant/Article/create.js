(function () {
    var controllerId = 'app.manager.article.create';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.articleForEnd', '$stateParams', '$state',
            function ($scope, articleService, $stateParams, $state) {
                var vm = this;
                vm.article = {
                    isRedirectExternal: false,
                    thumbnail: '/Content/frame/canknow/image/upload-picture.png'
                };
                var $editor = $("#content").richTextEditor({
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
                }).data("canknow.richTextEditor");
                vm.create = function () {
                    var article = vm.article;
                    article.content = $editor.getContent();
                    articleService.create(article).success(function () {
                        infrastructure.notify.info(app.localize('SavedSuccessfully'));
                        $state.go("article.index");
                    });
                };
            }
        ]);
})();