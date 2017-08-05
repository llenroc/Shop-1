var infrastructure = infrastructure || {};
infrastructure.ui=infrastructure.ui||{};
(function () {
    infrastructure.ui.setBusy = function ($element, optionsOrPromise) {

        if ($element) {
            $element.busy();
        }
        else {
            $.busy();
        }
    };

    infrastructure.ui.clearBusy = function ($element) {

        if ($element) {
            $element.clearBusy();
        }
        else {
            $.clearBusy();
        }
    };
})();