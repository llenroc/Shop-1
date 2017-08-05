(function (infrastructure, angular) {

	if (!angular) {
		return;
	}
	infrastructure.ng = infrastructure.ng || {};

	infrastructure.ng.http = {
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
				return infrastructure.message.error(error.details, error.message || infrastructure.ng.http.defaultError.message);
			}
			else {
				return infrastructure.message.error(error.message || infrastructure.ng.http.defaultError.message);
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
		handleNoninfrastructureErrorResponse: function (response, defer) {

			if (response.config.infrastructureHandleError !== false) {

				switch (response.status) {
					case 401:
						infrastructure.ng.http.handleUnAuthorizedRequest(
                            infrastructure.ng.http.showError(infrastructure.ng.http.defaultError401),
                            infrastructure.appPath
                        );
						break;
					case 403:
						infrastructure.ng.http.showError(infrastructure.ajax.defaultError403);
						break;
					case 404:
						infrastructure.ng.http.showError(infrastructure.ajax.defaultError404);
						break;
					default:
						infrastructure.ng.http.showError(infrastructure.ng.http.defaultError);
						break;
				}
			}
			defer.reject(response);
		},
		handleUnAuthorizedRequest: function (messagePromise, targetUrl) {

			if (messagePromise) {
				messagePromise.done(function () {
					infrastructure.ng.http.handleTargetUrl(targetUrl || infrastructure.appPath);
				});
			}
			else {
				infrastructure.ng.http.handleTargetUrl(targetUrl || infrastructure.appPath);
			}
		},
		handleResponse: function (response, defer) {
			var originalData = response.data;

			if (originalData.success === true) {
				response.data = originalData.result;
				defer.resolve(response);

				if (originalData.targetUrl) {
					infrastructure.ng.http.handleTargetUrl(originalData.targetUrl);
				}
			}
			else if (originalData.success === false) {
				var messagePromise = null;

				if (originalData.error) {

					if (response.config.infrastructureHandleError !== false) {
						messagePromise = infrastructure.ng.http.showError(originalData.error);
					}
				}
				else {
					originalData.error = defaultError;
				}
				infrastructure.ng.http.logError(originalData.error);

				response.data = originalData.error;
				defer.reject(response);

				if (response.status == 401 && response.config.infrastructureHandleError !== false) {
					infrastructure.ng.http.handleUnAuthorizedRequest(messagePromise, originalData.targetUrl);
				}
			}
			else { //not wrapped result
				defer.resolve(response);
			}
		}
	}
	var infrastructureModule = angular.module('infrastructure', []);

	infrastructureModule.config(['$httpProvider',
    function ($httpProvider) {
    	$httpProvider.interceptors.push(['$q',function ($q) {
        	return {
        		'request': function (config) {

        			if (endsWith(config.url, '.cshtml')) {
        				config.url = infrastructure.appPath + 'appView/Load?viewUrl=' + config.url + '&_t=' + infrastructure.pageLoadTime.getTime();
        			}
        			return config;
        		},
        		'response': function (response) {

        			//Non infrastructure related return value
        			if (!response.data || !response.data.__infrastructure) {
        				return response;
        			}
        			var defer = $q.defer();
        			infrastructure.ng.http.handleResponse(response, defer);
        			return defer.promise;
        		},
        		'responseError': function (ngError) {
        			var defer = $q.defer();

        			if (!ngError.data || !ngError.data.__infrastructure) {
        				infrastructure.ng.http.handleNoninfrastructureErrorResponse(ngError, defer);
        			}
        			else {
        				infrastructure.ng.http.handleResponse(ngError, defer);
        			}
        			return defer.promise;
        		}
        	};
        }]);
    }]);

	function endsWith(str, suffix) {

		if (suffix.length > str.length) {
			return false;
		}
		return str.indexOf(suffix, str.length - suffix.length) !== -1;
	}
})((infrastructure || (infrastructure = {})), (angular || undefined));