var infrastructure = infrastructure || {};
infrastructure.ui=infrastructure.ui||{};
(function () {

    if (!$.blockUI) {
        return;
    }
    
    infrastructure.ui.block = function (elm) {

        if (!elm) {
            $.blockUI();
        }
        else {
            $(elm).block();
        }
    };

    infrastructure.ui.unblock = function (elm) {

        if (!elm) {
            $.unblockUI();
        }
        else {
            $(elm).unblock();
        }
    };
})();