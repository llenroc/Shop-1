(function () {
    var controllerId = 'app.home.layout.header';
    appModule.controller(controllerId, ['$rootScope', '$state', 'appSession', function ($rootScope, $state, appSession) {
        var vm = this;

        vm.languages = infrastructure.localization.languages;
        vm.currentLanguage = infrastructure.localization.currentLanguage;

        vm.isLogined = infrastructure.session.userId;
    
        vm.user = appSession.user;
        vm.tenant = appSession.tenant;
        vm.getShownUserName = function () {

            if (!infrastructure.multiTenancy.isEnabled) {
                return appSession.user.userName;
            }
            else {

                if (appSession.tenant) {
                    return appSession.tenant.tenancyName + '\\' + appSession.user.userName;
                }
                else if (appSession.user) {
                    return '.\\' + appSession.user.userName;
                }
                else {
                    return "Anonymous";
                }
            }
        };
        infrastructure.event.on('infrastructure.notifications.received', function (notification) {
            infrastructure.notifications.showUiNotifyFornotification(notification);
        });
    }
    ]);
})();