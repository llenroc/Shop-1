(function () {
    appModule.directive('sideNav', function () {
        return {
            scope:{
                menuData: "=",
                currentMenuName:"="
            },
            link: function ($scope, element) {
                $sideNav = element.sidenav({
                    data: $scope.menuData,
                    enableDefaultHandler: false,
                    userUiSref:true
                });

                $scope.$watch('currentMenuName', function (newValue, oldValue, scope) {
                    $sideNav.setCurrent(newValue);
                });
            }
        };
    });
})();