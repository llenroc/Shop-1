(function () {
    var controllerId = 'app.mobile.layout';
    appModule.controller(controllerId, ['$scope', 'appSession', function ($scope, appSession) {
        var vm = this;
        vm.footerMenu = infrastructure.nav.menus.FooterMenu;
        vm.currentUser = appSession.user;
        vm.currentUserAvatar = vm.currentUser ? vm.currentUser.avatar : "/Content/Images/avatar.png";

        if (vm.currentUser && vm.currentUser.wechatUserInfo) {
            initializeWxJs();
        }
    }]);
})();