(function () {
    angular.module('ui.modal', []).provider('$uiResolve', function () {
        var resolve = this;
        this.resolver = null;

        this.setResolver = function (resolver) {
            this.resolver = resolver;
        };
        this.$get = ['$injector', '$q', function ($injector, $q) {
            var resolver = resolve.resolver ? $injector.get(resolve.resolver) : null;
            return {
                resolve: function (invocables, locals, parent, self) {

                    if (resolver) {
                        return resolver.resolve(invocables, locals, parent, self);
                    }
                    var promises = [];
                    angular.forEach(invocables, function (value) {

                        if (angular.isFunction(value) || angular.isArray(value)) {
                            promises.push($q.resolve($injector.invoke(value)));
                        }
                        else if (angular.isString(value)) {
                            promises.push($q.resolve($injector.get(value)));
                        }
                        else {
                            promises.push($q.resolve(value));
                        }
                    });

                    return $q.all(promises).then(function (resolves) {
                        var resolveObj = {};
                        var resolveIter = 0;

                        angular.forEach(invocables, function (value, key) {
                            resolveObj[key] = resolves[resolveIter++];
                        });
                        return resolveObj;
                    });
                }
            };
        }];
    }).factory('$$stackedMap', function() {
      return {
          createNew: function() {
              var stack = [];
              return {
                  add: function(key, value) {
                      stack.push({
                          key: key,
                          value: value
                      });
                  },
                  get: function(key) {
                      for (var i = 0; i < stack.length; i++) {
                          if (key === stack[i].key) {
                              return stack[i];
                          }
                      }
                  },
                  keys: function() {
                      var keys = [];
                      for (var i = 0; i < stack.length; i++) {
                          keys.push(stack[i].key);
                      }
                      return keys;
                  },
                  top: function() {
                      return stack[stack.length - 1];
                  },
                  remove: function(key) {
                      var idx = -1;
                      for (var i = 0; i < stack.length; i++) {
                          if (key === stack[i].key) {
                              idx = i;
                              break;
                          }
                      }
                      return stack.splice(idx, 1)[0];
                  },
                  removeTop: function() {
                      return stack.splice(stack.length - 1, 1)[0];
                  },
                  length: function() {
                      return stack.length;
                  }
              };
          }
      };
  }).factory('$uiModalStack', ['$compile', '$rootScope', '$q', function ($compile, $rootScope, $q) {
        var $modalStack = {
            NOW_CLOSING_EVENT: 'modal.stack.now-closing'
        };
        $modalStack.close = function (modalInstance, result) {
            modalInstance.dialog.hide();
            modalInstance.modal.deferred.resolve(result);
        };
        $modalStack.dismiss = function (modalInstance, reason) {
            modalInstance.dialog.hide();
            modalInstance.modal.deferred.reject(reason);
        };
        $modalStack.modalRendered = function (modalInstance) {
            modalInstance.modal.renderDeferred.resolve();
        };
        $modalStack.open = function (modalInstance, modal) {
            modalInstance.modal = modal;
            var dialog;

            if (modal.autoCreateFrame) {
                dialog = new Dialog(null,{
                    fullPage: modal.fullPage,
                    responsive: modal.responsive,
                    onInitialize: function () {
                        modalInstance.dialog = this;
                    },
                    lifeCycle: Dialog.LifeCycle.Transient,
                });
                dialog.setContent(modal.content);
            }
            else {
                var $modalContent = $(modal.content).appendTo(document.body);

                dialog = new Dialog($modalContent,{
                    fullPage: modal.fullPage,
                    onInitialize: function () {
                        modalInstance.dialog = this;
                    },
                    lifeCycle: Dialog.LifeCycle.Transient,
                });
            }

            if (modalInstance.onOk) {
                dialog.settings.okHandle=modalInstance.onOk;
            }
            $compile(dialog.$element[0])(modal.scope);
            dialog.show();
        };
        return $modalStack;
    }]).provider('$uiModal',function () {
        var $modalProvider = {
            options: {
                fullPage: false,
                autoCreateFrame: false,
                responsive:false,
                animation: true,
            },
            $get: ['$rootScope', '$q', '$templateRequest', '$controller', '$uiResolve', '$uiModalStack',
            function ($rootScope, $q, $templateRequest, $controller,$uiResolve, $modalStack) {
                var $modal = {};

                function getTemplatePromise(options) {
                    return options.template ?
                        $q.when(options.template) :
                        $templateRequest(angular.isFunction(options.templateUrl) ?
                        options.templateUrl() :
                        options.templateUrl);
                }
                var promiseChain = null;

                $modal.getPromiseChain = function () {
                    return promiseChain;
                };

                $modal.open = function (modalOptions) {
                    var modalResultDeferred = $q.defer();
                    var modalOpenedDeferred = $q.defer();
                    var modalClosedDeferred = $q.defer();
                    var modalRenderDeferred = $q.defer();

                    //prepare an instance of a modal to be injected into controllers and returned to a caller
                    var modalInstance = {
                        result: modalResultDeferred.promise,
                        opened: modalOpenedDeferred.promise,
                        closed: modalClosedDeferred.promise,
                        rendered: modalRenderDeferred.promise,
                        close: function (result) {
                            return $modalStack.close(modalInstance, result);
                        },
                        dismiss: function (reason) {
                            return $modalStack.dismiss(modalInstance, reason);
                        }
                    };

                    //merge and clean up options
                    modalOptions = angular.extend({},
                    $modalProvider.options, modalOptions);
                    modalOptions.resolve = modalOptions.resolve || {};
                    modalOptions.appendTo = modalOptions.appendTo || document.body;

                    //verify options
                    if (!modalOptions.template && !modalOptions.templateUrl) {
                        throw new Error('One of template or templateUrl options is required.');
                    }
                    var templateAndResolvePromise = $q.all([getTemplatePromise(modalOptions), $uiResolve.resolve(modalOptions.resolve, {}, null, null)]);

                    function resolveWithTemplate() {
                        return templateAndResolvePromise;
                    }

                    // Wait for the resolution of the existing promise chain.
                    // Then switch to our own combined promise dependency (regardless of how the previous modal fared).
                    // Then add to $modalStack and resolve opened.
                    // Finally clean up the chain variable if no subsequent modal has overwritten it.
                    var samePromise;
                    samePromise = promiseChain = $q.all([promiseChain]).then(resolveWithTemplate, resolveWithTemplate).then(function resolveSuccess(tplAndVars) {
                        var providedScope = modalOptions.scope || $rootScope;

                        var modalScope = providedScope.$new();
                        modalScope.$close = modalInstance.close;
                        modalScope.$dismiss = modalInstance.dismiss;

                        modalScope.$on('$destroy',function () {

                            if (!modalScope.$$uibDestructionScheduled) {
                                modalScope.$dismiss('$uibUnscheduledDestruction');
                            }
                        });

                        var ctrlInstance, ctrlInstantiate, ctrlLocals = {};

                        //controllers
                        if (modalOptions.controller) {
                            ctrlLocals.$scope = modalScope;
                            ctrlLocals.$scope.$resolve = {};
                            ctrlLocals.$uiModalInstance = modalInstance;

                            angular.forEach(tplAndVars[1],function (value, key) {
                                ctrlLocals[key] = value;
                                ctrlLocals.$scope.$resolve[key] = value;
                            });

                            // the third param will make the controller instantiate later,private api
                            // @see https://github.com/angular/angular.js/blob/master/src/ng/controller.js#L126
                            ctrlInstantiate = $controller(modalOptions.controller, ctrlLocals, true, modalOptions.controllerAs);

                            if (modalOptions.controllerAs && modalOptions.bindToController) {
                                ctrlInstance = ctrlInstantiate.instance;
                                ctrlInstance.$close = modalScope.$close;
                                ctrlInstance.$dismiss = modalScope.$dismiss;
                                angular.extend(ctrlInstance, {
                                    $resolve: ctrlLocals.$scope.$resolve
                                },
                                providedScope);
                            }
                            ctrlInstance = ctrlInstantiate();

                            if (angular.isFunction(ctrlInstance.$onInit)) {
                                ctrlInstance.$onInit();
                            }
                        }

                        //open modal
                        $modalStack.open(modalInstance, {
                            scope: modalScope,

                            deferred: modalResultDeferred,
                            renderDeferred: modalRenderDeferred,
                            closedDeferred: modalClosedDeferred,

                            content: tplAndVars[0],

                            onOk: null,
                            autoCreateFrame: modalOptions.autoCreateFrame,
                            fullPage: modalOptions.fullPage,
                            responsive: modalOptions.responsive,

                            animation: modalOptions.animation,
                            backdrop: modalOptions.backdrop,
                            keyboard: modalOptions.keyboard,
                            backdropClass: modalOptions.backdropClass,
                            windowTopClass: modalOptions.windowTopClass,
                            windowClass: modalOptions.windowClass,
                            windowTemplateUrl: modalOptions.windowTemplateUrl,
                            size: modalOptions.size,
                            openedClass: modalOptions.openedClass,
                            appendTo: modalOptions.appendTo
                        });
                        modalOpenedDeferred.resolve(true);

                    },
                    function resolveError(reason) {
                        modalOpenedDeferred.reject(reason);
                        modalResultDeferred.reject(reason);
                    })['finally'](function () {

                        if (promiseChain === samePromise) {
                            promiseChain = null;
                        }
                    });
                    return modalInstance;
                };
                return $modal;
            }]
        };
        return $modalProvider;
    });
})();