(function () {
    appModule.directive('passwordComplexity', [
        function () {
            return {
                restrict: 'A',
                require: 'ngModel',
                scope: {
                    passwordComplexitySetting: '='
                },
                link: function (scope, element, attr, controller) {
                    function customValidator(ngModelValue) {
                        var setting = scope.passwordComplexitySetting;

                        //Min Length
                        if (setting.minLength) {

                            if (ngModelValue.length >= setting.minLength) {
                                controller.$setValidity('passwordCompexityMinLengthValidator', true);
                            }
                            else {
                                controller.$setValidity('passwordCompexityMinLengthValidator', false);
                            }
                        }

                        //Max Length
                        if (setting.maxLength) {
                            if (ngModelValue.length <= setting.maxLength) {
                                controller.$setValidity('passwordCompexityMaxLengthValidator', true);
                            }
                            else {
                                controller.$setValidity('passwordCompexityMaxLengthValidator', false);
                            }
                        }

                        if (setting.useUpperCaseLetters) {
                            if (/[A-Z]/.test(ngModelValue)) {
                                controller.$setValidity('passwordCompexityUseUpperCaseLettersValidator', true);
                            }
                            else {
                                controller.$setValidity('passwordCompexityUseUpperCaseLettersValidator', false);
                            }
                        }

                        if (setting.useLowerCaseLetters) {
                            if (/[a-z]/.test(ngModelValue)) {
                                controller.$setValidity('passwordCompexityUseLowerCaseLettersValidator', true);
                            }
                            else {
                                controller.$setValidity('passwordCompexityUseLowerCaseLettersValidator', false);
                            }
                        }

                        if (setting.useNumbers) {
                            if (/[0-9]/.test(ngModelValue)) {

                                controller.$setValidity('passwordCompexityUseNumbersValidator', true);
                            }
                            else {
                                controller.$setValidity('passwordCompexityUseNumbersValidator', false);
                            }
                        }

                        if (setting.usePunctuations) {
                            if (/[!@#\$%\^\&*'"\/{}\[\]?,;|)\(+=._-]+/.test(ngModelValue)) {
                                controller.$setValidity('passwordCompexityUsePunctuationsValidator', true);
                            }
                            else {
                                controller.$setValidity('passwordCompexityUsePunctuationsValidator', false);
                            }
                        }
                        return ngModelValue;
                    }
                    controller.$parsers.push(customValidator);
                }
            };
        }
    ]);
})();