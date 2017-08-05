(function () {
    appModule.controller('app.manager.memberLevel.index', ['$scope', 'infrastructure.services.app.memberLevel',
        function ($scope, memberLevelService) {
            var vm = this;
            vm.memberLevels = [];

            function getMemberLevels() {
                memberLevelService.getAll({}).success(function (result) {
                    vm.memberLevels = result.items;
                });
            }
            getMemberLevels();
        }
    ]);
})();