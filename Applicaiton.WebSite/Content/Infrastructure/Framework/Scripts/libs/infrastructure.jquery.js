var infrastructure = infrastructure || {};
(function ($) {

    if (!$) {
        return;
    }

    /* JQUERY ENHANCEMENTS ***************************************************/

    // infrastructure.ajax -> uses $.ajax ------------------------------------------------

    infrastructure.ajax = function (userOptions) {
        userOptions = userOptions || {};

        var options = $.extend({}, infrastructure.ajax.defaultOpts, userOptions);
        options.success = undefined;
        options.error = undefined;

        return $.Deferred(function ($dfd) {
            $.ajax(options).done(function (data, textStatus, jqXHR) {

                if (data.__infrastructure) {
                    infrastructure.ajax.handleResponse(data, userOptions, $dfd, jqXHR);
                }
                else {
                    $dfd.resolve(data);
                    userOptions.success && userOptions.success(data);
                }
            }).fail(function (jqXHR) {

                if (jqXHR.responseJSON && jqXHR.responseJSON.__infrastructure) {
                    infrastructure.ajax.handleResponse(jqXHR.responseJSON, userOptions, $dfd, jqXHR);
                }
                else {
                    infrastructure.ajax.handleNonInfrastructureErrorResponse(jqXHR, userOptions, $dfd);
                }
            }).complete(function (XMLHttpRequest, textStatus) {
                $dfd.resolve(textStatus);
                userOptions.complete && userOptions.complete(textStatus);
            });
        });
    };
    $.extend(infrastructure.ajax, {
        defaultOpts: {
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json'
        },
        defaultError: {
            message: 'An error has occurred!',
            details: 'Error detail not sent by server.'
        },

        defaultError401: {
            message: 'You are not authenticated!',
            details: 'You should be authenticated (sign in) in order to perform this operation.'
        },

        defaultError403: {
            message: 'You are not authorized!',
            details: 'You are not allowed to perform this operation.'
        },

        defaultError404: {
            message: 'Resource not found!',
            details: 'The resource requested could not found on the server.'
        },
        logError: function (error) {
            infrastructure.log.error(error);
        },

        showError: function (error) {

            if (error.details) {
                return infrastructure.message.error(error.details, error.message);
            }
            else {
                return infrastructure.message.error(error.message || infrastructure.ajax.defaultError.message);
            }
        },
        handleTargetUrl: function (targetUrl) {

            if (!targetUrl) {
                location.href = infrastructure.appPath;
            }
            else {
                location.href = targetUrl;
            }
        },

        handleNonInfrastructureErrorResponse: function (jqXHR, userOptions, $dfd) {

            if (userOptions.infrastructureHandleError !== false) {

                switch (jqXHR.status) {
                    case 401:
                        infrastructure.ajax.handleUnAuthorizedRequest(
                            infrastructure.ajax.showError(infrastructure.ajax.defaultError401),
                            infrastructure.appPath
                        );
                        break;
                    case 403:
                        infrastructure.ajax.showError(infrastructure.ajax.defaultError403);
                        break;
                    case 404:
                        infrastructure.ajax.showError(infrastructure.ajax.defaultError404);
                        break;
                    default:
                        infrastructure.ajax.showError(infrastructure.ajax.defaultError);
                        break;
                }
            }
            $dfd.reject.apply(this, arguments);
            userOptions.error && userOptions.error.apply(this, arguments);
        },

        handleUnAuthorizedRequest: function (messagePromise, targetUrl) {

            if (messagePromise) {
                messagePromise.done(function () {
                    infrastructure.ajax.handleTargetUrl(targetUrl);
                });
            }
            else {
                infrastructure.ajax.handleTargetUrl(targetUrl);
            }
        },

        handleResponse: function (data, userOptions, $dfd, jqXHR) {
           
            if (data) {

                if (data.success === true) {
                   
                    $dfd && $dfd.resolve(data.result, data, jqXHR);
                   
                    userOptions.success && userOptions.success(data.result, data, jqXHR);

                    if (data.targetUrl) {
                        infrastructure.ajax.handleTargetUrl(data.targetUrl);
                    }
                }
                else if (data.success === false) {
                    var messagePromise = null;

                    if (data.error) {

                        if (userOptions.infrastructureHandleError !== false) {
                            messagePromise = infrastructure.ajax.showError(data.error);
                        }
                    }
                    else {
                        data.error = infrastructure.ajax.defaultError;
                    }

                    infrastructure.ajax.logError(data.error);

                    $dfd && $dfd.reject(data.error, jqXHR);
                    userOptions.error && userOptions.error(data.error, jqXHR);

                    if (jqXHR.status === 401 && userOptions.infrastructureHandleError !== false) {
                        infrastructure.ajax.handleUnAuthorizedRequest(messagePromise, data.targetUrl);
                    }
                }
                else { //not wrapped result
                    $dfd && $dfd.resolve(data, null, jqXHR);
                    userOptions.success && userOptions.success(data, null, jqXHR);
                }
            }
            else { //no data sent to back
                $dfd && $dfd.resolve(jqXHR);
                userOptions.success && userOptions.success(jqXHR);
            }
        },

        ajaxSendHandler: function (event, request, settings) {

            var token = infrastructure.security.antiForgery.getToken();

            if (!token) {
                return;
            }

            if (!settings.headers || settings.headers[infrastructure.security.antiForgery.tokenHeaderName] === undefined) {
                request.setRequestHeader(infrastructure.security.antiForgery.tokenHeaderName, token);
            }
        },
        blockUI: function (options) {

            if (options.blockUI) {

                if (options.blockUI === true) { //block whole page
                    infrastructure.ui.setBusy();
                }
                else { //block an element
                    infrastructure.ui.setBusy(options.blockUI);
                }
            }
        },

        unblockUI: function (options) {

            if (options.blockUI) {

                if (options.blockUI === true) { //unblock whole page
                    infrastructure.ui.clearBusy();
                }
                else { //unblock an element
                    infrastructure.ui.clearBusy(options.blockUI);
                }
            }
        },
    });

    $(document).ajaxSend(function (event, request, settings) {
        return infrastructure.ajax.ajaxSendHandler(event, request, settings);
    });

    /* JQUERY PLUGIN ENHANCEMENTS ********************************************/

    /* jQuery Form Plugin 
     * http://www.malsup.com/jquery/form/
     */

    // infrastructureAjaxForm -> uses ajaxForm ------------------------------------------

    if ($.fn.ajaxForm) {
        $.fn.infrastructureAjaxForm = function (userOptions) {
            userOptions = userOptions || {};

            var options = $.extend({}, $.fn.infrastructureAjaxForm.defaults, userOptions);

            options.beforeSubmit = function () {
                infrastructure.ajax.blockUI(options);
                userOptions.beforeSubmit && userOptions.beforeSubmit.apply(this, arguments);
            };

            options.success = function (data) {
                infrastructure.ajax.handleResponse(data, userOptions);
            };

            //TODO: Error?

            options.complete = function () {
                infrastructure.ajax.unblockUI(options);
                userOptions.complete && userOptions.complete.apply(this, arguments);
            };

            return this.ajaxForm(options);
        };

        $.fn.infrastructureAjaxForm.defaults = {
            method: 'POST'
        };
    }

    infrastructure.event.on('infrastructure.dynamicScriptsInitialized', function () {
        infrastructure.ajax.defaultError.message = infrastructure.localization.infrastructureWeb('DefaultError');
        infrastructure.ajax.defaultError.details = infrastructure.localization.infrastructureWeb('DefaultErrorDetail');
        infrastructure.ajax.defaultError401.message = infrastructure.localization.infrastructureWeb('DefaultError401');
        infrastructure.ajax.defaultError401.details = infrastructure.localization.infrastructureWeb('DefaultErrorDetail401');
        infrastructure.ajax.defaultError403.message = infrastructure.localization.infrastructureWeb('DefaultError403');
        infrastructure.ajax.defaultError403.details = infrastructure.localization.infrastructureWeb('DefaultErrorDetail403');
        infrastructure.ajax.defaultError404.message = infrastructure.localization.infrastructureWeb('DefaultError404');
        infrastructure.ajax.defaultError404.details = infrastructure.localization.infrastructureWeb('DefaultErrorDetail404');
    });

})(jQuery);