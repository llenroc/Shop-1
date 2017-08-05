(function () {
    appModule.controller('app.manager.profile.changePassword', [
        '$scope', 'appSession', 'infrastructure.services.app.profile',
        function ($scope, appSession, profileService) {
            var vm = this;

            vm.saving = false;
            vm.passwordInfo = null;
            vm.passwordComplexitySetting = {};
            vm.passwordComplexityMessages = {};

            var init = function () {
                profileService.getPasswordComplexitySetting().then(function (result) {
                    vm.passwordComplexitySetting = result.data.setting;
                    vm.passwordComplexityMessages = {
                        minLenght: infrastructure.utils.formatString(app.localize("PasswordComplexityMinLengthHint"), vm.passwordComplexitySetting.minLength),
                        maxLenght: infrastructure.utils.formatString(app.localize("PasswordComplexityMaxLengthHint"), vm.passwordComplexitySetting.maxLength),
                        useUpperCaseLetters: app.localize("PasswordComplexityUseUpperCaseLettersHint"),
                        useLowerCaseLetters: app.localize("PasswordComplexityUseLowerCaseLettersHint"),
                        useNumbers: app.localize("PasswordComplexityUseNumbersHint"),
                        usePunctuations: app.localize("PasswordComplexityUsePunctuationsHint")
                    };
                });
            };

            vm.save = function () {
                vm.saving = true;
                profileService.changePassword(vm.passwordInfo)
                    .then(function () {
                        infrastructure.notify.info(app.localize('YourPasswordHasChangedSuccessfully'));
                    }).finally(function () {
                        vm.saving = false;
                    });
            };
            init();
        }
    ]);
})();