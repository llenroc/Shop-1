(function () {
    appModule.controller('app.manager.memberCard.index', ['$scope', 'infrastructure.services.app.memberCard',
        function ($scope, memberCardService) {
            var vm = this;
            vm.memberCards = [];

            function getmemberCards() {
                memberCardService.getAll({}).success(function (result) {
                    vm.memberCards = result.items;
                });
            }
            getmemberCards();
        }
    ]);
})();