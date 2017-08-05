var infrastructure = infrastructure || {};

(function ($) {
    /* Application paths *****************************************/

    //Current application root path (including virtual directory if exists).
    infrastructure.appPath = infrastructure.appPath || '/';

    infrastructure.pageLoadTime = new Date();

    //Converts given path to absolute path using infrastructure.appPath variable.
    infrastructure.toAbsoluteAppPath = function (path) {

        if (path.indexOf('/') == 0) {
            path = path.substring(1);
        }
        return infrastructure.appPath + path;
    };

    /* TIMING *****************************************/
    infrastructure.timing = infrastructure.timing || {};
    infrastructure.timing.utcClockProvider = (function () {

        var toUtc = function (date) {
            return Date.UTC(
                date.getUTCFullYear()
                , date.getUTCMonth()
                , date.getUTCDate()
                , date.getUTCHours()
                , date.getUTCMinutes()
                , date.getUTCSeconds()
                , date.getUTCMilliseconds()
            );
        }

        var now = function () {
            return new Date();
        };

        var normalize = function (date) {

            if (!date) {
                return date;
            }
            return new Date(toUtc(date));
        };

        // Public interface ///////////////////////////////////////////////////

        return {
            now: now,
            normalize: normalize,
            supportsMultipleTimezone: true
        };
    })();

    infrastructure.timing.localClockProvider = (function () {

        var toLocal = function (date) {
            return new Date(
                date.getFullYear()
                , date.getMonth()
                , date.getDate()
                , date.getHours()
                , date.getMinutes()
                , date.getSeconds()
                , date.getMilliseconds()
            );
        }

        var now = function () {
            return toLocal(new Date());
        }

        var normalize = function (date) {
            if (!date) {
                return date;
            }

            return toLocal(date);
        }

        // Public interface ///////////////////////////////////////////////////

        return {
            now: now,
            normalize: normalize,
            supportsMultipleTimezone: false
        };
    })();

    infrastructure.timing.unspecifiedClockProvider = (function () {

        var now = function () {
            return new Date();
        }

        var normalize = function (date) {
            return date;
        }

        // Public interface ///////////////////////////////////////////////////

        return {
            now: now,
            normalize: normalize,
            supportsMultipleTimezone: false
        };
    })();

    infrastructure.timing.convertToUserTimezone = function (date) {
        var localTime = date.getTime();
        var utcTime = localTime + (date.getTimezoneOffset() * 60000);
        var targetTime = parseInt(utcTime) + parseInt(infrastructure.timing.timeZoneInfo.windows.currentUtcOffsetInMilliseconds);
        return new Date(targetTime);
    };

    /* CLOCK *****************************************/
    infrastructure.clock = infrastructure.clock || {};

    infrastructure.clock.now = function () {

        if (infrastructure.clock.provider) {
            return infrastructure.clock.provider.now();
        }
        return new Date();
    }

    infrastructure.clock.normalize = function (date) {

        if (infrastructure.clock.provider) {
            return infrastructure.clock.provider.normalize(date);
        }
        return date;
    }

    infrastructure.clock.provider = infrastructure.timing.unspecifiedClockProvider;

    /* SECURITY ***************************************/
    infrastructure.security = infrastructure.security || {};
    infrastructure.security.antiForgery = infrastructure.security.antiForgery || {};

    infrastructure.security.antiForgery.tokenCookieName = 'XSRF-TOKEN';
    infrastructure.security.antiForgery.tokenHeaderName = 'X-XSRF-TOKEN';

    infrastructure.security.antiForgery.getToken = function () {
        return infrastructure.utils.getCookieValue(infrastructure.security.antiForgery.tokenCookieName);
    };

    /* SIMPLE EVENT BUS *****************************************/

    infrastructure.event = (function () {

        var _callbacks = {};

        var on = function (eventName, callback) {

            if (!_callbacks[eventName]) {
                _callbacks[eventName] = [];
            }
            _callbacks[eventName].push(callback);
        };

        var off = function (eventName, callback) {
            var callbacks = _callbacks[eventName];

            if (!callbacks) {
                return;
            }
            var index = -1;
            for (var i = 0; i < callbacks.length; i++) {

                if (callbacks[i] === callback) {
                    index = i;
                    break;
                }
            }

            if (index < 0) {
                return;
            }
            _callbacks[eventName].splice(index, 1);
        };

        var trigger = function (eventName) {
            var callbacks = _callbacks[eventName];

            if (!callbacks || !callbacks.length) {
                return;
            }
            var args = Array.prototype.slice.call(arguments, 1);

            for (var i = 0; i < callbacks.length; i++) {
                callbacks[i].apply(this, args);
            }
        };

        // Public interface ///////////////////////////////////////////////////
        return {
            on: on,
            off: off,
            trigger: trigger
        };
    })();

    /* UTILS ***************************************************/
    infrastructure.utils = infrastructure.utils || {};

    /* Formats a string just like string.format in C#.
*  Example:
*  abp.utils.formatString('Hello {0}','Tuana') = 'Hello Tuana'
************************************************************/
    infrastructure.utils.formatString = function () {

        if (arguments.length < 1) {
            return null;
        }
        var str = arguments[0];

        for (var i = 1; i < arguments.length; i++) {
            var placeHolder = '{' + (i - 1) + '}';
            str =str.replaceAll(placeHolder, arguments[i]);
        }
        return str;
    };


    /* Creates a name namespace.
    *  Example:
    *  var taskService = infrastructure.utils.createNamespace(infrastructure, 'services.task');
    *  taskService will be equal to infrastructure.services.task
    *  first argument (root) must be defined first
    ************************************************************/
    infrastructure.utils.createNamespace = function (root, ns) {
        var parts = ns.split('.');

        for (var i = 0; i < parts.length; i++) {

            if (typeof root[parts[i]] == 'undefined') {
                root[parts[i]] = {};
            }
            root = root[parts[i]];
        }
        return root;
    };

    infrastructure.utils.isFunction = function (obj) {

        if ($) {
            //Prefer to use jQuery if possible
            return $.isFunction(obj);
        }

        //alternative for $.isFunction
        return !!(obj && obj.constructor && obj.call && obj.apply);
    };

    /**
         * Sets a cookie value for given key.
         * This is a simple implementation created to be used by infrastructure.
         * Please use a complete cookie library if you need.
         * @param {string} key
         * @param {string} value 
         * @param {Date} expireDate (optional). If not specified the cookie will expire at the end of session.
         * @param {string} path (optional)
         */
    infrastructure.utils.setCookieValue = function (key, value, expireDate, path) {
        var cookieValue = encodeURIComponent(key) + '=';

        if (value) {
            cookieValue = cookieValue + encodeURIComponent(value);
        }

        if (expireDate) {
            cookieValue = cookieValue + "; expires=" + expireDate.toUTCString();
        }

        if (path) {
            cookieValue = cookieValue + "; path=" + path;
        }
        document.cookie = cookieValue;
    };

    /**
     * Gets a cookie with given key.
     * This is a simple implementation created to be used by infrastructure.
     * Please use a complete cookie library if you need.
     * @param {string} key
     * @returns {string} Cookie value or null
     */
    infrastructure.utils.getCookieValue = function (key) {
        var equalities = document.cookie.split('; ');

        for (var i = 0; i < equalities.length; i++) {

            if (!equalities[i]) {
                continue;
            }

            var splitted = equalities[i].split('=');

            if (splitted.length != 2) {
                continue;
            }

            if (decodeURIComponent(splitted[0]) === key) {
                return decodeURIComponent(splitted[1] || '');
            }
        }

        return null;
    };

    /**
     * Deletes cookie for given key.
     * This is a simple implementation created to be used by infrastructure.
     * Please use a complete cookie library if you need.
     * @param {string} key
     * @param {string} path (optional)
     */
    infrastructure.utils.deleteCookie = function (key, path) {
        var cookieValue = encodeURIComponent(key) + '=';

        cookieValue = cookieValue + "; expires=" + (new Date(new Date().getTime() - 86400000)).toUTCString();

        if (path) {
            cookieValue = cookieValue + "; path=" + path;
        }
        document.cookie = cookieValue;
    };

    /* LOGGING ***************************************************/
    //Implements Logging API that provides secure & controlled usage of console.log

    infrastructure.log = infrastructure.log || {};

    infrastructure.log.levels = {
        DEBUG: 1,
        INFO: 2,
        WARN: 3,
        ERROR: 4,
        FATAL: 5
    };

    infrastructure.log.level = infrastructure.log.levels.DEBUG;

    infrastructure.log.log = function (logObject, logLevel) {

        if (!window.console || !window.console.log) {
            return;
        }

        if (logLevel != undefined && logLevel < infrastructure.log.level) {
            return;
        }
        console.log(logObject);
    };

    infrastructure.log.debug = function (logObject) {
        infrastructure.log.log("DEBUG: ", infrastructure.log.levels.DEBUG);
        infrastructure.log.log(logObject, infrastructure.log.levels.DEBUG);
    };

    infrastructure.log.info = function (logObject) {
        infrastructure.log.log("INFO: ", infrastructure.log.levels.INFO);
        infrastructure.log.log(logObject, infrastructure.log.levels.INFO);
    };

    infrastructure.log.warn = function (logObject) {
        infrastructure.log.log("WARN: ", infrastructure.log.levels.WARN);
        infrastructure.log.log(logObject, infrastructure.log.levels.WARN);
    };

    infrastructure.log.error = function (logObject) {
        infrastructure.log.log("ERROR: ", infrastructure.log.levels.ERROR);
        infrastructure.log.log(logObject, infrastructure.log.levels.ERROR);
    };

    infrastructure.log.fatal = function (logObject) {
        infrastructure.log.log("FATAL: ", infrastructure.log.levels.FATAL);
        infrastructure.log.log(logObject, infrastructure.log.levels.FATAL);
    };

    /* NOTIFICATION *********************************************/
    //Defines Notification API, not implements it
    infrastructure.notify = infrastructure.notify || {};

    infrastructure.notify.success = function (message, title, options) {
        //infrastructure.log.warn('infrastructure.notify.success is not implemented!');
        options = options || {};
        options.title = title;
        $.notify.success(message, options);
    };

    infrastructure.notify.info = function (message, title, options) {
        //infrastructure.log.warn('infrastructure.notify.info is not implemented!');
        options = options || {};
        options.title = title;
        $.notify.info(message, options);
    };

    infrastructure.notify.warn = function (message, title, options) {
        //infrastructure.log.warn('infrastructure.notify.warn is not implemented!');
        options = options || {};
        options.title = title;
        $.notify.warn(message, options);
    };

    infrastructure.notify.error = function (message, title, options) {
        //infrastructure.log.warn('infrastructure.notify.error is not implemented!');
        options = options || {};
        options.title = title;
        $.notify.error(message, options);
    };

    /* MESSAGE **************************************************/
    //Defines Message API, not implements it

    infrastructure.message = infrastructure.message || {};

    infrastructure.message.info = function (message, title,options) {
        //infrastructure.log.warn('infrastructure.message.info is not implemented!');
        options = options || {};
        options.title = title;
        $.message.info(message, options);
    };

    infrastructure.message.success = function (message, title, options) {
        //infrastructure.log.warn('infrastructure.message.success is not implemented!');
        options = options || {};
        options.title = title;
        $.message.success(message, options);
    };

    infrastructure.message.warn = function (message, title, options) {
        //infrastructure.log.warn('infrastructure.message.warn is not implemented!');
        options = options || {};
        options.title = title;
        $.message.warn(message, options);
    };

    infrastructure.message.error = function (message, title, options) {
        //infrastructure.log.warn('infrastructure.message.error is not implemented!');
        options = options || {};
        options.title = title;
        $.message.error(message, options);
    };


    infrastructure.message.confirm = function (message, callback) {
        //infrastructure.log.warn('infrastructure.message.confirm is not implemented!');
        $.confirm(message, callback);
    };

    /* LOCALIZATION ***********************************************/
    //Implements Localization API that simplifies usage of localization scripts generated by infrastructure.

    infrastructure.localization = infrastructure.localization || {};

    infrastructure.localization.languages = [];

    infrastructure.localization.currentLanguage = {};

    infrastructure.localization.sources = [];

    infrastructure.localization.values = {};

    infrastructure.localization.localize = function (key, sourceName) {
        sourceName = sourceName || infrastructure.localization.defaultSourceName;
        var source = infrastructure.localization.values[sourceName];
        
        if (!source) {
            infrastructure.log.warn('Could not find localization source: ' + sourceName);
            return key;
        }
        var value = source[key];

        if (value == undefined) {
            return key;
        }
        var copiedArguments = Array.prototype.slice.call(arguments, 0);
        copiedArguments.splice(1, 1);
        copiedArguments[0] = value;
        return infrastructure.utils.formatString.apply(this, copiedArguments);
    };
    infrastructure.localization.getSource = function (sourceName) {
        return function (key) {
            var copiedArguments = Array.prototype.slice.call(arguments, 0);
            copiedArguments.splice(1, 0, sourceName);
            return infrastructure.localization.localize.apply(this, copiedArguments);
        };
    };
    infrastructure.localization.isCurrentCulture = function (name) {
        return infrastructure.localization.currentCulture
            && infrastructure.localization.currentCulture.name
            && infrastructure.localization.currentCulture.name.indexOf(name) == 0;
    };

    infrastructure.localization.defaultSourceName = undefined;
    infrastructure.localization.infrastructureWeb = infrastructure.localization.getSource('InfrastructureWeb');

    /* AUTHORIZATION **********************************************/
    //Implements Authorization API that simplifies usage of authorization scripts generated by infrastructure.

    infrastructure.auth = infrastructure.auth || {};

    infrastructure.auth.allPermissions = infrastructure.auth.allPermissions || {};

    infrastructure.auth.grantedPermissions = infrastructure.auth.grantedPermissions || {};

    //Deprecated. Use infrastructure.auth.isGranted instead.
    infrastructure.auth.hasPermission = function (permissionName) {
        return infrastructure.auth.isGranted.apply(this, arguments);
    };

    //Deprecated. Use infrastructure.auth.isAnyGranted instead.
    infrastructure.auth.hasAnyOfPermissions = function () {
        return infrastructure.auth.isAnyGranted.apply(this, arguments);
    };

    //Deprecated. Use infrastructure.auth.areAllGranted instead.
    infrastructure.auth.hasAllOfPermissions = function () {
        return infrastructure.auth.areAllGranted.apply(this, arguments);
    };

    infrastructure.auth.isGranted = function (permissionName) {
        return infrastructure.auth.allPermissions[permissionName] != undefined && infrastructure.auth.grantedPermissions[permissionName] != undefined;
    };

    infrastructure.auth.isAnyGranted = function () {

        if (!arguments || arguments.length <= 0) {
            return true;
        }

        for (var i = 0; i < arguments.length; i++) {

            if (infrastructure.auth.isGranted(arguments[i])) {
                return true;
            }
        }

        return false;
    };

    infrastructure.auth.areAllGranted = function () {

        if (!arguments || arguments.length <= 0) {
            return true;
        }

        for (var i = 0; i < arguments.length; i++) {

            if (!infrastructure.auth.isGranted(arguments[i])) {
                return false;
            }
        }
        return true;
    };

    infrastructure.auth.tokenCookieName = 'infrastructure.AuthToken';

    infrastructure.auth.setToken = function (authToken, expireDate) {
        infrastructure.utils.setCookieValue(infrastructure.auth.tokenCookieName, authToken, expireDate, infrastructure.appPath);
    };

    infrastructure.auth.getToken = function () {
        return infrastructure.utils.getCookieValue(infrastructure.auth.tokenCookieName);
    }

    infrastructure.auth.clearToken = function () {
        infrastructure.auth.setToken();
    }

    /* FEATURE SYSTEM *********************************************/
    //Implements Features API that simplifies usage of feature scripts generated by infrastructure.

    infrastructure.features = infrastructure.features || {};

    infrastructure.features.allFeatures = infrastructure.features.allFeatures || {};

    infrastructure.features.get = function (name) {
        return infrastructure.features.allFeatures[name];
    }

    infrastructure.features.getValue = function (name) {
        var feature = infrastructure.features.get(name);

        if (feature == undefined) {
            return undefined;
        }
        return feature.value;
    }

    infrastructure.features.isEnabled = function (name) {
        var value = infrastructure.features.getValue(name);
        return value == 'true' || value == 'True';
    }

    /* SETTINGS **************************************************/
    //Implements Settings API that simplifies usage of setting scripts generated by infrastructure.

    infrastructure.setting = infrastructure.setting || {};

    infrastructure.setting.values = infrastructure.setting.values || {};

    infrastructure.setting.get = function (name) {
        return infrastructure.setting.values[name];
    };

    infrastructure.setting.getBoolean = function (name) {
        var value = infrastructure.setting.get(name);
        return value == 'true' || value == 'True';
    };

    infrastructure.setting.getInt = function (name) {
        return parseInt(infrastructure.setting.values[name]);
    };

    /* REALTIME NOTIFICATIONS ************************************/

    infrastructure.notifications = infrastructure.notifications || {};

    infrastructure.notifications.severity = {
        INFO: 0,
        SUCCESS: 1,
        WARN: 2,
        ERROR: 3,
        FATAL: 4
    };

    infrastructure.notifications.notificationState = {
        UNREAD: 0,
        READ: 1
    };

    infrastructure.notifications.getUserNotificationStateAsString = function (userNotificationState) {

        switch (userNotificationState) {
            case infrastructure.notifications.notificationState.READ:
                return 'READ';
            case infrastructure.notifications.notificationState.UNREAD:
                return 'UNREAD';
            default:
                infrastructure.log.warn('Unknown user notification state value: ' + userNotificationState)
                return '?';
        }
    };

    infrastructure.notifications.getUiNotifyFuncBySeverity = function (severity) {

        switch (severity) {
            case infrastructure.notifications.severity.SUCCESS:
                return infrastructure.notify.success;
            case infrastructure.notifications.severity.WARN:
                return infrastructure.notify.warn;
            case infrastructure.notifications.severity.ERROR:
                return infrastructure.notify.error;
            case infrastructure.notifications.severity.FATAL:
                return infrastructure.notify.error;
            case infrastructure.notifications.severity.INFO:
            default:
                return infrastructure.notify.info;
        }
    };

    infrastructure.notifications.messageFormatters = {};

    infrastructure.notifications.messageFormatters['Infrastructure.Notifications.MessageNotificationData'] = function (notification) {
        return notification.notification.data.message;
    };
    infrastructure.notifications.messageFormatters['Infrastructure.Notifications.LocalizableMessageNotificationData'] = function (notification) {
        var localizedMessage = infrastructure.localization.localize(
            notification.notification.data.message.name,
            notification.notification.data.message.sourceName
        );

        if (notification.notification.data.properties) {

            if ($) {
                //Prefer to use jQuery if possible
                $.each(notification.notification.data.properties, function (key, value) {
                    localizedMessage = localizedMessage.replace('{' + key + '}', value);
                });
            }
            else {
                //alternative for $.each
                var properties = Object.keys(notification.notification.data.properties);

                for (var i = 0; i < properties.length; i++) {
                    localizedMessage = localizedMessage.replace('{' + properties[i] + '}', notification.notification.data.properties[properties[i]]);
                }
            }
        }
        return localizedMessage;
    };

    infrastructure.notifications.getFormattedMessageFromNotification = function (notification) {
        var formatter = infrastructure.notifications.messageFormatters[notification.notification.data.type];

        if (!formatter) {
            infrastructure.log.warn('No message formatter defined for given data type: ' + notification.notification.data.type)
            return '?';
        }

        if (!infrastructure.utils.isFunction(formatter)) {
            infrastructure.log.warn('Message formatter should be a function! It is invalid for data type: ' + notification.notification.data.type)
            return '?';
        }
        return formatter(notification);
    }

    infrastructure.notifications.showUiNotifyForUserNotification = function (notification, options) {
        var message = infrastructure.notifications.getFormattedMessageFromNotification(notification);
        var uiNotifyFunc = infrastructure.notifications.getUiNotifyFuncBySeverity(notification.notification.severity);
        uiNotifyFunc(message, undefined, options);
    }
})(jQuery);

(function (infrastructure, angular) {

    if (!angular) {
        return;
    }
    var infrastructureModule = angular.module('infrastructure', []);
})((infrastructure || (infrastructure = {})), (angular || undefined));