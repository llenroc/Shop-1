(function () {
    var controllerId = 'app.manager.layout.sideNav';
    appModule.controller(controllerId, ['$scope', '$rootScope', '$state', 'appSession', function ($scope,$rootScope, $state, appSession) {
        var _this = this;
        _this.menu = infrastructure.nav.menus.ManagerMenu;
        this.currentMenuName = $state.current.menu;

        $rootScope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
            _this.currentMenuName = toState.menu;
        });

        $scope.$on('$includeContentLoaded', function () {
            setTimeout(function () {
                $(".sidenav").sideNav();
            }, 0);
        });
    }
    ]);
})();