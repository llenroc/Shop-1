var infrastructure = infrastructure || {};
(function ($) {
   
    //Check if SignalR is defined
    if (!$ || !$.connection) {
        return;
    }

    //Create namespaces
    infrastructure.signalr = infrastructure.signalr || {};
    infrastructure.signalr.hubs = infrastructure.signalr.hubs || {};

    //Get the common hub
    infrastructure.signalr.hubs.common = $.connection.infrastructureCommonHub;

    var commonHub = infrastructure.signalr.hubs.common;

    if (!commonHub) {
        return;
    }

    //Register to get notifications
    commonHub.client.getNotification = function (notification) {
        infrastructure.event.trigger('infrastructure.notifications.received', notification);
    };

    //Get the system hub
    infrastructure.signalr.hubs.system = $.connection.systemHub;
    var systemHub = infrastructure.signalr.hubs.system;
    systemHub.client.getMonitorInfo = function (data) {
        infrastructure.event.trigger('infrastructure.hubs.system.getMonitorInfo', data);
    };

    //Connect to the server
    infrastructure.signalr.connect = function() {
        $.connection.hub.start().done(function () {
            infrastructure.log.debug('Connected to SignalR server!'); //TODO: Remove log
            infrastructure.event.trigger('infrastructure.signalr.connected');
            commonHub.server.register().done(function () {
                infrastructure.log.debug('Common Hub registered to the SignalR server!'); //TODO: Remove log
            });
        });
    };

    if (infrastructure.signalr.autoConnect === undefined) {
        infrastructure.signalr.autoConnect = true;
    }

    if (infrastructure.signalr.autoConnect) {
        infrastructure.signalr.connect();
    }

    //reconnect if hub disconnects
    $.connection.hub.disconnected(function () {

        if (!infrastructure.signalr.autoConnect) {
            return;
        }

        setTimeout(function () {

            if ($.connection.hub.state === $.signalR.connectionState.disconnected) {
                $.connection.hub.start();
            }
        }, 5000);
    });
})(jQuery);