var infrastructure = infrastructure || {};
infrastructure.ui=infrastructure.ui||{};
(function () {
    infrastructure.ui.loading = function (message) {
        return $.message.loading(message);
    };
})();