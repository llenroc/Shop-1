(function () {
    var controllerId = 'app.manager.publicWechat.menu';
    appModule.controller(controllerId,
        ['$scope', 'infrastructure.services.app.publicWechat', '$state',
            function ($scope, publicWechatService, $state) {
                var vm = this;
                vm.menu = null;
                vm.isLoading = false;
                vm.types = [
                    { name: "click", title: "点击推事件" },
                    { name: "view", title: "跳转URL" },
                    { name: "scancode_push", title: "扫码推事件" },
                    { name: "scancode_waitmsg", title: "扫码推事件且弹出“消息接收中”提示框" },
                    { name: "pic_sysphoto", title: "弹出系统拍照发图" },
                    { name: "pic_photo_or_album", title: "弹出拍照或者相册发图" },
                    { name: "pic_weixin", title: "弹出微信相册发图器" },
                    { name: "location_select", title: "弹出地理位置选择器" },
                    { name: "media_id", title: "下发消息（除文本消息）" },
                    { name: "view_limited", title: "跳转图文消息URL" },
                ];
                vm.selectedButton = null;
                vm.edit = function (button) {
                    vm.selectedButton = button;
                };
                vm.add = function (parent) {
                    var button = {
                        name: app.localize("InputButtonName")
                    };
                    var parentList;

                    if (parent == null) {
                        parent = vm.menu;
                        parentList = vm.menu.button;
                    }
                    else if (!parent.sub_button) {
                        parent.sub_button = [];
                        parentList = parent.sub_button;
                    }
                    else {
                        parentList = parent.sub_button;
                    }
                    parentList.push(button);
                    vm.selectedButton = button;
                };
                vm.delete = function (parent, index) {
                    parent.splice(index, 1)
                };
                publicWechatService.getMenuAsync().success(function (result) {
                    vm.menu = result ? result.menu : {button:[]};
                    vm.selectedButton = vm.menu.button[0] == null ? null : vm.menu.button[0];
                }).error(function (error,result) {
                    vm.menu = result ? result.menu : {button:[]};
                    vm.selectedButton = vm.menu.button[0] == null ? null : vm.menu.button[0];
                })

                vm.send = function () {
                    vm.isLoading = true;
                    publicWechatService.createMenuAsync({
                        resultFull: { menu: vm.menu }
                    }).success(function (result) {
                        infrastructure.message.success(app.localize("CreateSuccessfully"));
                        vm.isLoading = false;
                    });
                }
            }
        ]);
})();