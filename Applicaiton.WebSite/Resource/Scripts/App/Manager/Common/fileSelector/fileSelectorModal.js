(function () {
    appModule.controller('app.manager.common.fileSelectorModal', [
        '$scope', '$uiModalInstance', 'infrastructure.services.app.file', 'fileType',
        function ($scope, $uiModalInstance, fileService, fileType) {
            var vm = this;
            vm.files = null;
            vm.loading = false;
            vm.fileType = fileType||"common";
            $uiModalInstance.onOk = function () {
                vm.save();
            };
            var $fileList;
            vm.isPicture = function (path) {
                var strFilter = ".jpeg|.gif|.jpg|.png|.bmp|.pic|";

                if (path.indexOf(".") > -1) {
                    var p = path.lastIndexOf(".");
                    var strPostfix = path.substring(p, path.length) + '|';
                    strPostfix = strPostfix.toLowerCase();

                    if (strFilter.indexOf(strPostfix) > -1) {
                        return true;
                    }
                }
                return false;
            }
            vm.load=function () {
                $fileList = $('#fileList');
                $fileList.table({
                    paging: true,
                    sorting: true,
                    actions: {
                        listAction: {
                            method: fileService.getAllOfPage,
                            parameters:{fileType:vm.fileType},
                            callback: function (result) {
                                vm.files = result.items;
                            },
                            getTotalCountFromResult: function (result) {
                                return result.totalCount;
                            }
                        }
                    }
                });
                vm.upload = function () {
                }
            };
            vm.getFiles = function () {
                $fileList.table().data("canknow.table").load();
            };
            vm.select = function (file) {
                $uiModalInstance.close(file);
            };
        }
    ]);
})();