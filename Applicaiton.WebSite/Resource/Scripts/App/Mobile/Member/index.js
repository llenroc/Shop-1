(function () {
    appModule.controller('app.mobile.memberCard.index',
        ['$scope', 'infrastructure.services.app.memberCard', 'infrastructure.services.app.userForFront', 'appSession',
        function ($scope, memberCardService, userService, appSession) {
            var vm = this;
            vm.memberCard = null;
            vm.user = appSession.user;
            vm.parent = null;
            vm.userCenterMenu = infrastructure.nav.menus.UserCenterMenu;
            vm.getParent = function () {
                userService.getMyParent().success(function (result) {
                    vm.parent = result;
                });
            };
            vm.getMemberCard = function () {
                memberCardService.getValidMemberCardOfUser({}).success(function (result) {
                    vm.memberCard = result;
                });
            }
            function initialize() {
                //vm.getParent();
                //vm.getMemberCard();
            }
            initialize();
        }
        ]);
})();