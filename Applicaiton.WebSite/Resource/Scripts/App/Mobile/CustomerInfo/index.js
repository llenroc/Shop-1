(function () {
    //Configuration for Angular UI routing.
    appModule.config(['$stateProvider', '$urlRouterProvider',
    function ($stateProvider, $urlRouterProvider) {

        // Default route (overrided below if user has permission)
        $urlRouterProvider.otherwise("/customerInfo/list");

        $stateProvider.state('customerInfo', {
            'abstract': true,
            url: '/customerInfo',
            template: '<div ui-view class="fade-in-up"></div>'
        });
        $stateProvider.state('customerInfo.list', {
            url: '/list',
            templateUrl: '/Areas/Mobile/Views/CustomerInfo/Index/list.cshtml'
        }).state('customerInfo.createOrEdit', {
            url: '/createOrEdit/{id}',
            templateUrl: '/Areas/Mobile/Views/CustomerInfo/Index/createOrEdit.cshtml'
        });
    }]);
})();