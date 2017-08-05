(function () {
    'use strict';
    var app = appModule;

    infrastructure.event.on('infrastructure.signalr.connected', function () { //为连接事件注册
    });
    infrastructure.event.on('infrastructure.notifications.received', function (notification) {
        console.log(notification);
    });
})();