/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 12);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

module.exports = jQuery;

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
/**
 * Created by canknow on 2017/6/25.
 */
var Util = function ($) {

    /**
     * ------------------------------------------------------------------------
     * Private TransitionEnd Helpers
     * ------------------------------------------------------------------------
     */

    var transition = false;

    var MAX_UID = 1000000;

    var TransitionEndEvent = {
        WebkitTransition: 'webkitTransitionEnd',
        MozTransition: 'transitionend',
        OTransition: 'oTransitionEnd otransitionend',
        transition: 'transitionend'
    };

    // shoutout AngusCroll (https://goo.gl/pxwQGp)
    function toType(obj) {
        return {}.toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase();
    }

    function isElement(obj) {
        return (obj[0] || obj).nodeType;
    }

    function getSpecialTransitionEndEvent() {
        return {
            bindType: transition.end,
            delegateType: transition.end,
            handle: function handle(event) {
                if ($(event.target).is(this)) {
                    return event.handleObj.handler.apply(this, arguments); // eslint-disable-line prefer-rest-params
                }
                return undefined;
            }
        };
    }

    function transitionEndTest() {

        if (window.QUnit) {
            return false;
        }
        var el = document.createElement('bootstrap');

        for (var name in TransitionEndEvent) {

            if (el.style[name] !== undefined) {
                return {
                    end: TransitionEndEvent[name]
                };
            }
        }
        return false;
    }

    function transitionEndEmulator(duration) {
        var _this = this;

        var called = false;

        $(this).one(Util.TRANSITION_END, function () {
            called = true;
        });

        setTimeout(function () {
            if (!called) {
                Util.triggerTransitionEnd(_this);
            }
        }, duration);
        return this;
    }

    function setTransitionEndSupport() {
        transition = transitionEndTest();
        $.fn.emulateTransitionEnd = transitionEndEmulator;

        if (Util.supportsTransitionEnd()) {
            $.event.special[Util.TRANSITION_END] = getSpecialTransitionEndEvent();
        }
    }

    /**
     * --------------------------------------------------------------------------
     * Public Util Api
     * --------------------------------------------------------------------------
     */

    var Util = {
        TRANSITION_END: 'canknowTransitionEnd',
        getUID: function getUID(prefix) {
            do {
                // eslint-disable-next-line no-bitwise
                prefix += ~~(Math.random() * MAX_UID); // "~~" acts like a faster Math.floor() here
            } while (document.getElementById(prefix));
            return prefix;
        },
        getSelectorFromElement: function getSelectorFromElement(element) {
            var selector = element.getAttribute('data-target');

            if (!selector || selector === '#') {
                selector = element.getAttribute('href') || '';
            }

            try {
                var $selector = $(selector);
                return $selector.length > 0 ? selector : null;
            } catch (error) {
                return null;
            }
        },
        reflow: function reflow(element) {
            return element.offsetHeight;
        },
        triggerTransitionEnd: function triggerTransitionEnd(element) {
            $(element).trigger(transition.end);
        },
        supportsTransitionEnd: function supportsTransitionEnd() {
            return Boolean(transition);
        },
        typeCheckConfig: function typeCheckConfig(componentName, config, configTypes) {

            for (var property in configTypes) {

                if (configTypes.hasOwnProperty(property)) {
                    var expectedTypes = configTypes[property];
                    var value = config[property];
                    var valueType = value && isElement(value) ? 'element' : toType(value);

                    if (!new RegExp(expectedTypes).test(valueType)) {
                        throw new Error(componentName.toUpperCase() + ': ' + ('Option "' + property + '" provided type "' + valueType + '" ') + ('but expected type "' + expectedTypes + '".'));
                    }
                }
            }
        }
    };
    setTransitionEndSupport();
    return Util;
}(jQuery);
exports.default = Util;

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _util = __webpack_require__(1);

var _util2 = _interopRequireDefault(_util);

var _localization = __webpack_require__(3);

var _localization2 = _interopRequireDefault(_localization);

var _object = __webpack_require__(5);

var _object2 = _interopRequireDefault(_object);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Dialog = function ($) {
    var NAME = 'dialog';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.dialog';
    var EVENT_KEY = '.' + DATA_KEY;
    var DATA_API_KEY = '.data-api';
    var TRANSITION_DURATION = 300;

    var ClassName = {
        OPEN: 'dialog-open',
        FADE: 'fade',
        SHOW: 'show'
    };

    var Event = {
        HIDE: "hide" + EVENT_KEY,
        HIDDEN: "hidden" + EVENT_KEY,
        SHOW: "show" + EVENT_KEY,
        SHOWN: "shown" + EVENT_KEY,
        FOCUSIN: "focusin" + EVENT_KEY,
        RESIZE: "resize" + EVENT_KEY,
        CLICK_DISMISS: "click.dismiss" + EVENT_KEY,
        KEYDOWN_DISMISS: "keydown.dismiss" + EVENT_KEY,
        MOUSEUP_DISMISS: "mouseup.dismiss" + EVENT_KEY,
        MOUSEDOWN_DISMISS: "mousedown.dismiss" + EVENT_KEY,
        CLICK_DATA_API: "click" + EVENT_KEY + DATA_API_KEY
    };

    var Selector = {
        DIALOG: '.dialog',
        DATA_DISMISS: '[data-dismiss="dialog"]'
    };

    var lifeCycle = {
        Transient: 0,
        Singleton: 1
    };
    var defaultSettings = {
        title: _localization2.default.localize("DialogTitle"),
        content: "",
        fullPage: false,
        responsive: false,
        closeButtonText: _localization2.default.localize("Close"),
        okButtonText: _localization2.default.localize("Ok"),
        onInitialize: function onInitialize() {},
        onHide: function onHide() {},
        okHandle: function okHandle() {
            console.log("notImplement");
        },
        closeHandle: function closeHandle() {
            this.hide();
        },
        lifeCycle: lifeCycle.Singleton,
        initialize: true
    };

    var Dialog = function () {
        function Dialog(element, options) {
            _classCallCheck(this, Dialog);

            this.settings = $.extend({}, Dialog.DefaultSettings, options);

            if (element) {
                this.$element = $(element);
            }
            this._isTransitioning = false;
            this.settings.initialize && this.initialize();
        }

        _createClass(Dialog, [{
            key: "initialize",
            value: function initialize() {
                this.settings.onInitialize.call(this);
                this.initializeID();
                var containerClassString = "container padding-1";
                containerClassString += this.settings.responsive ? "-responsive" : "";

                if (!this.$element) {
                    this.$element = $('<div class="dialog">\
                    <div class="header"><div class="' + containerClassString + '">\
                    <h5 class="title">' + this.settings.title + '</h5>\
                    <button class="button-icon button-close">×</button>\
                    </div></div>\
                    <div class="body"><div class="' + containerClassString + ' content"></div></div>\
                    <div class="footer"><div class="' + containerClassString + '">\
                    <button type="button" class="button-text border circle danger button-close">' + this.settings.closeButtonText + '</button>\
                    <button type="button" class="button-text border circle primary button-ok">' + this.settings.okButtonText + '</button>\
                    </div></div>\
                </div>').appendTo("body");
                }

                if (this.settings.fullPage) {
                    this.$element.addClass("dialog-page");
                }

                if (this.settings.responsive) {
                    this.$element.addClass("dialog-responsive").find(".container").addClass("container-responsive");
                }
                this.initializeContent();
                this.bindEvent();
            }
        }, {
            key: "initializeID",
            value: function initializeID() {

                if (!this.settings.id) {
                    this.id = 'Dialog_' + Math.floor(Math.random() * 1000000) + new Date().getTime();
                } else {
                    this.id = this.settings.id;
                }
                return this.id;
            }
        }, {
            key: "bindEvent",
            value: function bindEvent() {
                var _this = this;
                this.$element.find(".button-close").click(function () {
                    _this.settings.closeHandle.call(_this);
                });
                this.$element.find(".button-ok").click(function () {
                    _this.settings.okHandle.call(_this);
                });

                if (this.$element[0] && this.$element[0].id) {
                    $('[data-target=' + this.$element[0].id + ']').each(function () {

                        $(this).on("click.dialog.toggle", function () {
                            $(this.dataset.target).dialog().toggle();
                        });
                    });
                }

                $(window).on("resize", function () {
                    _this._setPosition();
                });
            }
        }, {
            key: "initializeContent",
            value: function initializeContent() {
                this.$content = this.$element.find(".content");

                if (this.settings.content) {
                    this.$content.html(this.settings.content);
                }
            }
        }, {
            key: "setContent",
            value: function setContent($element) {

                if ($element instanceof _jquery2.default) {
                    this.$content.append($element);
                } else if (typeof $element == 'string' && $element.constructor == String) {
                    this.$content.html($element);
                }
            }
        }, {
            key: "show",
            value: function show(callback) {
                var _this2 = this;

                if (this._isTransitioning) {
                    return;
                }

                if (_util2.default.supportsTransitionEnd() && this.$element.hasClass(ClassName.FADE)) {
                    this._isTransitioning = true;
                }
                var showEvent = $.Event(Event.SHOW);
                this.$element.trigger(showEvent);

                this.$element.on(Event.CLICK_DISMISS, Selector.DATA_DISMISS, function (event) {
                    return _this2.hide(event);
                });
                this._showElement(callback);
            }
        }, {
            key: "_setPosition",
            value: function _setPosition() {
                return this.$element.css({
                    top: ($(window).height() - this.$element.height()) / 2
                });
            }
        }, {
            key: "_showElement",
            value: function _showElement(callback) {
                var _this = this;
                var transition = _util2.default.supportsTransitionEnd() && this.$element.hasClass(ClassName.FADE);

                if (transition) {
                    _util2.default.reflow();
                }
                if (!this.settings.fullPage) {
                    this.$maskLayer = $("<div>").addClass("mask-layer fade-in").appendTo("body");
                    this._setPosition().addClass("show").removeClass("hide");
                } else {
                    this.$element.addClass("show").removeClass("hide");
                }
                var shownEvent = $.Event(Event.SHOWN);
                var transitionComplete = function transitionComplete() {
                    _this._isTransitioning = false;
                    _this.$element.trigger(shownEvent);

                    if (callback) {
                        callback.apply(_this);
                    }
                };

                if (transition) {
                    this.$element.one(_util2.default.TRANSITION_END, transitionComplete).emulateTransitionEnd(TRANSITION_DURATION);
                } else {
                    transitionComplete();
                }
            }
        }, {
            key: "hide",
            value: function hide(callback) {
                var _this3 = this;

                if (this._isTransitioning) {
                    return;
                }
                var transition = _util2.default.supportsTransitionEnd() && this.$element.hasClass(ClassName.FADE);

                if (transition) {
                    this._isTransitioning = true;
                }
                var hideEvent = $.Event(Event.HIDE);
                this.$element.trigger(hideEvent);
                this.$element.off(Event.CLICK_DISMISS);
                this.$element.off(Event.MOUSEDOWN_DISMISS);

                if (transition) {
                    this.$element.one(_util2.default.TRANSITION_END, function (event) {
                        return _this3._hideModal(event);
                    }).emulateTransitionEnd(TRANSITION_DURATION);
                } else {
                    this._hideModal(callback);
                }
            }
        }, {
            key: "_hideModal",
            value: function _hideModal(callback) {
                var _this = this;
                this.$element.removeClass("show").addClass("hide");
                this._isTransitioning = false;

                var transitionComplete = function transitionComplete() {

                    if (callback) {
                        callback.apply(_this);
                    }
                    _this.settings.onHide.call(_this);

                    if (_this.settings.lifeCycle == Dialog.LifeCycle.Transient) {
                        _this.remove();
                    }
                    _this.$maskLayer && _this.$maskLayer.remove();
                };

                if (this.$maskLayer) {
                    this.$maskLayer.one(_util2.default.TRANSITION_END, transitionComplete).addClass("fade-out").emulateTransitionEnd(TRANSITION_DURATION);
                } else {
                    transitionComplete();
                }
            }
        }, {
            key: "remove",
            value: function remove() {
                this.$element.remove();
                this.dispose();
            }
        }, {
            key: "toggle",
            value: function toggle() {
                this.$element.hasClass("show") ? this.hide() : this.show();
            }
        }, {
            key: "dispose",
            value: function dispose() {}
        }], [{
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new Dialog(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return defaultSettings;
            },
            set: function set(value) {
                defaultSettings = value;
            }
        }, {
            key: "VERSION",
            get: function get() {
                return VERSION;
            }
        }, {
            key: "LifeCycle",
            get: function get() {
                return lifeCycle;
            }
        }]);

        return Dialog;
    }();

    window.Dialog = Dialog;
    $.dialog = function (element, options) {
        return new Dialog(element, options);
    };
    $.fn[NAME] = Dialog._jQueryInterface;
    $.fn[NAME].Constructor = Dialog;
    return Dialog;
}(_jquery2.default);
exports.default = Dialog;

/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
var localization = function () {
    var languages = {};
    languages["en"] = {
        Confirm: "Confirm",
        Close: "Close",
        Ok: "Ok"
    };
    var localization = {
        currentLanguage: "en",
        languages: languages,
        getLanguage: function getLanguage(key) {
            return this.languages[key];
        },
        addLanguage: function addLanguage(culture, language) {
            this.languages[culture] = language;
        },
        setCulture: function setCulture(culture) {
            this.currentLanguage = this.languages[culture] ? this.languages[culture] : {};
        },
        localize: function localize(key) {
            var value = this.currentLanguage[key];

            if (value == undefined) {
                return key;
            }
            return this.currentLanguage[key];
        }
    };
    return localization;
}();
exports.default = localization;

/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var ValidateStatus = {
    toValid: 0,
    valid: 1,
    inValid: -1,
    pending: 2
};

var Validator = function () {
    function Validator(condition, beforeValidate, afterValidate) {
        _classCallCheck(this, Validator);

        this.isAsync = false;
        this.promise = null;
        this.condition = condition;
        this.beforeValidate = beforeValidate;
        this.afterValidate = afterValidate;
    }

    _createClass(Validator, [{
        key: "validate",
        value: function validate() {
            return true;
        }
    }], [{
        key: "name",
        get: function get() {
            return "notImplement";
        }
    }]);

    return Validator;
}();

var NumberValidator = function (_Validator) {
    _inherits(NumberValidator, _Validator);

    function NumberValidator(condition, beforeValidate, afterValidate) {
        _classCallCheck(this, NumberValidator);

        return _possibleConstructorReturn(this, (NumberValidator.__proto__ || Object.getPrototypeOf(NumberValidator)).call(this, condition, beforeValidate, afterValidate));
    }

    _createClass(NumberValidator, [{
        key: "validate",
        value: function validate(value) {

            if (/^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/.test(value)) {
                return true;
            } else {
                return false;
            }
        }
    }], [{
        key: "name",
        get: function get() {
            return "number";
        }
    }]);

    return NumberValidator;
}(Validator);

var DigitsValidator = function (_Validator2) {
    _inherits(DigitsValidator, _Validator2);

    function DigitsValidator(condition, beforeValidate, afterValidate) {
        _classCallCheck(this, DigitsValidator);

        return _possibleConstructorReturn(this, (DigitsValidator.__proto__ || Object.getPrototypeOf(DigitsValidator)).call(this, condition, beforeValidate, afterValidate));
    }

    _createClass(DigitsValidator, [{
        key: "validate",
        value: function validate(value) {

            if (/^\d+$/.test(value)) {
                return true;
            } else {
                return false;
            }
        }
    }], [{
        key: "name",
        get: function get() {
            return "digits";
        }
    }]);

    return DigitsValidator;
}(Validator);

var RequiredValidator = function (_Validator3) {
    _inherits(RequiredValidator, _Validator3);

    function RequiredValidator(condition, beforeValidate, afterValidate) {
        _classCallCheck(this, RequiredValidator);

        return _possibleConstructorReturn(this, (RequiredValidator.__proto__ || Object.getPrototypeOf(RequiredValidator)).call(this, condition, beforeValidate, afterValidate));
    }

    _createClass(RequiredValidator, [{
        key: "validate",
        value: function validate(value) {

            if (value && value.length) {
                return true;
            } else {
                return false;
            }
        }
    }], [{
        key: "name",
        get: function get() {
            return "required";
        }
    }]);

    return RequiredValidator;
}(Validator);

var RemoteValidator = function (_Validator4) {
    _inherits(RemoteValidator, _Validator4);

    function RemoteValidator(condition, beforeValidate, afterValidate) {
        _classCallCheck(this, RemoteValidator);

        return _possibleConstructorReturn(this, (RemoteValidator.__proto__ || Object.getPrototypeOf(RemoteValidator)).call(this, condition, beforeValidate, afterValidate));
    }

    _createClass(RemoteValidator, [{
        key: "validate",
        value: function validate(value) {
            var _this = this;
            var data = { value: value };
            var defer = $.Deferred();
            this.ajax = $.ajax({
                url: _this.condition,
                data: data,
                type: "POST",
                dataType: "json",
                beforeSend: function beforeSend() {
                    _this.beforeValidate && _this.beforeValidate();
                },
                success: function success(result) {

                    if (result.success) {
                        defer.resolve();
                    } else {
                        defer.reject();
                    }
                },
                error: function error(xhr, _error) {
                    defer.reject(_error);
                },
                complete: function complete() {
                    _this.afterValidate && _this.afterValidate();
                }
            });
            return defer.promise;
        }
    }], [{
        key: "name",
        get: function get() {
            return "remote";
        }
    }]);

    return RemoteValidator;
}(Validator);

var Validators = [NumberValidator, DigitsValidator, RequiredValidator, RemoteValidator];
exports.ValidateStatus = ValidateStatus;
exports.Validator = Validator;
exports.Validators = Validators;

/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
var ObjectPrototype = function () {}();
exports.default = ObjectPrototype;

/***/ }),
/* 6 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
var DatetimeLibs = function () {
    function toDatetimeLocal(datetime) {
        var date_time = datetime.split(' ');
        return date_time[0] + 'T' + date_time[1];
    }

    function toDatetime(datetimeLocal) {
        var date_time = datetimeLocal.split('T');
        return date_time[0] + ' ' + date_time[1];
    }

    function getDateTime() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();

        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }

        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        return date.getFullYear() + seperator1 + month + seperator1 + strDate + " " + date.getHours() + seperator2 + date.getMinutes() + seperator2 + date.getSeconds();;
    }

    //+---------------------------------------------------
    //| 日期合法性验证
    //| 格式为：YYYY-MM-DD或YYYY/MM/DD
    //+---------------------------------------------------
    function IsValidDate(dateStr) {
        var sDate = dateStr.replace(/(^\s+|\s+$)/g, ''); //去两边空格;

        if (sDate == '') return true;
        //如果格式满足YYYY-(/)MM-(/)DD或YYYY-(/)M-(/)DD或YYYY-(/)M-(/)D或YYYY-(/)MM-(/)D就替换为''
        //数据库中，合法日期可以是:YYYY-MM/DD(2003-3/21),数据库会自动转换为YYYY-MM-DD格式
        var s = sDate.replace(/[\d]{ 4,4 }[\-/]{ 1 }[\d]{ 1,2 }[\-/]{ 1 }[\d]{ 1,2 }/g, '');

        if (s == '') //说明格式满足YYYY-MM-DD或YYYY-M-DD或YYYY-M-D或YYYY-MM-D
            {
                var t = new Date(sDate.replace(/\-/g, '/'));
                var ar = sDate.split(/[-/:]/);

                if (ar[0] != t.getYear() || ar[1] != t.getMonth() + 1 || ar[2] != t.getDate()) {
                    //alert('错误的日期格式！格式为：YYYY-MM-DD或YYYY/MM/DD。注意闰年。');
                    return false;
                }
            } else {
            //alert('错误的日期格式！格式为：YYYY-MM-DD或YYYY/MM/DD。注意闰年。');
            return false;
        }
        return true;
    }

    //+---------------------------------------------------
    //| 日期时间检查
    //| 格式为：YYYY-MM-DD HH:MM:SS
    //+---------------------------------------------------
    function CheckDateTime(str) {
        var reg = /^(\d+)-(\d{ 1,2 })-(\d{ 1,2 }) (\d{ 1,2 }):(\d{ 1,2 }):(\d{ 1,2 })$/;
        var r = str.match(reg);

        if (r == null) return false;

        r[2] = r[2] - 1;
        var d = new Date(r[1], r[2], r[3], r[4], r[5], r[6]);
        if (d.getFullYear() != r[1]) return false;
        if (d.getMonth() != r[2]) return false;
        if (d.getDate() != r[3]) return false;
        if (d.getHours() != r[4]) return false;
        if (d.getMinutes() != r[5]) return false;
        if (d.getSeconds() != r[6]) return false;
        return true;
    }

    //+---------------------------------------------------
    //| 字符串转成日期类型
    //| 格式 MM/dd/YYYY MM-dd-YYYY YYYY/MM/dd YYYY-MM-dd
    //+---------------------------------------------------
    function StringToDate(dateStr) {
        var converted = Date.parse(dateStr);
        var myDate = new Date(converted);
        return myDate;
    }
    window.toDatetimeLocal = toDatetimeLocal;
    window.toDatetime = toDatetime;
    window.getDateTime = getDateTime;
    window.IsValidDate = IsValidDate;
    window.CheckDateTime = CheckDateTime;
    window.StringToDate = StringToDate;
}();
exports.default = DatetimeLibs;

/***/ }),
/* 7 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var JqueryExtention = function ($) {

    //判断:当前元素是否是被筛选元素的子元素
    $.fn.isChildOf = function (b) {
        return this.parents(b).length > 0;
    };

    //判断:当前元素是否是被筛选元素的子元素或者本身
    $.fn.isChildAndSelfOf = function (b) {
        return this.closest(b).length > 0;
    };

    $.fn.emulateTransitionEnd = function (duration) {
        var called = false,
            $el = this;

        $(this).one('webkitTransitionEnd', function () {
            called = true;
        });
        var callback = function callback() {

            if (!called) $($el).trigger('webkitTransitionEnd');
        };
        setTimeout(callback, duration);
    };

    $.fn.getReliablePosition = function () {
        var thisLeft = this.offset().left;
        var thisTop = this.offset().top;

        var parentLeft = this.Parent.offset().left;
        var parentTop = this.Parent.offset().top;

        return {
            left: thisLeft - parentLeft,
            top: thisTop - parentTop
        };
    };

    $.fn.serializeObject = function () {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function () {

            if (o[this.name]) {

                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };

    $.fn.serializeFormToObject = function () {
        //serialize to array
        var data = $(this).serializeArray();

        //add also disabled items
        $(':disabled[name]', this).each(function () {
            data.push({ name: this.name, value: $(this).val() });
        });

        //map to object
        var obj = {};
        data.map(function (x) {
            obj[x.name] = x.value;
        });

        return obj;
    };
}(_jquery2.default);
exports.default = JqueryExtention;

/***/ }),
/* 8 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _jqueryExtension = __webpack_require__(7);

var _jqueryExtension2 = _interopRequireDefault(_jqueryExtension);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Dropdown = function ($) {
    'use strict';

    var NAME = 'dropdown';
    var DATA_KEY = 'canknow.dropdown';
    var EVENT_KEY = '.' + DATA_KEY;
    var DATA_API_KEY = '.data-api';

    var Event = {
        HIDE: 'hide' + EVENT_KEY,
        SHOW: 'show' + EVENT_KEY,
        CLICK: 'click' + EVENT_KEY,
        CLICK_DATA_API: 'click' + EVENT_KEY + DATA_API_KEY
    };

    var Dropdown = function () {
        function Dropdown(element, options) {
            _classCallCheck(this, Dropdown);

            this.element = element;
            this.$element = $(element);
            this.settings = $.extend({}, Dropdown.DefaultSettings, options);
            this.$handlers = $('[data-target="#' + this.element.id + '"]');
            var $dropdownWripperToggle = this.$element.closest(".dropdown-wripper").find('[data-toggle="dropdown"]');

            if ($dropdownWripperToggle.length) {
                this.$handlers.push($dropdownWripperToggle.get(0));
            }

            if (this.settings.handler) {

                if (!this.$handlers.length) {
                    this.$handlers = this.settings.handler;
                } else {
                    this.$handlers.add(this.settings.handler);
                }
            }
            this.initialize();
        }

        _createClass(Dropdown, [{
            key: "initialize",
            value: function initialize() {
                var _this = this;
                this.$element.addClass("dropdown");

                if (this.settings.$positionTarget) {
                    this.setPosition();

                    $(window).on("resize", function () {
                        _this.setPosition();
                    });
                }
                this.bindEvent();
            }
        }, {
            key: "setPosition",
            value: function setPosition() {
                this.$element.css("left", this.settings.$positionTarget.offset().left);
                this.$element.css("top", this.settings.$positionTarget.offset().top + this.settings.$positionTarget.height());
            }
        }, {
            key: "bindEvent",
            value: function bindEvent() {
                var _this = this;
                this.$handlers.on(Event.CLICK_DATA_API, function (event) {
                    _this.settings.onClick(event);
                    _this.toggle.call(_this, event);
                });

                $(document).on(Event.CLICK, function (event) {

                    if ($(event.target).isChildAndSelfOf(_this.$handlers)) {
                        return;
                    }

                    if (!_this.$element.is(event.target)) {
                        _this.hide();
                    }
                });

                this.$element.click(function (event) {
                    event.stopPropagation();
                });
            }
        }, {
            key: "show",
            value: function show() {
                this.$element.removeClass("hide").show().closest(".dropdown-wripper").addClass("open");
                this.settings.onShow.call(this);

                var relatedTarget = {
                    relatedTarget: this
                };
                var showEvent = $.Event(Event.SHOW, relatedTarget);
                this.$element.trigger(showEvent);
            }
        }, {
            key: "hide",
            value: function hide() {
                this.$element.addClass("hide").hide().closest(".dropdown-wripper").removeClass("open");
                this.settings.onHide.call(this);

                var relatedTarget = {
                    relatedTarget: this
                };
                var hideEvent = $.Event(Event.HIDE, relatedTarget);
                this.$element.trigger(hideEvent);
            }
        }, {
            key: "toggle",
            value: function toggle(event) {

                if (this.$element.is(":hidden")) {
                    this.show(event);
                } else {
                    this.hide(event);
                }
                return false;
            }
        }, {
            key: "dispose",
            value: function dispose() {
                $.removeData(this.element, DATA_KEY);
                this.$element.off(EVENT_KEY);
                this.$handlers.off(CLICK_DATA_API);
                this.element = null;
            }
        }], [{
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new Dropdown(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return {
                    handler: null,
                    onClick: function onClick() {},
                    onShow: function onShow() {},
                    onHide: function onHide() {}
                };
            }
        }]);

        return Dropdown;
    }();

    $.fn[NAME] = Dropdown._jQueryInterface;
    $.fn[NAME].Constructor = Dropdown;
    return Dropdown;
}(_jquery2.default);
exports.default = Dropdown;

/***/ }),
/* 9 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _progress = __webpack_require__(33);

var _progress2 = _interopRequireDefault(_progress);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var FileUploader = function ($) {
    var NAME = 'fileUploader';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.fileUploader';

    var FileUploader = function () {
        function FileUploader(element, options) {
            _classCallCheck(this, FileUploader);

            if (!element && !options) {
                return;
            }
            this.element = element;
            this.$element = $(element);
            this.xhr = null;
            this.element.fileUploader = this;
            this.path = null;
            this.fileInput = this.element.querySelector("input[type=file]");
            this.valueInput = this.element.querySelector("input[type=hidden]");
            this.data = {};
            this.settings = $.extend({}, FileUploader.DefaultSettings, options);

            if (!this.settings.url) {
                this.settings.url = this.element.dataset['optionUrl'];
            }
            this.initializePreviewer();
            this.initialize();
        }

        _createClass(FileUploader, [{
            key: "abort",
            value: function abort() {

                if (this.xhr) {
                    this.xhr.abort();
                }
            }
        }, {
            key: "addData",
            value: function addData(key, value) {
                this.data[key] = value;
            }
        }, {
            key: "initialize",
            value: function initialize() {
                this.initializeProgress();
                this.bindEvent();
            }
        }, {
            key: "initializePreviewer",
            value: function initializePreviewer() {
                this.pathViewer = this.element.querySelector(".file-path");
            }
        }, {
            key: "initializeProgress",
            value: function initializeProgress() {
                var _this = this;

                if (this.settings.showProgress) {
                    this.$progress = this.$element.find(".progress");

                    if (!this.$progress.length) {
                        this.$progress = $("<div>").appendTo(this.$element);
                    }
                    this.progress = this.$progress.progress({
                        autoHide: true
                    }).data("canknow.progress");
                    this.settings.progress = function (value) {
                        _this.progress.setValue(value.loaded / value.total * 100);
                    };
                }
            }
        }, {
            key: "bindEvent",
            value: function bindEvent() {
                var _this = this;
                this.fileInput.addEventListener("change", function (e) {
                    _this.progress.show();
                    _this.settings.beforeUpload();
                    var file = this.files[0];
                    var formData = new FormData();
                    formData.append("file", file);

                    for (var i in _this.data) {
                        formData.append(i, _this.data[i]);
                    }
                    _this.xhr = new XMLHttpRequest();
                    _this.xhr.open('POST', _this.settings.url, true);
                    _this.xhr.upload.addEventListener("progress", _this.settings.progress, false);
                    _this.xhr.addEventListener("load", _this.settings.load, false);
                    _this.xhr.addEventListener("error", _this.settings.netError, false);
                    _this.xhr.addEventListener("abort", _this.settings.abort, false);
                    _this.xhr.onreadystatechange = function () {

                        if (_this.xhr.readyState == 4) {

                            if (_this.xhr.status == 200) {
                                var path = _this.settings.getPathFromResponse.call(_this, _this.xhr.responseText);

                                if (path) {
                                    _this.setPath.call(_this, path);
                                    _this.settings.success.call(_this, { path: path });
                                }
                            } else if (_this.xhr.status == 500) {
                                _this.settings.error.call(_this, _this.xhr.responseText);
                            }
                            _this.settings.afterUpload();
                            _this.xhr = null;
                        }
                        setTimeout(function () {
                            _this.progress.hide();
                        }, 2000);
                    };
                    _this.xhr.send(formData);
                });
            }
        }, {
            key: "setPathForPreviewer",
            value: function setPathForPreviewer(path) {

                if (path) {
                    this.pathViewer.innerText = path;
                }
            }
        }, {
            key: "setPath",
            value: function setPath(path) {
                this.setPathForPreviewer(path);
                this.path = path;
                this.valueInput.value = path;

                $(this.valueInput).trigger("change");
            }
        }], [{
            key: "getByteToM",
            value: function getByteToM(val) {

                if (isNaN(val)) return val;

                val = val / (1024 * 1024);
                val = Math.round(val * 100) / 100;
                return val;
            }
        }, {
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new FileUploader(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return {
                    url: '',
                    showProgress: true,
                    progress: function progress(value) {},
                    load: function load() {},
                    beforeUpload: function beforeUpload() {},
                    afterUpload: function afterUpload() {},
                    getPathFromResponse: function getPathFromResponse(responseText) {
                        var result = JSON.parse(this.xhr.responseText);
                        var path;

                        if (result.__infrastructure) {
                            path = result.result.path;
                        } else {
                            path = result.path;
                        }
                        return path;
                    },
                    error: function error(responseText) {
                        var result = JSON.parse(this.xhr.responseText);

                        if (result.__infrastructure) {
                            $.message.error(result.error.message);
                        }
                    },
                    netError: function netError() {},
                    abort: function abort() {},
                    success: function success(path) {}
                };
            }
        }]);

        return FileUploader;
    }();

    $.fn[NAME] = FileUploader._jQueryInterface;
    $.fn[NAME].Constructor = FileUploader;
    return FileUploader;
}(_jquery2.default);
exports.default = FileUploader;

/***/ }),
/* 10 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var ScrollBar = function ($) {
    var NAME = 'scrollBar';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.scrollBar';

    var ScrollBar = function () {
        function ScrollBar(element) {
            _classCallCheck(this, ScrollBar);

            var _this = this;
            this.element = element;
            this.$element = $(element);
            this.initialize();
        }

        _createClass(ScrollBar, [{
            key: 'initialize',
            value: function initialize() {
                var _this = this;
                var startX = 0;
                var isScroll = false;

                this.$element.addClass("scrollBar");
                $(document).on("mousedown", function (event) {

                    if ($(event.target).isChildAndSelfOf(_this.$element)) {
                        startX = event.clientX;
                        isScroll = true;
                    }
                });
                $(document).on("mouseover", function (event) {

                    if (isScroll) {
                        var endX = event.clientX;
                        var scrollLeft = _this.$element.scrollLeft() - (endX - startX);
                        _this.$element.animate({ scrollLeft: scrollLeft }, 1);
                    }
                });
                $(document).on("mouseup", function (event) {
                    isScroll = false;
                });
            }
        }], [{
            key: '_jQueryInterface',
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new ScrollBar(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }]);

        return ScrollBar;
    }();

    $.fn[NAME] = ScrollBar._jQueryInterface;
    $.fn[NAME].Constructor = ScrollBar;
    return ScrollBar;
}(_jquery2.default);
exports.default = ScrollBar;

/***/ }),
/* 11 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _validateCore = __webpack_require__(4);

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var InputValidate = function ($) {
    var NAME = 'inputValidate';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.inputValidate';
    var EVENT_KEY = "." + DATA_KEY;

    var InputValidate = function () {
        function InputValidate(element, options) {
            _classCallCheck(this, InputValidate);

            this.element = element;
            this.$element = $(element);
            this.settings = $.extend({}, InputValidate.DefaultSettings, options);
            this.status = _validateCore.ValidateStatus.toValid; //0未验证，1通过验证，-1验证失败,2验证中
            this.validators = []; //验证组
            this.ajaxs = [];
            this.promise = null;
            this.initialize();
        }

        _createClass(InputValidate, [{
            key: "initialize",
            value: function initialize() {
                var _this = this;

                if (_this.$element.is("input,textarea,select")) {
                    this.$input = this.$element;
                } else if (_this.$element.is(".input-wrapper")) {
                    this.$input = this.$element.find("input,textarea,select");
                }

                for (var i in _validateCore.Validators) {
                    var Validator = _validateCore.Validators[i];

                    if (typeof this.$element.attr("data-" + Validator.name) != "undefined") {
                        var validator = new Validator(this.element.dataset[Validator.name], function () {
                            _this.$element.addClass("loading");
                        });
                        this.validators.push(validator);
                    }
                }

                if (this.validators.length == 0) {
                    this.onValid();
                }
                this.bindEvent();
            }
        }, {
            key: "bindEvent",
            value: function bindEvent() {
                var _this = this;

                if (this.$input) {
                    this.$input.on("input", function () {
                        _this.validate();
                    });
                }
            }
        }, {
            key: "validate",
            value: function validate() {
                var _this = this;
                this.resetStatus();
                this.status = _validateCore.ValidateStatus.pending;
                var promises = [];

                if (this.validators.length == 0) {
                    this.onValid();
                    return;
                }

                for (var i = 0; i < this.validators.length; i++) {
                    var validator = this.validators[i];
                    var status = validator.validate(this.$input.val());

                    if (status === false) {
                        this.onInValid(validator);
                        return false;
                    } else if (status instanceof Object) {
                        promises.push(status);
                        this.ajaxs.push(validator.ajax);
                    }
                }

                if (promises.length) {
                    var defer = $.Deferred();
                    $.when.apply($, promises).then(function () {
                        _this.onValid();
                        defer.resolve();
                    }, function () {
                        _this.onInValid();
                        defer.reject();
                    }).always(function () {
                        _this.$element.removeClass("loading");
                    });
                    this.promise = defer.promise();
                    return this.promise;
                } else {
                    this.onValid();
                    return true;
                }
            }
        }, {
            key: "resetStatus",
            value: function resetStatus() {
                this.ajaxs.map(function (ajax) {
                    ajax.abort();
                });
                this.ajaxs = [];
                this.$element.removeClass("error").removeClass("success").removeClass("loading");
                this.$helpBlock && this.$helpBlock.remove();
                this.status = _validateCore.ValidateStatus.unValidate;
            }
        }, {
            key: "onValid",
            value: function onValid() {
                this.status = _validateCore.ValidateStatus.valid;
                this.$helpBlock && this.$helpBlock.remove();
                this.$element.removeClass("error").addClass("success");

                if (this.settings.unhighlight) {
                    this.settings.unhighlight.call(this, this.$element);
                }
                this.settings.onValid();
                this.$element.trigger("valid");
            }
        }, {
            key: "onInValid",
            value: function onInValid() {
                this.status = _validateCore.ValidateStatus.inValid;
                this.$element.removeClass("success").addClass("error");

                if (this.settings.highlight) {
                    this.settings.highlight.call(this, this.$element);
                }
                this.settings.onInValid();
                this.$element.trigger("inValid");
            }
        }], [{
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $this = $(this);
                    var data = $this.data(DATA_KEY);

                    if (!data) {
                        data = new InputValidate(this, options);
                        $this.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return {
                    onValid: function onValid() {},
                    onInValid: function onInValid() {},
                    errorShowMode: 0, //0为inner，1为下面，2为message
                    errorClass: 'validate-message validate-message-validation-error',
                    highlight: function highlight(element) {},
                    unhighlight: function unhighlight(element) {}
                };
            }
        }, {
            key: "VERSION",
            get: function get() {
                return VERSION;
            }
        }]);

        return InputValidate;
    }();

    $.fn[NAME] = InputValidate._jQueryInterface;
    $.fn[NAME].Constructor = InputValidate;
    return InputValidate;
}(_jquery2.default);

exports.default = InputValidate;

/***/ }),
/* 12 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _util = __webpack_require__(1);

var _util2 = _interopRequireDefault(_util);

var _array = __webpack_require__(13);

var _array2 = _interopRequireDefault(_array);

var _datetime = __webpack_require__(14);

var _datetime2 = _interopRequireDefault(_datetime);

var _object = __webpack_require__(5);

var _object2 = _interopRequireDefault(_object);

var _string = __webpack_require__(15);

var _string2 = _interopRequireDefault(_string);

var _guid = __webpack_require__(16);

var _guid2 = _interopRequireDefault(_guid);

var _color = __webpack_require__(17);

var _color2 = _interopRequireDefault(_color);

var _datetime3 = __webpack_require__(6);

var _datetime4 = _interopRequireDefault(_datetime3);

var _jqueryExtension = __webpack_require__(7);

var _jqueryExtension2 = _interopRequireDefault(_jqueryExtension);

var _math = __webpack_require__(18);

var _math2 = _interopRequireDefault(_math);

var _object3 = __webpack_require__(19);

var _object4 = _interopRequireDefault(_object3);

var _article = __webpack_require__(20);

var _article2 = _interopRequireDefault(_article);

var _audioNotify = __webpack_require__(21);

var _audioNotify2 = _interopRequireDefault(_audioNotify);

var _blockUI = __webpack_require__(22);

var _blockUI2 = _interopRequireDefault(_blockUI);

var _busy = __webpack_require__(23);

var _busy2 = _interopRequireDefault(_busy);

var _codeHighlight = __webpack_require__(24);

var _codeHighlight2 = _interopRequireDefault(_codeHighlight);

var _collapse = __webpack_require__(25);

var _collapse2 = _interopRequireDefault(_collapse);

var _comment = __webpack_require__(26);

var _comment2 = _interopRequireDefault(_comment);

var _countdown = __webpack_require__(27);

var _countdown2 = _interopRequireDefault(_countdown);

var _datePicker = __webpack_require__(28);

var _datePicker2 = _interopRequireDefault(_datePicker);

var _dialog = __webpack_require__(2);

var _dialog2 = _interopRequireDefault(_dialog);

var _confirm = __webpack_require__(29);

var _confirm2 = _interopRequireDefault(_confirm);

var _promote = __webpack_require__(30);

var _promote2 = _interopRequireDefault(_promote);

var _documentList = __webpack_require__(31);

var _documentList2 = _interopRequireDefault(_documentList);

var _dropdown = __webpack_require__(8);

var _dropdown2 = _interopRequireDefault(_dropdown);

var _dropdownMenu = __webpack_require__(32);

var _dropdownMenu2 = _interopRequireDefault(_dropdownMenu);

var _fileUploader = __webpack_require__(9);

var _fileUploader2 = _interopRequireDefault(_fileUploader);

var _pictureUploader = __webpack_require__(34);

var _pictureUploader2 = _interopRequireDefault(_pictureUploader);

var _message = __webpack_require__(35);

var _message2 = _interopRequireDefault(_message);

var _notify = __webpack_require__(36);

var _notify2 = _interopRequireDefault(_notify);

var _popup = __webpack_require__(37);

var _popup2 = _interopRequireDefault(_popup);

var _toast = __webpack_require__(38);

var _toast2 = _interopRequireDefault(_toast);

var _tip = __webpack_require__(39);

var _tip2 = _interopRequireDefault(_tip);

var _rippler = __webpack_require__(40);

var _rippler2 = _interopRequireDefault(_rippler);

var _richTextEditor = __webpack_require__(41);

var _richTextEditor2 = _interopRequireDefault(_richTextEditor);

var _scrollTopNav = __webpack_require__(42);

var _scrollTopNav2 = _interopRequireDefault(_scrollTopNav);

var _sidenav = __webpack_require__(43);

var _sidenav2 = _interopRequireDefault(_sidenav);

var _slider = __webpack_require__(44);

var _slider2 = _interopRequireDefault(_slider);

var _tab = __webpack_require__(45);

var _tab2 = _interopRequireDefault(_tab);

var _table = __webpack_require__(46);

var _table2 = _interopRequireDefault(_table);

var _turnOffLight = __webpack_require__(48);

var _turnOffLight2 = _interopRequireDefault(_turnOffLight);

var _validate = __webpack_require__(49);

var _validate2 = _interopRequireDefault(_validate);

var _webkitNotify = __webpack_require__(51);

var _webkitNotify2 = _interopRequireDefault(_webkitNotify);

var _scrollBar = __webpack_require__(10);

var _scrollBar2 = _interopRequireDefault(_scrollBar);

var _styleToggle = __webpack_require__(52);

var _styleToggle2 = _interopRequireDefault(_styleToggle);

var _boot = __webpack_require__(53);

var _boot2 = _interopRequireDefault(_boot);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

exports.default = {
    Util: _util2.default,
    Article: _article2.default,
    AudioNotify: _audioNotify2.default,
    BlockUI: _blockUI2.default,
    Busy: _busy2.default,
    DatePicker: _datePicker2.default,
    CodeHighlight: _codeHighlight2.default,
    Collapse: _collapse2.default,
    Comment: _comment2.default,
    Countdown: _countdown2.default,
    Dialog: _dialog2.default,
    Confirm: _confirm2.default,
    Promote: _promote2.default,
    DocumentList: _documentList2.default,
    Dropdown: _dropdown2.default,
    DropdownMenu: _dropdownMenu2.default,
    FileUploader: _fileUploader2.default,
    PictureUploader: _pictureUploader2.default,
    Message: _message2.default,
    Notify: _notify2.default,
    Popup: _popup2.default,
    Toast: _toast2.default,
    Tip: _tip2.default,
    Rippler: _rippler2.default,
    RichTextEditor: _richTextEditor2.default,
    ScrollTopNav: _scrollTopNav2.default,
    SideNav: _sidenav2.default,
    Slider: _slider2.default,
    Table: _table2.default,
    Tab: _tab2.default,
    TurnOffLigth: _turnOffLight2.default,
    Validate: _validate2.default,
    WebKitNofity: _webkitNotify2.default,
    ScrollBar: _scrollBar2.default,
    StyleToggle: _styleToggle2.default
};

/***/ }),
/* 13 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };

var ArrayPrototype = function () {
    Array.prototype.clone = function () {
        var tmp = [];
        for (var i = 0; i < this.length; i++) {
            tmp[i] = this[i];
        }return tmp;
    };

    Array.prototype.max = function () {
        return Math.max.apply({}, this);
    };

    Array.prototype.min = function () {
        return Math.min.apply({}, this);
    };

    Array.prototype.reset = function () {
        for (var i = 0; i < arguments.length; i++) {
            this[i] = arguments[i];
        }return this;
    };

    Array.prototype.contains = function (value) {

        for (var i = 0; i < this.length; i++) {

            if (this[i] == value) {
                return true;
            }
        }
        return false;
    };

    Array.prototype.unique = function () {
        var n = {},
            r = [],
            len = this.length,
            val,
            type;
        for (var i = 0; i < this.length; i++) {
            val = this[i];
            type = typeof val === "undefined" ? "undefined" : _typeof(val);
            if (!n[val]) {
                n[val] = [type];
                r.push(val);
            } else if (n[val].indexOf(type) < 0) {
                n[val].push(type);
                r.push(val);
            }
        }
        return r;
    };
}();
exports.default = ArrayPrototype;

/***/ }),
/* 14 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
var DatetimePrototype = function () {
    /**
     * 时间对象的格式化;
     */
    Date.prototype.format = function (format) {
        var o = {
            'M+': this.getMonth() + 1, //月份
            'd+': this.getDate(), //日
            'H+': this.getHours(), //小时
            'm+': this.getMinutes(), //分
            's+': this.getSeconds(), //秒
            'q+': Math.floor((this.getMonth() + 3) / 3), //季度
            'S': this.getMilliseconds() //毫秒
        };

        if (/(y+)/.test(format)) format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));

        for (var k in o) {
            if (new RegExp('(' + k + ')').test(format)) format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ('00' + o[k]).substr(('' + o[k]).length));
        }return format;
    };

    //+---------------------------------------------------
    //| 把日期分割成数组
    //+---------------------------------------------------
    Date.prototype.toArray = function () {
        var myDate = this;
        var myArray = [];
        myArray[0] = myDate.getFullYear();
        myArray[1] = myDate.getMonth();
        myArray[2] = myDate.getDate();
        myArray[3] = myDate.getHours();
        myArray[4] = myDate.getMinutes();
        myArray[5] = myDate.getSeconds();
        return myArray;
    };
}();
exports.default = DatetimePrototype;

/***/ }),
/* 15 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
var StringExtension = function () {
    String.prototype.getBit = function (position) {
        return this.length < position + 1 ? 0 : parseInt(this.substr(this.length - (position + 1), 1));
    };

    //去除左边的空格
    String.prototype.lTrim = function () {
        return this.replace(/(^\s*)/g, '');
    };

    //去除右边的空格
    String.prototype.rTrim = function () {
        return this.replace(/(\s*$)/g, '');
    };

    //去除前后空格
    String.prototype.trim = function () {
        return this.replace(/(^\s*)|(\s*$)/g, '');
    };

    //得到左边的字符串
    String.prototype.left = function (len) {

        if (isNaN(len) || len == null) {
            len = this.length;
        } else {

            if (parseInt(len) < 0 || parseInt(len) > this.length) {
                len = this.length;
            }
        }
        return this.substr(0, len);
    };

    //得到右边的字符串
    String.prototype.right = function (len) {

        if (isNaN(len) || len == null) {
            len = this.length;
        } else {

            if (parseInt(len) < 0 || parseInt(len) > this.length) {
                len = this.length;
            }
        }
        return this.substring(this.length - len, this.length);
    };

    //得到中间的字符串,注意从0开始
    String.prototype.mid = function (start, len) {
        return this.substr(start, len);
    };

    //对字符串进行Html编码
    String.prototype.toHtmlEncode = function () {
        var str = this;
        str = str.replace(/&/g, "&amp;");
        str = str.replace(/</g, "&lt;");
        str = str.replace(/>/g, "&gt;");
        str = str.replace(/\'/g, "&apos;");
        str = str.replace(/\"/g, "&quot;");
        str = str.replace(/\n/g, "<br>");
        str = str.replace(/\ /g, "&nbsp;");
        str = str.replace(/\t/g, "&nbsp;&nbsp;&nbsp;&nbsp;");
        return str;
    };

    //字符串逆转
    String.prototype.reverse = function () {
        var str = this;

        if (str) {
            var str1 = '';

            for (var i = str.length - 1; i >= 0; i--) {
                str1 += str.charAt(i);
            }
            return str1;
        }
    };

    String.prototype.isBlank = function () {
        var s = this.toString();
        return s === null || '' === s || undefined === s ? true : false;
    };

    String.prototype.notBlank = function () {
        return !this.isBlank();
    };

    String.prototype.replaceAll = function (placeHolder, replaceWith, ignoreCase) {
        var fix = placeHolder.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
        return this.replace(new RegExp(fix, 'g'), replaceWith);
    };

    String.prototype.format = function () {

        if (arguments.length < 1) {
            return null;
        }
        var temp = this;

        for (var i = 1; i < arguments.length; i++) {
            var placeHolder = '{' + (i - 1) + '}';
            temp = temp.replaceAll(placeHolder, arguments[i]);
        }
        return temp;
    };

    String.prototype.toPascalCase = function () {

        if (!this || !this.length) {
            return this;
        }

        if (this.length === 1) {
            return this.charAt(0).toUpperCase();
        }
        return this.charAt(0).toUpperCase() + this.substr(1);
    };

    String.prototype.toCamelCase = function () {

        if (!this || !this.length) {
            return this;
        }

        if (this.length === 1) {
            return this.charAt(0).toLowerCase();
        }
        return this.charAt(0).toLowerCase() + this.substr(1);
    };

    String.prototype.truncateStringWithPostfix = function (maxLength, postfix) {
        postfix = postfix || '...';

        if (!this || !this.length || this.length <= maxLength) {
            return this;
        }

        if (maxLength <= postfix.length) {
            return postfix.substr(0, maxLength);
        }
        return this.substr(0, maxLength - postfix.length) + postfix;
    };

    String.prototype.truncate = function (maxLength) {

        if (!this || !this.length || this.length <= maxLength) {
            return this;
        }
        return this.substr(0, maxLength);
    };

    String.prototype.truncateWithPostfix = function (maxLength, postfix) {
        postfix = postfix || '...';

        if (!this || !this.length || this.length <= maxLength) {
            return this;
        }

        if (maxLength <= postfix.length) {
            return postfix.substr(0, maxLength);
        }
        return this.substr(0, maxLength - postfix.length) + postfix;
    };
}();
exports.default = StringExtension;

/***/ }),
/* 16 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Guid = function () {
    //表示全局唯一标识符 (GUID)。
    var Guid = function () {
        function Guid(g) {
            _classCallCheck(this, Guid);

            var arr = new Array(); //存放32位数值的数组
            this.arr = arr;

            if (typeof g == "string") {
                //如果构造函数的参数为字符串
                this.initByString(arr, g);
            } else {
                this.initByOther(arr);
            }
        }

        _createClass(Guid, [{
            key: "equals",
            value: function equals(o) {
                if (o && o.isGuid) {
                    return this.toString() == o.toString();
                } else {
                    return false;
                }
            }
        }, {
            key: "isGuid",
            value: function isGuid() {}
        }, {
            key: "toString",
            value: function toString(format) {
                if (typeof format == "string") {

                    if (format == "N" || format == "D" || format == "B" || format == "P") {
                        return this.toStringWithFormat(this.arr, format);
                    } else {
                        return this.toStringWithFormat(this.arr, "D");
                    }
                } else {
                    return this.toStringWithFormat(this.arr, "D");
                }
            }
        }, {
            key: "initByString",
            value: function initByString(arr, g) {
                g = g.replace(/\{|\(|\)|\}|-/g, "");
                g = g.toLowerCase();

                if (g.length != 32 || g.search(/[^0-9,a-f]/i) != -1) {
                    this.initByOther(arr);
                } else {
                    for (var i = 0; i < g.length; i++) {
                        arr.push(g[i]);
                    }
                }
            }
        }, {
            key: "initByOther",
            value: function initByOther(arr) {
                var i = 32;

                while (i--) {
                    arr.push("0");
                }
            }
        }, {
            key: "toStringWithFormat",
            value: function toStringWithFormat(arr, format) {

                switch (format) {
                    case "N":
                        return arr.toString().replace(/,/g, "");
                    case "D":
                        var str = arr.slice(0, 8) + "-" + arr.slice(8, 12) + "-" + arr.slice(12, 16) + "-" + arr.slice(16, 20) + "-" + arr.slice(20, 32);
                        str = str.replace(/,/g, "");
                        return str;
                    case "B":
                        var str = this.toStringWithFormat(arr, "D");
                        str = "{" + str + "}";
                        return str;
                    case "P":
                        var str = this.toStringWithFormat(arr, "D");
                        str = "(" + str + ")";
                        return str;
                    default:
                        return new Guid();
                }
            }
        }], [{
            key: "Empty",
            get: function get() {
                return new Guid();
            }
        }, {
            key: "NewGuid",
            get: function get() {
                var g = "";
                var i = 32;

                while (i--) {
                    g += Math.floor(Math.random() * 16.0).toString(16);
                }
                return new Guid(g);
            }
        }]);

        return Guid;
    }();

    window.Guid = Guid;
    return Guid;
}();
exports.default = Guid;

/***/ }),
/* 17 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
var ColorLibs = function () {
    function decimalToColorArray(decNum) {
        var colorArray = [];
        colorArray[0] = Math.floor(decNum / 65536) / 256;
        colorArray[1] = Math.floor(decNum % 65536 / 256) / 256;
        colorArray[2] = decNum % 256 / 256;
        colorArray[3] = 1;
        return colorArray;
    }
    window.decimalToColorArray = decimalToColorArray;
    return {
        decimalToColorArray: decimalToColorArray
    };
}();
exports.default = ColorLibs;

/***/ }),
/* 18 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
var MathLibs = function () {
    function cot(value) {
        return 1 / Math.tan(value);
    }

    function square(value) {
        return value * value;
    }

    function getBit(value, position) {
        return value & 1 << position;
    }

    function clamp(x, a, b) {
        return x < a ? a : x > b ? b : x;
    }
    return {
        cot: cot,
        square: square,
        getBit: getBit,
        clamp: clamp
    };
}();
exports.default = MathLibs;

/***/ }),
/* 19 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };

var ObjectExtension = function () {
    function extend(destination, source) {

        for (var property in source) {
            destination[property] = source[property];
        }
        return destination;
    }

    function deepClone(obj) {

        if (obj === null) {
            return;
        }

        if ((typeof obj === 'undefined' ? 'undefined' : _typeof(obj)) !== 'object' && typeof obj !== 'function') {
            return;
        }
        var newObject = obj.constructor === Array ? [] : {};

        for (var i in obj) {
            newObject[i] = _typeof(obj[i]) === 'object' ? deepClone(obj[i]) : obj[i];
        }
        return newObject;
    }

    function extendValue(destination, source) {

        for (var property in source) {

            if (typeof source[property] == 'function') continue;
            destination[property] = source[property];
        }
        return destination;
    }
    window.extend = extend;
    window.deepClone = deepClone;
    window.extendValue = extendValue;
}();
exports.default = ObjectExtension;

/***/ }),
/* 20 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Head = function () {
    function Head(level, title, element, $content) {
        _classCallCheck(this, Head);

        this.level = level;
        this.title = title;
        this.element = element;
        this.$content = $content;
        this.children = [];
        this.openStatus = true;
    }

    _createClass(Head, [{
        key: "toggleStatus",
        value: function toggleStatus() {
            this.openStatus = !this.openStatus;
        }
    }, {
        key: "scrollToView",
        value: function scrollToView() {
            this.element.scrollIntoView(true);
        }
    }]);

    return Head;
}();

var Article = function () {
    function Article($element) {
        _classCallCheck(this, Article);

        this.$element = $element;
        this.startLevel = 1;
    }

    _createClass(Article, [{
        key: "getOutline",
        value: function getOutline() {
            var _this = this;
            var tree = [];
            var $startHs = this.$element.find("h" + this.startLevel);

            if ($startHs.length) {
                this.$element.find("h" + this.startLevel).each(function (index, element) {
                    var head = new Head(_this.startLevel, this.innerText, element, _this.$element);
                    tree.push(head);
                    _this._getOutlineCircle(head, $(this));
                });
                return tree;
            } else if (this.startLevel < 6) {
                this.startLevel++;
                return this.getOutline();
            }
        }
    }, {
        key: "_getOutlineCircle",
        value: function _getOutlineCircle(parent, $parentHead) {
            var _this = this;
            var tagName = $parentHead.get(0).tagName;
            var parentLevel = tagName.substr(1, 1);
            var nextLevel = parentLevel;

            $parentHead.nextAll(":header").each(function (index, element) {
                var level = this.tagName.substr(1, 1);

                if (level <= parentLevel) {
                    return false;
                } else if (level > nextLevel && nextLevel > parentLevel) {
                    return true;
                } else {
                    nextLevel = level;
                    var head = new Head(level, this.innerText, element, _this.$element);
                    parent.children.push(head);
                    _this.getOutlineCircle(head, $(this));
                }
            });
        }
    }]);

    return Article;
}();

exports.default = { Head: Head, Article: Article };

/***/ }),
/* 21 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var AudioNotify = function ($) {
    var audioNotify = void 0;
    var NAME = "audioNotify";

    var AudioNotify = function () {
        function AudioNotify(options) {
            _classCallCheck(this, AudioNotify);

            this.settings = $.extend({}, AudioNotify.DefaultSettings, options);
            this.$audio = null;
            this._initialize();
        }

        _createClass(AudioNotify, [{
            key: "_initialize",
            value: function _initialize() {
                this.$audio = $("<audio>").hide().appendTo(document.body);
                this.$audio[0].src = this.settings.defaultSrc;
            }
        }, {
            key: "notify",
            value: function notify() {
                this.$audio[0].play();
            }
        }], [{
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {

                if (!audioNotify) {
                    audioNotify = new AudioNotify(options);
                }
                return audioNotify;
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return {
                    defaultSrc: "http://www.helloweba.com/demo/notifysound/notify.mp3"
                };
            }
        }]);

        return AudioNotify;
    }();

    $[NAME] = AudioNotify._jQueryInterface;
    return AudioNotify;
}(_jquery2.default);
exports.default = AudioNotify;

/***/ }),
/* 22 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var BlockUI = function ($) {
    $.blockUI = function () {
        document.body.classList.add("mask");
    };
    $.unblockUI = function () {
        document.body.classList.remove("mask");
    };
    $.fn.blockUI = function () {
        this.addClass("mask");
    };
    $.fn.unblock = function () {
        this.removeClass("mask");
    };
}(_jquery2.default);
exports.default = BlockUI;

/***/ }),
/* 23 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var BusyUI = function ($) {
    var NAME = 'busyUI';
    var DATA_KEY = 'canknow.busyUI';

    var BusyUI = function () {
        function BusyUI(element) {
            _classCallCheck(this, BusyUI);

            this.element = element;
            this.$element = $(element);
            this.$element.addClass("busy-target");
        }

        _createClass(BusyUI, [{
            key: 'busy',
            value: function busy() {
                var $busyLayer = $("<div>").addClass("busy-layer show").appendTo(this.$element);
                $("<div>").addClass("busy-loading").appendTo($busyLayer);
            }
        }, {
            key: 'clearBusy',
            value: function clearBusy() {
                this.$element.find(".busy-loading").remove();
                this.$element.find(".busy-layer").removeClass("show").remove();
            }
        }]);

        return BusyUI;
    }();

    $.fn.busy = function () {
        return this.each(function () {
            var $this = $(this);
            var $element = $(this);
            var data = $element.data(DATA_KEY);

            if (!data) {
                data = new BusyUI(this);
                $element.data(DATA_KEY, data);
            }
            data.busy();
        });
    };
    $.fn.clearBusy = function () {
        return this.each(function () {
            var $this = $(this);
            var $element = $(this);
            var data = $element.data(DATA_KEY);

            if (data) {
                data.clearBusy();
            }
        });
    };

    $.busy = function () {
        $(document.body).busy();
    };
    $.clearBusy = function () {
        $(document.body).clearBusy();
    };
    return BusyUI;
}(_jquery2.default);
exports.default = BusyUI;

/***/ }),
/* 24 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var CodeHighlight = function ($) {
    'use strict';

    var NAME = 'codeHighlight';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.codeHighlight';

    var CodeHighlight = function () {
        function CodeHighlight(element, options) {
            _classCallCheck(this, CodeHighlight);

            this.element = element;
            this.$element = $(element);
            this.settings = $.extend({}, CodeHighlight.DefaultSettings, options);
            this._initilize();
        }

        _createClass(CodeHighlight, [{
            key: '_initilize',
            value: function _initilize() {
                var code = "";
                var $pre;
                var $codeBody;

                if (this.settings.code) {
                    code = this.settings.code;
                } else {
                    code = this.$element.html();
                }
                var result = hljs.highlightAuto(code);
                var lines = result.value.split('\n');
                var language = result.language;

                if (this.element.tagName == "PRE") {
                    this.$element.empty();
                    $pre = $element;
                    $pre.wrap("<div class='code-body'>");
                    $pre.parent().wrap("<div class='code-view'>");
                    $codeBody = $pre.parent();
                    this.$element = $pre.parent().parent();
                } else {
                    this.$element.addClass("code-view");
                    $codeBody = $("<div class='code-body'>");
                    this.$element.append($codeBody);
                    $pre = $("<pre>").appendTo($codeBody);
                }
                $("<div class='code-header'><label class='language'>" + language + "</label></div>").insertBefore($codeBody);
                var $preNumbering = $("<ul class='pre-numbering'>").insertBefore($pre);
                var $codeList = $("<ul class='code-list'>").appendTo($pre);

                lines.forEach(function (value, i) {
                    $("<li>").text(i).appendTo($preNumbering);
                    $("<li>").html(value).appendTo($codeList);
                });
            }
        }], [{
            key: '_jQueryInterface',
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new CodeHighlight(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: 'DefaultSettings',
            get: function get() {
                return {
                    code: null
                };
            }
        }, {
            key: 'VERSION',
            get: function get() {
                return VERSION;
            }
        }]);

        return CodeHighlight;
    }();

    $.fn[NAME] = CodeHighlight._jQueryInterface;
    return CodeHighlight;
}(_jquery2.default);
exports.default = CodeHighlight;

/***/ }),
/* 25 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _util = __webpack_require__(1);

var _util2 = _interopRequireDefault(_util);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Collapse = function ($) {
    var NAME = 'collapse';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.collapse';
    var EVENT_KEY = "." + DATA_KEY;
    var DATA_API_KEY = '.data-api';
    var TRANSITION_DURATION = 600;

    var ClassName = {
        SHOW: 'show',
        COLLAPSE: 'collapse',
        COLLAPSING: 'collapsing',
        COLLAPSED: 'collapsed'
    };

    var Event = {
        SHOW: "show" + EVENT_KEY,
        SHOWN: "shown" + EVENT_KEY,
        HIDE: "hide" + EVENT_KEY,
        HIDDEN: "hidden" + EVENT_KEY,
        CLICK_DATA_API: "click" + EVENT_KEY + DATA_API_KEY
    };

    var Dimension = {
        WIDTH: 'width',
        HEIGHT: 'height'
    };

    var Selector = {
        ACTIVES: '.show, .collapsing'
    };

    var Collapse = function () {
        function Collapse(element, options) {
            _classCallCheck(this, Collapse);

            this._isTransitioning = false;
            this.element = element;
            this.$element = $(element);
            this.settings = $.extend({}, Collapse.DefaultSettings, options);
            this.$handlers = $("[data-target=\"#" + this.element.id + "\"],[href=\"#" + this.element.id + "\"]");

            if (this.settings.handler) {

                if (!this.$handlers.length) {
                    this.$handlers = this.settings.handler;
                } else {
                    this.$handlers.add(this.settings.handler);
                }
            }
            this._initialize();
        }

        _createClass(Collapse, [{
            key: "_initialize",
            value: function _initialize() {
                this.$element.addClass("collapse");
                this._bindEvent();
            }
        }, {
            key: "_bindEvent",
            value: function _bindEvent() {
                var _this = this;
                this.$handlers.on("click", function (event) {
                    _this.settings.onClick(event);
                    _this.toggle.call(_this, event);
                });
            }
        }, {
            key: "show",
            value: function show() {
                var _this2 = this;

                var _this = this;

                if (this._isTransitioning || this.$element.hasClass(ClassName.SHOW)) {
                    return;
                }
                var startEvent = $.Event(Event.SHOW);
                this.$element.trigger(startEvent);

                if (startEvent.isDefaultPrevented()) {
                    return;
                }
                var dimension = this._getDimension();
                this.$element.removeClass(ClassName.COLLAPSE).addClass(ClassName.COLLAPSING);
                this.element.style[dimension] = 0;

                if (this.$handlers.length) {
                    this.$handlers.removeClass(ClassName.COLLAPSED).attr('aria-expanded', true);
                }
                this.setTransitioning(true);

                var complete = function complete() {
                    _this2.$element.removeClass(ClassName.COLLAPSING).addClass(ClassName.COLLAPSE).addClass(ClassName.SHOW);
                    _this.element.style[dimension] = '';
                    _this2.setTransitioning(false);
                    _this2.$element.trigger(Event.SHOWN);
                };

                if (!_util2.default.supportsTransitionEnd()) {
                    complete();
                    return;
                }
                this.$element.one(_util2.default.TRANSITION_END, complete).emulateTransitionEnd(TRANSITION_DURATION);
            }
        }, {
            key: "hide",
            value: function hide() {
                var _this3 = this;

                var _this = this;

                if (this._isTransitioning || !this.$element.hasClass(ClassName.SHOW)) {
                    return;
                }
                var startEvent = $.Event(Event.HIDE);
                this.$element.trigger(startEvent);

                if (startEvent.isDefaultPrevented()) {
                    return;
                }
                var dimension = this._getDimension();
                this.element.style[dimension] = this.element.getBoundingClientRect()[dimension] + 'px';

                this.$element.addClass(ClassName.COLLAPSING).removeClass(ClassName.COLLAPSE).removeClass(ClassName.SHOW);

                if (this.$handlers.length) {

                    for (var i = 0; i < this.$handlers.length; i++) {
                        var handler = this.$handlers[i];
                        var selector = _util2.default.getSelectorFromElement(handler);

                        if (selector !== null) {
                            var $selector = $(selector);

                            if (!$selector.hasClass(ClassName.SHOW)) {
                                $(handler).addClass(ClassName.COLLAPSED).attr('aria-expanded', false);
                            }
                        }
                    }
                }
                this.setTransitioning(true);
                var complete = function complete() {
                    _this3.setTransitioning(false);
                    _this3.$element.removeClass(ClassName.COLLAPSING).addClass(ClassName.COLLAPSE).trigger(Event.HIDDEN);
                };
                this.element.style[dimension] = '';

                if (!_util2.default.supportsTransitionEnd()) {
                    complete();
                    return;
                }
                this.$element.one(_util2.default.TRANSITION_END, complete).emulateTransitionEnd(TRANSITION_DURATION);
            }
        }, {
            key: "setTransitioning",
            value: function setTransitioning(isTransitioning) {
                this._isTransitioning = isTransitioning;
            }
        }, {
            key: "toggle",
            value: function toggle() {

                if (this.$element.hasClass(ClassName.SHOW)) {
                    this.hide();
                } else {
                    this.show();
                }
            }
        }, {
            key: "_getDimension",
            value: function _getDimension() {
                var hasWidth = this.$element.hasClass(Dimension.WIDTH);
                return hasWidth ? Dimension.WIDTH : Dimension.HEIGHT;
            }
        }, {
            key: "dispose",
            value: function dispose() {
                $.removeData(this.element, DATA_KEY);
                this.element = null;
            }
        }], [{
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $this = $(this);
                    var data = $this.data(DATA_KEY);

                    if (!data) {
                        data = new Collapse(this, options);
                        $this.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return {
                    $positionTarget: null,
                    handler: null,
                    onClick: function onClick() {},
                    onShow: function onShow() {},
                    onHide: function onHide() {}
                };
            }
        }, {
            key: "VERSION",
            get: function get() {
                return VERSION;
            }
        }]);

        return Collapse;
    }();

    $.fn[NAME] = Collapse._jQueryInterface;
    $.fn[NAME].Constructor = Collapse;
}(_jquery2.default);
exports.default = Collapse;

/***/ }),
/* 26 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Comment = function ($) {
    var NAME = 'comment';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.comment';
    var EVENT_KEY = '.' + DATA_KEY;

    var PostStatus = {
        UnPost: 0,
        Posting: 1,
        Posted: 2,
        Failed: 3
    };

    var CommentItem = function () {
        function CommentItem(data, comment, parentCommentItem) {
            _classCallCheck(this, CommentItem);

            this.data = data;
            this.comment = comment;
            this.parentCommentItem = parentCommentItem;
            this._initialize();
        }

        _createClass(CommentItem, [{
            key: '_initialize',
            value: function _initialize() {
                this.createDom(this.data);
            }
        }, {
            key: 'createDom',
            value: function createDom(data) {
                var _this = this;
                this.$li = $("<li>").addClass("comment-header");
                var $commentBox = $("<div>").addClass("comment-box").appendTo(this.$li);
                var $commentLeft = $("<div>").addClass("comment-left").appendTo($commentBox);
                var $commentRight = $("<div>").addClass("comment-right").appendTo($commentBox);

                var $commentItemHeader = $("<div>").addClass("comment-item-header").appendTo($commentRight);
                var $authUserInfo = $("<div>").addClass("auth-user-info").appendTo($commentItemHeader);
                var $img = $("<img>").attr("src", data.user.avatar || this.comment.settings.defaultAvatar);

                if (this.parentCommentItem) {
                    $img.appendTo($authUserInfo);
                } else {
                    $img.appendTo($commentLeft);
                }

                var $username = $("<label>").addClass("username").text(data.user.userName).appendTo($authUserInfo);

                var $commentInfo = $("<div>").addClass("comment-info").appendTo($commentItemHeader);
                var $commentDatetime = $("<div>").addClass("comment-datetime").text(data.creationDatetime).appendTo($commentInfo);

                var $commentBody = $("<div>").addClass("comment-body").appendTo($commentRight);
                var $commentContent = $("<p>").html(data.content).appendTo($commentBody);

                this.$replyList = $("<ul>").addClass("reply-list").appendTo(this.$li);

                var $commentFooter = $("<div>").addClass("comment-footer").appendTo(this.$li);
                var $toolbar = $("<div>").addClass("toolbar").appendTo($commentFooter);
                var $replyButton = $("<button>").addClass("button-icon icon-comment-alt small").appendTo($toolbar).on("click", function () {
                    _this.post.toggle();
                });

                this.post = new Post(this, this.comment);
                this.post.$postBox.appendTo(this.$li);
            }
        }, {
            key: 'addItem',
            value: function addItem(data) {
                var commentItem = new CommentItem(data, this.comment, this);
                this.$replyList.append(commentItem.$li);
            }
        }]);

        return CommentItem;
    }();

    var Post = function () {
        function Post(commentItem, comment) {
            _classCallCheck(this, Post);

            this.commentItem = commentItem;
            this.comment = comment;
            this.status = PostStatus.UnPost;
            this._initialize();
        }

        _createClass(Post, [{
            key: '_initialize',
            value: function _initialize() {
                this.createDom();
            }
        }, {
            key: 'post',
            value: function post() {
                var _this = this;

                if (!this.comment.isLogin) {
                    this.comment.requestLogin();
                    return false;
                }

                var content = this.$postInput.val();

                if (!content) {
                    this.$postInput.focus();
                    return false;
                }
                this.setPostingStatus();
                this.comment.settings.poster.call(this, {
                    content: content,
                    parentId: this.commentItem ? this.commentItem.data.id : null
                }).done(function (result) {

                    if (_this.commentItem) {
                        _this.commentItem.addItem(result);
                        _this.hide();
                    } else {
                        _this.comment.createCommentItem(result);
                    }
                });
            }
        }, {
            key: 'setPostingStatus',
            value: function setPostingStatus() {
                this.status = PostStatus.Posting;
                this.$postButton.addClass("loading");
            }
        }, {
            key: 'setPostedStatus',
            value: function setPostedStatus() {
                this.status = PostStatus.Posted;
                this.$postButton.removeClass("loading");
            }
        }, {
            key: 'createDom',
            value: function createDom() {
                var _this = this;
                this.$postBox = $("<div>").addClass("post-box").hide();
                var $postInputWrapper = $("<div>").addClass("post-input-wrapper").appendTo(this.$postBox);
                this.$postInput = $("<textarea>").addClass("post-input").appendTo($postInputWrapper);
                var $postFooter = $("<div>").addClass("post-footer").appendTo(this.$postBox);

                this.$postButton = $("<button>").addClass("post-button").appendTo($postFooter).on("click", function () {
                    _this.post();
                });
                return this.$postBox;
            }
        }, {
            key: 'show',
            value: function show() {
                this.$postBox.show();
                return this;
            }
        }, {
            key: 'hide',
            value: function hide() {
                this.$postBox.hide();
                return this;
            }
        }, {
            key: 'toggle',
            value: function toggle() {
                this.$postBox.toggle();
                return this;
            }
        }]);

        return Post;
    }();

    var Comment = function () {
        function Comment(element, options) {
            _classCallCheck(this, Comment);

            this.settings = $.extend({}, Comment.DefaultSettings, options);
            this.element = element;
            this.$element = $(element);

            this.isLogin = false;
            this.user = null;
            this.pageIndex = 0;
            this.pageCount = 0;

            this._initialize();
        }

        _createClass(Comment, [{
            key: '_initialize',
            value: function _initialize() {
                this.createHeader();
                this._createCommentListBlock();
                this.loadComments();
            }
        }, {
            key: 'setLogin',
            value: function setLogin(user) {
                this.isLogin = true;
                this.user = user;

                this.$avatar = $("<img>").addClass("avatar").appendTo(this.$userInfo);

                if (this.user.avatar) {
                    this.$avatar.attr("src", this.user.avatar);
                } else {
                    this.$avatar.attr("src", this.settings.defaultAvatar);
                }
            }
        }, {
            key: 'setUnlogin',
            value: function setUnlogin() {
                this.isLogin = false;
                this.user = null;
                this.$login = $("<div>").addClass("login").text("Login").appendTo(this.$userInfo);
            }
        }, {
            key: 'requestLogin',
            value: function requestLogin() {}
        }, {
            key: 'loadComments',
            value: function loadComments(commentItem) {
                var _this = this;

                if (!this.settings.loader) {
                    return false;
                }
                var requestParameters = {
                    pageIndex: this.pageIndex,
                    pageSize: this.settings.pageSize
                };
                this.settings.loader.call(this, requestParameters).done(function (result) {
                    _this.pageIndex = result.pageIndex;
                    _this.pageCount = result.pageCount;

                    result.items.forEach(function (item) {

                        if (commentItem) {
                            commentItem.addItem(item);
                        } else {
                            _this.createCommentItem(item);
                        }
                    });
                });
            }
        }, {
            key: 'createHeader',
            value: function createHeader() {
                var $header = $("<div>").addClass("comment-header").appendTo(this.$element);
                this.$userInfo = $("<div>").addClass("user-info").appendTo($header);
                var post = new Post(null, this);
                post.show().$postBox.appendTo($header);
            }
        }, {
            key: '_createCommentListBlock',
            value: function _createCommentListBlock() {
                this.$commentListBlock = $("<div>").addClass("comment-list-block").appendTo(this.$element);
                this.$commentList = $("<ul>").addClass("comment-list").appendTo(this.$commentListBlock);
            }
        }, {
            key: 'createPost',
            value: function createPost() {}
        }, {
            key: 'createCommentItem',
            value: function createCommentItem(data) {
                var commentItem = new CommentItem(data, this, null);
                commentItem.$li.appendTo(this.$commentList);
            }
        }], [{
            key: '_jQueryInterface',
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new Comment(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: 'DefaultSettings',
            get: function get() {
                return {
                    pageSize: 10,
                    defaultAvatar: "../../image/avatar.png",
                    loader: null,
                    poster: null
                };
            }
        }]);

        return Comment;
    }();

    $.fn[NAME] = Comment._jQueryInterface;
    $.fn[NAME].Constructor = Comment;
    return Comment;
}(_jquery2.default);
exports.default = Comment;

/***/ }),
/* 27 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Countdown = function ($) {
    var NAME = 'countdown';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.countdown';

    var Countdown = function () {
        function Countdown(element, options) {
            _classCallCheck(this, Countdown);

            this.duringtime = 0;
            this.$element = $(element);
            this.settings = $.extend({}, Countdown.defaultSettings, options);
            this.settings.endtime = this.settings.endtime || element.dataset.optionEndtime;
            this.elements = {
                hm: this.$element.find(".hm"),
                second: this.$element.find(".second"),
                minite: this.$element.find(".minite"),
                hour: this.$element.find(".hour"),
                day: this.$element.find(".day"),
                month: this.$element.find(".month"),
                year: this.$element.find(".year")
            };
            this._tick();
        }

        _createClass(Countdown, [{
            key: 'getDuring',
            value: function getDuring() {
                var now = new Date(),
                    endDate = new Date(this.settings.endtime);
                //现在将来秒差值
                //alert(future.getTimezoneOffset());
                var during = (endDate - now.getTime()) / 1000;
                this.duringtime = endDate - now.getTime();
                var during_formate = {
                    hm: "000",
                    second: "00",
                    minite: "00",
                    hour: "00",
                    day: "00",
                    month: "00",
                    year: "0"
                };
                if (this.duringtime > 0) {
                    during_formate.hm = Countdown.microsecond(this.duringtime % 1000);
                    during_formate.second = Countdown.zero(during % 60);
                    during_formate.minite = Math.floor(during / 60) > 0 ? Countdown.zero(Math.floor(during / 60) % 60) : "00";
                    during_formate.hour = Math.floor(during / 3600) > 0 ? Countdown.zero(Math.floor(during / 3600) % 24) : "00";
                    during_formate.day = Math.floor(during / 86400) > 0 ? Countdown.zero(Math.floor(during / 86400) % 30) : "00";
                    //月份，以实际平均每月秒数计算
                    during_formate.month = Math.floor(during / 2629744) > 0 ? Countdown.zero(Math.floor(during / 2629744) % 12) : "00";
                    //年份，按按回归年365天5时48分46秒算
                    during_formate.year = Math.floor(during / 31556926) > 0 ? Math.floor(during / 31556926) : "0";
                } else {
                    during_formate.year = during_formate.month = during_formate.day = during_formate.hour = during_formate.minite = during_formate.second = "00";
                    during_formate.hm = "000";
                }

                if (this.duringtime == 0) {
                    this.settings.end();
                }
                return during_formate;
            }
        }, {
            key: '_tick',
            value: function _tick() {
                var _this = this;
                var during = this.getDuring();
                var draw = this.settings.draw || this.draw;
                draw.call(this, during);
                setTimeout(function () {
                    _this._tick();
                }, 1);
            }
        }, {
            key: 'draw',
            value: function draw(during) {

                if (this.elements.hm) {
                    this.elements.hm.text(during.hm);
                }
                if (this.elements.second) {
                    this.elements.second.text(during.second);
                }
                if (this.elements.minite) {
                    this.elements.minite.text(during.minite);
                }
                if (this.elements.hour) {
                    this.elements.hour.text(during.hour);
                }
                if (this.elements.day) {
                    this.elements.day.text(during.day);
                }
                if (this.elements.month) {
                    this.elements.month.text(during.month);
                }
                if (this.elements.year) {
                    this.elements.year.text(during.year);
                }
            }
        }], [{
            key: 'microsecond',
            value: function microsecond(n) {
                if (n < 10) return "00" + n.toString();

                if (n < 100) return "0" + n.toString();
                return n.toString();
            }
        }, {
            key: 'zero',
            value: function zero(n) {
                var _n = parseInt(n, 10); //解析字符串,返回整数

                if (_n > 0) {

                    if (_n <= 9) {
                        _n = "0" + _n;
                    }
                    return String(_n);
                } else {
                    return "00";
                }
            }
        }, {
            key: '_jQueryInterface',
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new Countdown(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: 'DefaultSettings',
            get: function get() {
                return {
                    end: function end() {}
                };
            }
        }]);

        return Countdown;
    }();

    $.fn[NAME] = Countdown._jQueryInterface;
    $.fn[NAME].Constructor = Countdown;
    return Countdown;
}(_jquery2.default);
exports.default = Countdown;

/***/ }),
/* 28 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _datetime = __webpack_require__(6);

var _datetime2 = _interopRequireDefault(_datetime);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var DatePicker = function ($) {
    var NAME = 'datePicker';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.datePicker';

    var Precision = {
        Year: 0,
        Month: 1,
        Day: 2,
        Hour: 3,
        Minute: 4
    };
    var ViewType = {
        Years: 0,
        Year: 1,
        Month: 2,
        Day: 3,
        Hour: 4
    };

    var DatePicker = function () {
        function DatePicker(element, options) {
            _classCallCheck(this, DatePicker);

            this.settings = $.extend({}, DatePicker.DefaultSettings, options);
            this.currentView = ViewType.Month;
            this.currentDate;
            this.currentYearsIndex;

            if (element) {

                if (element instanceof _jquery2.default) {
                    this.$element = element;
                } else {
                    this.$element = $(element);
                }
            }
            this.initialize();
        }

        _createClass(DatePicker, [{
            key: "initialize",
            value: function initialize() {
                var _this = this;
                this.currentDate = this.settings.defaultDate;
                this.initializeYearsArray();
                this.$box = this.createElement();
                this.renderMonthView();

                if (this.$element.is('input')) {
                    this.$input = this.$element;
                    this.dropdown = this.$box.hide().appendTo(document.body).dropdown({
                        $positionTarget: this.$element,
                        onShow: function onShow() {
                            _this.renderMonthView();
                        },
                        onHide: function onHide() {}
                    }).data("canknow.dropdown");
                    this.$element.on('click', function (event) {
                        _this.dropdown.show();
                        event.stopPropagation();
                    });
                }
                //TODO:
                else if (this.$element.is('div')) {}
            }
        }, {
            key: "initializeYearsArray",
            value: function initializeYearsArray() {
                this.yearsArray = [];
                var currentYear = this.currentDate.getFullYear();
                var startYear = currentYear - 100;
                var endYear = currentYear + 100;
                this.currentYearsIndex = 5;

                for (var i = startYear; i <= endYear; i = i + 20) {
                    var yearsArray = [];

                    for (var j = i; j < i + 20; j++) {
                        yearsArray.push(j);
                    }
                    this.yearsArray.push(yearsArray);
                }
            }
        }, {
            key: "createElement",
            value: function createElement() {
                this.$box = $("<div>").addClass("date-picker");
                this.createHeader().appendTo(this.$box);
                this.$viewBox = $("<div>").addClass("view-box").appendTo(this.$box);
                return this.$box;
            }
        }, {
            key: "createHeader",
            value: function createHeader() {
                var _this = this;
                var $header = $("<div>").addClass("header");
                this.$buttonPre = $("<button>").addClass("button-icon pre").addClass(this.settings.preClass).appendTo($header).click(function () {
                    _this.pre();
                });
                this.$switch = $("<button>").addClass("button-text no-border switch").appendTo($header);
                this.$buttonNext = $("<button>").addClass("button-icon next").addClass(this.settings.nextClass).appendTo($header).click(function () {
                    _this.next();
                });
                return $header;
            }
        }, {
            key: "pre",
            value: function pre() {
                if (this.currentView == ViewType.Month) {
                    this.currentDate.setMonth(this.currentDate.getMonth() - 1);
                    this.renderMonthView();
                } else if (this.currentView == ViewType.Years) {

                    if (this.currentYearsIndex > 0) {
                        this.currentYearsIndex--;
                        this.renderYearsView();
                    }
                }
            }
        }, {
            key: "next",
            value: function next() {
                if (this.currentView == ViewType.Month) {
                    this.currentDate.setMonth(this.currentDate.getMonth() + 1);
                    this.renderMonthView();
                } else if (this.currentView == ViewType.Years) {

                    if (this.currentYearsIndex < this.yearsArray.length - 1) {
                        this.currentYearsIndex++;
                        this.renderYearsView();
                    }
                }
            }
        }, {
            key: "onPicker",
            value: function onPicker() {
                var dateString = this.currentDate.format(this.settings.format);
                this.settings.onPicker.call(this, dateString);

                if (this.$input) {
                    this.$input.val(dateString).trigger("change");

                    if (this.settings.autoClose) {
                        this.dropdown.hide();
                    }
                }
            }
        }, {
            key: "setHeaderOfYearsView",
            value: function setHeaderOfYearsView() {
                var yeasArray = this.yearsArray[index];
                this.$switch.text(yeasArray[0] + "-" + yeasArray[yeasArray.length - 1]).unbind();
            }
        }, {
            key: "setHeaderOfYearView",
            value: function setHeaderOfYearView(year) {
                var _this = this;
                var date = new Date();
                date.setYear(year);
                this.$switch.text(date.format("yyyy")).unbind().click(function (argument) {
                    _this.renderYearsView();
                });
            }
        }, {
            key: "setHeaderOfMonthView",
            value: function setHeaderOfMonthView(year, month) {
                var _this = this;
                var date = new Date(year, month);
                this.$switch.text(date.format("yyyy-MM")).unbind().click(function (argument) {
                    _this.renderYearView();
                });
            }
        }, {
            key: "setHeaderOfDayView",
            value: function setHeaderOfDayView(year, month, day) {
                var _this = this;
                var date = new Date(year, month, day);
                this.$switch.text(date.format("yyyy-MM-dd")).unbind().click(function (argument) {
                    _this.renderMonthView();
                });
            }
        }, {
            key: "setHeaderOfHourView",
            value: function setHeaderOfHourView(year, month, day, hour) {
                var _this = this;
                var date = new Date(year, month, day, hour);
                this.$switch.text(date.format("yyyy-MM-dd HH")).unbind().click(function (argument) {
                    _this.renderDayView();
                });
            }
        }, {
            key: "renderYearsView",
            value: function renderYearsView() {
                this.currentView = ViewType.Years;
                this.$viewBox.empty();
                this.$yearsView = $("<div>").appendTo(this.$viewBox);
                this.setHeaderOfYearsView(this.currentYearsIndex);
                this.$yearsView.addClass("years-view").append(this.renderYears(this.currentYearsIndex));
                return this.$yearsView;
            }
        }, {
            key: "renderYears",
            value: function renderYears(yearsArrayIndex) {
                var yearsArray = this.yearsArray[yearsArrayIndex];
                var $ul = $("<ul>").addClass("clearfix year-list");

                for (var i = 0; i < yearsArray.length; i++) {
                    this.createYearItem(yearsArray[i]).appendTo($ul);
                }
                return $ul;
            }
        }, {
            key: "createYearItem",
            value: function createYearItem(year) {
                var _this = this;
                var currentDate = new Date();
                var date = new Date();
                date.setYear(year);
                var $li = $("<li>").addClass("year-item");

                if (currentDate.getFullYear() == year) {
                    $li.addClass("current");
                }
                $li.text(year).on("click", function () {
                    _this.currentDate.setYear(year);

                    if (_this.settings.precision == Precision.Year) {
                        _this.onPicker.call(_this, date);
                    } else {
                        _this.currentDate.setYear(year);
                        _this.renderYearView();
                    }
                });
                return $li;
            }
        }, {
            key: "renderYearView",
            value: function renderYearView() {
                this.currentView = ViewType.Year;
                var year = this.currentDate.getFullYear();
                this.$viewBox.empty();
                this.$yearView = $("<div>").appendTo(this.$viewBox);
                this.setHeaderOfYearView(year);
                this.$yearView.addClass("year-view").append(this.renderMonths(year));
                return this.$dayView;
            }
        }, {
            key: "renderMonths",
            value: function renderMonths(year) {
                var $ul = $("<ul>").addClass("clearfix month-list");

                for (var i = 0; i < 12; i++) {
                    this.createMonthItem(year, i).appendTo($ul);
                }
                return $ul;
            }
        }, {
            key: "createMonthItem",
            value: function createMonthItem(year, month) {
                var _this = this;
                var currentDate = new Date();
                var date = new Date();
                date.setYear(year);
                date.setMonth(month);
                var $li = $("<li>").addClass("month-item");

                if (currentDate.getFullYear() == year && currentDate.getMonth() == month) {
                    $li.addClass("current");
                }
                $li.text(date.getMonth() + 1).on("click", function () {
                    _this.currentDate.setYear(year);
                    _this.currentDate.setMonth(month);

                    if (_this.settings.precision == Precision.Month) {
                        _this.onPicker.call(_this, date);
                    } else {
                        _this.currentDate.setMonth(month);
                        _this.renderMonthView();
                    }
                });
                return $li;
            }
        }, {
            key: "renderMonthView",
            value: function renderMonthView() {
                this.currentView = ViewType.Month;
                var year = this.currentDate.getFullYear(),
                    month = this.currentDate.getMonth();
                this.$viewBox.empty();
                this.$weeks = this.renderWeeks().appendTo(this.$viewBox);
                this.$monthView = $("<div>").appendTo(this.$viewBox);
                this.setHeaderOfMonthView(year, month);
                this.$monthView.addClass("month-view").append(this.renderDays(year, month));
                return this.$monthView;
            }
        }, {
            key: "renderWeeks",
            value: function renderWeeks(argument) {
                var $ul = $("<ul>").addClass("week-list clearfix");
                var weeks = ["Sunda", "Mon", "Tues", "Wed", "Thur", "Fri", "Sat"];

                weeks.forEach(function (week) {
                    var $li = $("<li>").text(week).addClass("week-item").appendTo($ul);
                });
                return $ul;
            }
        }, {
            key: "renderDays",
            value: function renderDays(year, month) {
                var $ul = $("<ul>").addClass("clearfix days-list");
                var firtDayInWeek = DatePicker.getFirstDayInWeekOfMonth(year, month);
                var daysCount = DatePicker.getDaysCountOfMonth(year, month);
                var index = 0;
                var day = index - firtDayInWeek + 1;

                if (firtDayInWeek > 0) {

                    for (; index < firtDayInWeek; index++, day++) {
                        $ul.append(this.createDayItem(year, month, day, false));
                    }
                }

                for (; index < daysCount; index++, day++) {
                    $ul.append(this.createDayItem(year, month, day, true));
                }
                var balanceCount = (index + 1) % 7;

                if (balanceCount > 0) {

                    for (var blance = 7 - balanceCount; blance >= 0; index++, blance--, day++) {
                        $ul.append(this.createDayItem(year, month, day, false));
                    }
                }
                return $ul;
            }
        }, {
            key: "createDayItem",
            value: function createDayItem(year, month, day, isCurrentMonth) {
                var _this = this;
                var currentDate = new Date();
                var date = new Date();
                date.setYear(year);
                date.setMonth(month);
                date.setDate(day);
                var $li = $("<li>").addClass("day-item");

                if (currentDate.getFullYear() == year && currentDate.getMonth() == month && currentDate.getDate() == day) {
                    $li.addClass("current");
                }
                $li.text(date.getDate()).on("click", function () {
                    _this.currentDate.setYear(year);
                    _this.currentDate.setMonth(month);
                    _this.currentDate.setDate(day);

                    if (_this.settings.precision == Precision.Day) {
                        _this.onPicker.call(_this, date);
                    } else {
                        _this.renderDayView.call(_this);
                    }
                });

                isCurrentMonth && $li.addClass("day-of-current-month");
                return $li;
            }
        }, {
            key: "renderDayView",
            value: function renderDayView() {
                this.currentView = ViewType.Day;
                var year = this.currentDate.getFullYear(),
                    month = this.currentDate.getMonth(),
                    day = this.currentDate.getDate();

                this.$viewBox.empty();
                this.$dayView = $("<div>").appendTo(this.$viewBox);
                this.setHeaderOfDayView(year, month, day);
                this.$dayView.addClass("day-view").append(this.renderHours(year, month, day));
                return this.$dayView;
            }
        }, {
            key: "renderHours",
            value: function renderHours(year, month, day) {
                var $ul = $("<ul>").addClass("clearfix hours-list");

                for (var i = 0; i < 24; i++) {
                    this.createHourItem(year, month, day, i).appendTo($ul);
                }
                return $ul;
            }
        }, {
            key: "createHourItem",
            value: function createHourItem(year, month, day, hour) {
                var _this = this;
                var currentDate = new Date();
                var date = new Date();
                date.setYear(year);
                date.setMonth(month);
                date.setDate(day);
                date.setHours(hour);
                var $li = $("<li>").addClass("hour-item");

                if (currentDate.getFullYear() == year && currentDate.getMonth() == month && currentDate.getDate() == day && currentDate.getHours() == hour) {
                    $li.addClass("current");
                }
                $li.text(date.getHours()).on("click", function () {
                    _this.currentDate.setYear(year);
                    _this.currentDate.setMonth(month);
                    _this.currentDate.setDate(day);
                    _this.currentDate.setHours(hour);

                    if (_this.settings.precision == Precision.Hour) {
                        _this.onPicker.call(_this, date);
                    } else {
                        _this.renderHourView.call(_this);
                    }
                });
                return $li;
            }
        }, {
            key: "renderHourView",
            value: function renderHourView() {
                this.currentView = ViewType.Hour;
                var year = this.currentDate.getFullYear(),
                    month = this.currentDate.getMonth(),
                    day = this.currentDate.getDate();
                var hour = this.currentDate.getHours();
                this.$viewBox.empty();
                this.$hourView = $("<div>").appendTo(this.$viewBox);
                this.setHeaderOfHourView(year, month, day, hour);
                this.$hourView.addClass("hour-view").append(this.renderMinutes(year, month, day, hour));
                return this.$dayView;
            }
        }, {
            key: "renderMinutes",
            value: function renderMinutes(year, month, day, hour) {
                var $ul = $("<ul>").addClass("clearfix minute-list");

                for (var i = 0; i < 60; i++) {
                    this.createMinuteItem(year, month, day, hour, i).appendTo($ul);
                }
                return $ul;
            }
        }, {
            key: "createMinuteItem",
            value: function createMinuteItem(year, month, day, hour, minute) {
                var _this = this;
                var currentDate = new Date();
                var date = new Date();
                date.setYear(year);
                date.setMonth(month);
                date.setDate(day);
                date.setHours(hour);
                date.setMinutes(minute);
                var $li = $("<li>").addClass("minute-item");

                if (currentDate.getFullYear() == year && currentDate.getMonth() == month && currentDate.getDate() == day && currentDate.getHours() == hour && currentDate.getMinutes() == minute) {
                    $li.addClass("current");
                }
                $li.text(date.getMinutes()).on("click", function () {
                    _this.currentDate.setYear(year);
                    _this.currentDate.setMonth(month);
                    _this.currentDate.setDate(day);
                    _this.currentDate.setHours(hour);
                    _this.currentDate.setMinutes(minute);

                    _this.onPicker.call(_this, date);
                });
                return $li;
            }
        }, {
            key: "dispose",
            value: function dispose() {}
        }], [{
            key: "getDaysCountOfMonth",
            value: function getDaysCountOfMonth(year, month) {
                month = parseInt(month, 10);
                var date = new Date(year, month, 0);
                return date.getDate();
            }
        }, {
            key: "getFirstDayInWeekOfMonth",
            value: function getFirstDayInWeekOfMonth(year, month) {
                var date = new Date(year, month, 1);
                return date.getDay();
            }
        }, {
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new DatePicker(this);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return {
                    format: 'yyyy-MM-dd HH:mm:ss.S',
                    preClass: ' icon-chevron-left',
                    nextClass: 'icon-chevron-right',
                    autoClose: true,
                    precision: Precision.Minute,
                    defaultDate: new Date(),
                    onPicker: function onPicker(date) {
                        console.log(date);
                    }
                };
            }
        }]);

        return DatePicker;
    }();

    $.fn[NAME] = DatePicker._jQueryInterface;
    $.fn[NAME].Constructor = DatePicker;
    return DatePicker;
}(_jquery2.default);
exports.default = DatePicker;

/***/ }),
/* 29 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _dialog = __webpack_require__(2);

var _dialog2 = _interopRequireDefault(_dialog);

var _localization = __webpack_require__(3);

var _localization2 = _interopRequireDefault(_localization);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var Confirm = function ($) {
    var Confirm = function (_Dialog) {
        _inherits(Confirm, _Dialog);

        function Confirm(text, callback) {
            _classCallCheck(this, Confirm);

            var options = {
                title: _localization2.default.localize("Confirm"),
                responsive: true,
                content: "",
                closeButtonText: _localization2.default.localize("Close"),
                okButtonText: _localization2.default.localize("Ok"),
                initialize: false
            };

            var _this = _possibleConstructorReturn(this, (Confirm.__proto__ || Object.getPrototypeOf(Confirm)).call(this, null, options));

            _this.settings.okHandle = function () {
                callback && callback();
                _this.hide();
            };
            _this.initialize();

            var $content = $("<div class=''>").append($("<h3>").text(text));
            _this.setContent($content);
            _this.show();
            return _this;
        }

        return Confirm;
    }(_dialog2.default);

    $.confirm = function (text, callback) {
        return new Confirm(text, callback);
    };
    return Confirm;
}(_jquery2.default);
exports.default = Confirm;

/***/ }),
/* 30 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _dialog = __webpack_require__(2);

var _dialog2 = _interopRequireDefault(_dialog);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var Promte = function ($) {
    var Promte = function (_Dialog) {
        _inherits(Promte, _Dialog);

        function Promte(text, defaultText, callback) {
            _classCallCheck(this, Promte);

            var options = {
                title: "Promte",
                responsive: true,
                content: "",
                closeButtonText: "Close",
                okButtonText: "Ok",
                initialize: false
            };

            var _this = _possibleConstructorReturn(this, (Promte.__proto__ || Object.getPrototypeOf(Promte)).call(this, null, options));

            _this.settings.okHandle = function () {

                if (callback) {
                    callback($input.val());
                }
                _this.hide();
            };
            _this.initialize();

            var $content = $("<div class=''>").append($("<h3>").text(text));
            var $input = $("<input type='text' value='" + defaultText + "'>").appendTo($content).wrap($("<div class='input-wrapper'>"));
            _this.setContent($content);

            _this.show();
            return _this;
        }

        return Promte;
    }(_dialog2.default);

    $.promte = function (text, defaultText, callback) {
        return new Promte(text, defaultText, callback);
    };
    return Promte;
}(_jquery2.default);
exports.default = Promte;

/***/ }),
/* 31 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var DocumentList = function ($) {
    var defaultSettings = {};
    $.fn.documentList = function (options) {
        var settings = $.extend({}, defaultSettings, options);
        this.each(function (index, element) {
            var $documentList = $(element);
            $documentList.find(".title").click(function () {
                $(this).filter("a").closest(".document-list").find("a.title").parent("li").removeClass("actived");
                $(this).parent("li").toggleClass("actived").children("ul").slideToggle();
            });
        });
    };
}(_jquery2.default);
exports.default = DocumentList;

/***/ }),
/* 32 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _dropdown = __webpack_require__(8);

var _dropdown2 = _interopRequireDefault(_dropdown);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var DropdownMenu = function ($) {
    var NAME = 'dropdownMenu';
    var DATA_KEY = 'canknow.dropdownMenu';
    var EVENT_KEY = '.' + DATA_KEY;
    var DATA_API_KEY = '.data-api';

    var DropdownMenu = function (_Dropdown) {
        _inherits(DropdownMenu, _Dropdown);

        function DropdownMenu(element, options) {
            _classCallCheck(this, DropdownMenu);

            var localOptions = $.extend({}, DropdownMenu.DefaultSettings, options);
            var $dropdownMenuElement = $(element);

            var _this2 = _possibleConstructorReturn(this, (DropdownMenu.__proto__ || Object.getPrototypeOf(DropdownMenu)).call(this, $(element).find(".dropdown")[0], localOptions));

            var _this = _this2;
            _this2.$dropdownMenuElement = $dropdownMenuElement;
            _this2.$dropdownMenuElement.find("li").click(function () {
                _this.hide();
            });
            return _this2;
        }

        _createClass(DropdownMenu, null, [{
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new DropdownMenu(this);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return {
                    $positionTarget: null,
                    onClick: function onClick() {},
                    onShow: function onShow() {},
                    onHide: function onHide() {}
                };
            }
        }]);

        return DropdownMenu;
    }(_dropdown2.default);

    $.fn[NAME] = DropdownMenu._jQueryInterface;
    $.fn[NAME].Constructor = DropdownMenu;
    return DropdownMenu;
}(jQuery);
exports.default = DropdownMenu;

/***/ }),
/* 33 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Progress = function ($) {
    var NAME = 'progress';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.progress';

    var Progress = function () {
        function Progress(element, options) {
            _classCallCheck(this, Progress);

            this.element = element;
            this.$element = $(element);
            this.settings = $.extend({}, Progress.DefaultSettings, options);
            this.initialize();
        }

        _createClass(Progress, [{
            key: 'initialize',
            value: function initialize() {
                this.$element.addClass("progress");
                this.$indicator = this.$element.find(".indicator");

                if (!this.$indicator.length) {
                    this.$indicator = $("<div>").addClass("indicator").appendTo(this.$element);
                }

                if (this.settings.autoHide) {
                    this.$element.addClass("progress-hide");
                }
            }
        }, {
            key: 'show',
            value: function show() {
                this.$element.addClass("show");
            }
        }, {
            key: 'hide',
            value: function hide() {
                this.$element.removeClass("show");
            }
        }, {
            key: 'setValue',
            value: function setValue(value) {
                var percententValue = value + "%";
                this.$indicator.width(percententValue);

                if (this.settings.showValue) {
                    this.$indicator.text(percententValue);
                }
            }
        }], [{
            key: '_jQueryInterface',
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new Progress(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: 'DefaultSettings',
            get: function get() {
                return {
                    showValue: true,
                    autoHide: false,
                    progress: function progress() {}
                };
            }
        }]);

        return Progress;
    }();

    $.fn[NAME] = Progress._jQueryInterface;
    $.fn[NAME].Constructor = Progress;
    return Progress;
}(_jquery2.default);
exports.default = Progress;

/***/ }),
/* 34 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _fileUploader = __webpack_require__(9);

var _fileUploader2 = _interopRequireDefault(_fileUploader);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var PictureUploader = function ($) {
    var NAME = 'pictureUploader';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.pictureUploader';

    var PictureUploader = function (_FileUploader) {
        _inherits(PictureUploader, _FileUploader);

        function PictureUploader(element, options) {
            _classCallCheck(this, PictureUploader);

            var settings = $.extend({}, PictureUploader.DefaultSettings, options);
            return _possibleConstructorReturn(this, (PictureUploader.__proto__ || Object.getPrototypeOf(PictureUploader)).call(this, element, settings));
        }

        _createClass(PictureUploader, [{
            key: "initializePreviewer",
            value: function initializePreviewer() {
                this.image = this.element.querySelector("img");

                if (this.element.dataset["optionDefaultImage"]) {
                    this.settings["defaultImage"] = this.element.dataset["optionDefaultImage"];
                }
                if (this.settings["defaultImage"] && !this.image.src) {
                    this.image.src = this.settings["defaultImage"];
                }
            }
        }, {
            key: "setPathForPreviewer",
            value: function setPathForPreviewer(path) {

                if (path) {
                    this.image.src = path;
                } else {
                    this.image.src = this.settings["defaultImage"];
                }
            }
        }], [{
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new PictureUploader(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return {
                    defaultImage: null
                };
            }
        }]);

        return PictureUploader;
    }(_fileUploader2.default);

    $.fn[NAME] = PictureUploader._jQueryInterface;
    $.fn[NAME].Constructor = PictureUploader;
    return PictureUploader;
}(_jquery2.default);
exports.default = PictureUploader;

/***/ }),
/* 35 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _localization = __webpack_require__(3);

var _localization2 = _interopRequireDefault(_localization);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Message = function ($) {
    var Message = function () {
        function Message(message, options) {
            _classCallCheck(this, Message);

            var _this = this;
            this.settings = $.extend({}, Message.DefaultSettings, options);
            var title_html = this.settings.title ? '<h5 class="title">' + this.settings.title + '</h5>' : "";

            if (this.settings.showMask) {
                $('body').addClass("mask");
            }
            this.$element = $('<div class="message ' + this.settings.type + '">\
                <span class="icon ' + this.settings.type + '"></span>\
                <div class="body">' + title_html + '\
                <p class="content">' + message + '</p>\
                </div>\
                </div>').appendTo("body").addClass("show");

            if (this.settings.autoHide) {
                setTimeout(function () {
                    _this.hide();
                }, this.settings.timeShow);
            } else if (!this.settings.disableCloseButton) {
                var $messageFooter = $("<div class='message-footer'>").appendTo(this.$element);
                $("<button>").addClass("button-text block").text(_localization2.default.localize("Confirm")).appendTo($messageFooter).click(function () {
                    _this.hide();
                });
            }
        }

        _createClass(Message, [{
            key: "hide",
            value: function hide(delayTime) {
                var _this = this;

                if (delayTime) {
                    setTimeout(function () {
                        _this.doHide();
                    }, delayTime);
                } else {
                    _this.doHide();
                }
            }
        }, {
            key: "doHide",
            value: function doHide() {
                var _this = this;

                _this.$element.removeClass("show").addClass("hide");
                setTimeout(function () {
                    _this.$element.remove();

                    if (_this.settings.showMask) {
                        $('body').removeClass("mask");
                    }
                }, 1000);
            }
        }, {
            key: "loadingToSuccess",
            value: function loadingToSuccess(message, callback, delayTime) {
                this.$element.removeClass(this.settings.type).addClass("success").find(".icon").removeClass(this.settings.type).addClass("success");
                this.$element.find(".content").html(message);

                if (delayTime) {
                    setTimeout(function () {
                        callback();
                    }, delayTime);
                }
            }
        }, {
            key: "loadingToError",
            value: function loadingToError(message, callback, delayTime) {
                this.$element.removeClass(this.settings.type).addClass("error").find(".icon").removeClass(this.settings.type).addClass("error");
                this.$element.find(".content").html(message);

                if (delayTime) {
                    setTimeout(function () {
                        callback();
                    }, delayTime);
                }
            }
        }], [{
            key: "DefaultSettings",
            get: function get() {
                return {
                    type: "info",
                    autoHide: false,
                    showMask: true,
                    disableCloseButton: false,
                    timeShow: 5000
                };
            }
        }]);

        return Message;
    }();

    $.message = function (message, options) {
        return new Message(message, options);
    };
    $.message.success = function (message, options) {
        var localOptions = $.extend({ type: 'success' }, options);
        return $.message(message, localOptions);
    };
    $.message.info = function (message, options) {
        var localOptions = $.extend({ type: 'success' }, options);
        return $.message(message, localOptions);
    };
    $.message.warn = function (message, options) {
        var localOptions = $.extend({ type: 'success' }, options);
        return $.message(message, localOptions);
    };
    $.message.error = function (message, options) {
        var localOptions = $.extend({ type: 'error' }, options);
        return $.message(message, localOptions);
    };
    $.message.loading = function (message, options) {
        var localOptions = $.extend({ type: 'loading', autoHide: false, showMask: true, disableCloseButton: true }, options);
        return $.message(message, localOptions);
    };
    return Message;
}(_jquery2.default);
exports.default = Message;

/***/ }),
/* 36 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Notify = function ($) {
    var Notify = function () {
        function Notify(message, options) {
            _classCallCheck(this, Notify);

            var _this = this;
            this.settings = $.extend({}, Notify.DefaultSettings, options);
            var $notifyBox = $(".notify-box");

            if (!$notifyBox.length) {
                $notifyBox = $('<div class="notify-box">').appendTo("body");
            }
            var title_html = this.settings.title ? '<h5 class="title">' + this.settings.title + '</h5>' : "";

            this.$element = $('<div class="notify ' + this.settings.type + '">\
        <span class="icon ' + this.settings.type + '"></span>\
            <div class="body">' + title_html + '\
                <p class="content">' + message + '</p>\
            </div>\
        </div>').appendTo($notifyBox).css({
                left: '100%'
            }).animate({
                left: '0'
            }, 500);

            if (this.settings.autoHide) {
                setTimeout(function () {
                    _this.hide();
                }, this.settings.timeShow);
            }
        }

        _createClass(Notify, [{
            key: "hide",
            value: function hide() {
                this.$element.animate({
                    left: '-100%',
                    opacity: 0,
                    height: 0
                }, 500, function () {
                    $(this).remove();
                });
            }
        }], [{
            key: "DefaultSettings",
            get: function get() {
                return {
                    type: "info",
                    autoHide: true,
                    timeShow: 5000
                };
            }
        }]);

        return Notify;
    }();

    $.notify = function (message, options) {
        return new Notify(message, options);
    };
    $.notify.success = function (message, options) {
        var localOptions = $.extend({ type: 'success' }, options);
        $.notify(message, localOptions);
    };
    $.notify.info = function (message, options) {
        var localOptions = $.extend({ type: 'info' }, options);
        $.notify(message, localOptions);
    };
    $.notify.warn = function (message, options) {
        var localOptions = $.extend({ type: 'warn' }, options);
        $.notify(message, localOptions);
    };
    $.notify.error = function (message, options) {
        var localOptions = $.extend({ type: 'error' }, options);
        $.notify(message, localOptions);
    };
    return Notify;
}(_jquery2.default);
exports.default = Notify;

/***/ }),
/* 37 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Popup = function ($) {
    var NAME = 'popup';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.popup';
    var globalShowingPopup = null;

    var Popup = function () {
        function Popup(element, options) {
            _classCallCheck(this, Popup);

            var _this = this;
            this.element = element;
            this.$element = $(element);
            this.$content = null;
            this.settings = $.extend({}, Popup.DefaultSettings, options);
            this.initialize();

            if (this.settings.$content) {
                this.$content = this.setConent(this.settings.$content);
            }
            $(document).on("click", function (event) {

                if (!_this.$element.is(event.target)) {
                    _this.hide();
                }
            });
        }

        _createClass(Popup, [{
            key: 'initialize',
            value: function initialize() {

                if (!this.element) {
                    this.$element = $("<div class='popup'>").appendTo(document.body);
                    this.element = this.$element[0];
                }

                if (!this.settings.show) {
                    this.$element.hide();
                }

                if (this.settings.$target) {
                    var left = this.settings.$target.offset().left;
                    var top = this.settings.$target.offset().top;
                    var divOffset = { left: left, top: top };
                    divOffset.top += this.settings.$target.height();
                    this.$element.css(divOffset).show();
                }

                $(document).on("click", function (event) {});

                this.$element.click(function (event) {
                    event.stopPropagation();
                });

                if (globalShowingPopup) {
                    globalShowingPopup.remove();
                }
                globalShowingPopup = this;
            }
        }, {
            key: 'show',
            value: function show() {
                this.$element.show();
                return this;
            }
        }, {
            key: 'hide',
            value: function hide() {
                this.$element.hide();
                this.settings.onHide.call(this);
                return this;
            }
        }, {
            key: 'setConent',
            value: function setConent($element) {
                this.$content = $element.appendTo(this.$element);
                return this;
            }
        }, {
            key: 'remove',
            value: function remove() {
                this.$element.remove();
            }
        }], [{
            key: '_jQueryInterface',
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new Popup(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: 'DefaultSettings',
            get: function get() {
                return {
                    $target: null,
                    $content: null,
                    show: true,
                    onShow: function onShow() {},
                    onHide: function onHide() {}
                };
            }
        }]);

        return Popup;
    }();

    $[NAME] = function (options) {
        return new Popup(null, options);
    };
    $.fn[NAME] = Popup._jQueryInterface;
    $.fn[NAME].Constructor = Popup;
    return Popup;
}(_jquery2.default);
exports.default = Popup;

/***/ }),
/* 38 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Toast = function ($) {
    var Toast = function () {
        function Toast(message, options) {
            _classCallCheck(this, Toast);

            var _this = this;
            this.settings = $.extend({}, Toast.DefaultSettings, options);

            if (this.settings.showMask) {
                $('body').addClass("mask");
            }
            this.$element = $('<div class="toast ' + this.settings.type + '">\
                <span class="icon ' + this.settings.type + '"></span>\
                <div class="body">\
                <div class="content">' + message + '</div>\
                <div>\
                </div>').appendTo("body").addClass("show");

            if (this.settings.autoHide) {
                setTimeout(function () {
                    _this.hide();
                }, this.settings.timeShow);
            }
        }

        _createClass(Toast, [{
            key: "hide",
            value: function hide(delayTime) {
                var _this = this;

                if (delayTime) {
                    setTimeout(function () {
                        _this.doHide();
                    }, delayTime);
                } else {
                    _this.doHide();
                }
            }
        }, {
            key: "doHide",
            value: function doHide() {
                var _this = this;
                _this.$element.removeClass("show").addClass("hide");

                setTimeout(function () {
                    _this.$element.remove();

                    if (_this.settings.showMask) {
                        $('body').removeClass("mask");
                    }
                    _this.settings.hideCallback && _this.settings.hideCallback();
                }, 1000);
            }
        }, {
            key: "loadingToSuccess",
            value: function loadingToSuccess(message, callback, delayTime) {
                this.$element.removeClass(this.settings.type).addClass("success").find(".icon").removeClass(this.settings.type).addClass("success");
                this.$element.find(".content").html(message);

                if (delayTime) {
                    setTimeout(function () {
                        callback();
                    }, delayTime);
                }
            }
        }, {
            key: "loadingToError",
            value: function loadingToError(message, callback, delayTime) {
                this.$element.removeClass(this.settings.type).addClass("error").find(".icon").removeClass(this.settings.type).addClass("error");
                this.$element.find(".content").html(message);

                if (delayTime) {
                    setTimeout(function () {
                        callback();
                    }, delayTime);
                }
            }
        }], [{
            key: "DefaultSettings",
            get: function get() {
                return {
                    type: "info",
                    showMask: false,
                    autoHide: true,
                    timeShow: 2000,
                    hideCallback: function hideCallback() {}
                };
            }
        }]);

        return Toast;
    }();

    $.toast = function (message, options) {
        return new Toast(message, options);
    };
    $.toast.info = function (message, options) {
        var optionsLocal = $.extend({ type: 'info' }, options);
        return $.toast(message, optionsLocal);
    };
    $.toast.success = function (message, options) {
        var optionsLocal = $.extend({ type: 'success' }, options);
        return $.toast(message, optionsLocal);
    };
    $.toast.error = function (message, options) {
        var optionsLocal = $.extend({ type: 'error' }, options);
        return $.toast(message, optionsLocal);
    };
    $.toast.loading = function (message, options) {
        var optionsLocal = $.extend({ type: 'loading', autoHide: false, showMask: true }, options);
        return $.toast(message, optionsLocal);
    };
    return Toast;
}(_jquery2.default);
exports.default = Toast;

/***/ }),
/* 39 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Tip = function ($) {
    var Tip = function () {
        function Tip(message, options) {
            _classCallCheck(this, Tip);

            var _this = this;
            this.settings = $.extend({}, Tip.DefaultSettings, options);
            this.$element = $("<div>").addClass("tip").text(message).appendTo("body").addClass("show");

            setTimeout(function () {
                _this.hide();
            }, this.settings.timeShow);
        }

        _createClass(Tip, [{
            key: "hide",
            value: function hide(delayTime) {
                var _this = this;

                if (delayTime) {
                    setTimeout(function () {
                        _this.doHide();
                    }, delayTime);
                } else {
                    _this.doHide();
                }
            }
        }, {
            key: "doHide",
            value: function doHide() {
                var _this = this;
                _this.$element.removeClass("show").addClass("hide");

                setTimeout(function () {
                    _this.$element.remove();
                    _this.settings.hideCallback && _this.settings.hideCallback();
                }, 1000);
            }
        }], [{
            key: "DefaultSettings",
            get: function get() {
                return {
                    timeShow: 2000,
                    hideCallback: function hideCallback() {}
                };
            }
        }]);

        return Tip;
    }();

    $.tip = function (message, options) {
        return new Tip(message, options);
    };
    return Tip;
}(_jquery2.default);
exports.default = Tip;

/***/ }),
/* 40 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var Rippler = function ($) {
    function diagonal(x, y) {

        if (x > 0 && y > 0) return Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2));else return false;
    }

    var defaultSettings = {
        duration: 600
    };

    $.fn.rippler = function (options) {
        var settings = $.extend(defaultSettings, options);
        this.each(function (index, element) {
            var $this = $(this);
            $this.on("mousedown", function (event) {
                var offset = $this.offset();
                var left = event.pageX - offset.left;
                var top = event.pageY - offset.top;
                $("<div></div>").appendTo($this).addClass("rippler-pointer").css({
                    left: left,
                    top: top
                });
            });
            $this.on("mouseup", function (event) {
                var offset = $this.offset();
                var left = event.pageX - offset.left;
                var top = event.pageY - offset.top;
                var thisW = $this.outerWidth();
                var thisH = $this.outerHeight();
                var effectMaxWidth = diagonal(thisW, thisH) * 2;
                var $ripplerPointer = $this.find(".rippler-pointer").css({
                    'width': effectMaxWidth,
                    'height': effectMaxWidth,
                    'left': left - effectMaxWidth / 2,
                    'top': top - effectMaxWidth / 2,
                    'opacity': 0,
                    'transition': 'all ' + settings.duration / 1000 + 's ease-out'
                });
                setTimeout(function () {
                    $ripplerPointer.remove();
                }, settings.duration);
            });
        });
    };
}(_jquery2.default);
exports.default = Rippler;

/***/ }),
/* 41 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _dialog = __webpack_require__(2);

var _dialog2 = _interopRequireDefault(_dialog);

var _scrollBar = __webpack_require__(10);

var _scrollBar2 = _interopRequireDefault(_scrollBar);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var RichTextEditor = function ($) {
    var NAME = 'richTextEditor';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.richTextEditor';

    $.fn.pasteEvents = function (delay) {

        if (delay == undefined) delay = 10;
        return $(this).each(function () {
            var $el = $(this);
            $el.on("paste", function () {
                $el.trigger("prepaste");
                setTimeout(function () {
                    $el.trigger("postpaste");
                }, delay);
            });
        });
    };

    var readFileIntoDataUrl = function readFileIntoDataUrl(fileInfo) {
        var loader = $.Deferred(),
            fReader = new FileReader();
        fReader.onload = function (e) {
            loader.resolve(e.target.result);
        };
        fReader.onerror = loader.reject;
        fReader.onprogress = loader.notify;
        fReader.readAsDataURL(fileInfo);
        return loader.promise();
    };

    var baseColors = [['#000000', '#424242', '#636363', '#9C9C94', '#CEC6CE', '#EFEFEF', '#F7F7F7', '#FFFFFF'], ['#FF0000', '#FF9C00', '#FFFF00', '#00FF00', '#00FFFF', '#0000FF', '#9C00FF', '#FF00FF'], ['#F7C6CE', '#FFE7CE', '#FFEFC6', '#D6EFD6', '#CEDEE7', '#CEE7F7', '#D6D6E7', '#E7D6DE'], ['#E79C9C', '#FFC69C', '#FFE79C', '#B5D6A5', '#A5C6CE', '#9CC6EF', '#B5A5D6', '#D6A5BD'], ['#E76363', '#F7AD6B', '#FFD663', '#94BD7B', '#73A5AD', '#6BADDE', '#8C7BC6', '#C67BA5'], ['#CE0000', '#E79439', '#EFC631', '#6BA54A', '#4A7B8C', '#3984C6', '#634AA5', '#A54A7B'], ['#9C0000', '#B56308', '#BD9400', '#397B21', '#104A5A', '#085294', '#311873', '#731842'], ['#630000', '#7B3900', '#846300', '#295218', '#083139', '#003163', '#21104A', '#4A1031']];

    var RichTextEditor = function () {
        function RichTextEditor(element, options) {
            _classCallCheck(this, RichTextEditor);

            this.element = element;
            this.$element = $(element);
            this.settings = $.extend(RichTextEditor.DefaultSettings, options);
            this.buttons = $.merge(this.Buttons, this.settings.buttons);
            this.commandButtons = [];
            this.$toolbar = null;
            this.$content = null;
            this.$textarea = null;
            this.range = null;
            this.status = 1;
            this.bookmark = null;
            this.selectedRange = null;
            this.initialize();
        }

        _createClass(RichTextEditor, [{
            key: "initialize",
            value: function initialize() {
                var _this = this;
                var html = this.settings.content;
                this.createToolbar();

                if (this.$element[0].nodeName == 'TEXTAREA') {
                    this.$textarea = this.$element;
                    this.$textarea.wrap("<div>");
                    this.$element = this.$textarea.parent;
                    html = this.settings.content ? this.settings.content : this.$textarea.val();
                    this.$toolbar.insertBefore(this.$textarea);
                } else if (this.$element[0].nodeName == 'DIV') {
                    html = this.settings.content ? this.settings.content : this.$element.html();
                    this.$element.empty();
                    this.$element.append(this.$toolbar);
                } else {
                    throw DOMException("WrongDom");
                }
                this.$element.addClass("rich-text-editor");
                this.$content = $("<div class='content'>").appendTo(this.$element).on("DOMNodeInserted", function (e) {
                    _this.domNodeInsertedHandle.call(_this, e);
                }).html(html);
                this.$textarea = $("<textarea class='code'>").appendTo(this.$element).hide();
                this.$previewer = $("<div class='previewer'>").appendTo(this.$element);

                this.$content.on('focus', function (e) {
                    _this.settings.onFocus && _this.settings.onFocus.call(_this);
                }).on('input', function () {
                    _this.settings.onInput && _this.settings.onInput.call(_this, _this.getContent());
                }).on("paste", function (event) {
                    //console.log(event.originalEvent.clipboardData.getData("text"))
                    //return false;
                });

                if (this.settings.focus) {
                    this.setEdit().focus();
                } else {
                    this.setViewEditStatus(this.settings.editViewStatus);
                }
            }
        }, {
            key: "createToolbar",
            value: function createToolbar() {
                var _this = this;
                this.$toolbar = $("<div class='toolbar'>").scrollBar();

                this.buttons.forEach(function (buttonData) {
                    _this.createToolbarItem(buttonData);
                });
                return this.$toolbar;
            }
        }, {
            key: "createToolbarItem",
            value: function createToolbarItem(buttonData) {
                var _this = this;
                var $toolbarItem = $("<div class='toolbar-item'>").appendTo(this.$toolbar);
                var $button = RichTextEditor.createButtonDom(buttonData).appendTo($toolbarItem);

                if (buttonData.command) {
                    $button.addClass(_this.settings.commandButtonSelector);
                    $button.get(0).dataset["value"] = buttonData.value;
                }
                if (buttonData.values) {

                    if (buttonData.parseButton) {
                        buttonData.parseButton($button, buttonData.values[0]);
                    }
                    $button.attr("data-toggle", "dropdown");
                    var $ul = $("<ul class='dropdown dropdown-menu-list hide'>").appendTo($toolbarItem);
                    buttonData.values.forEach(function (value) {
                        var $item = $("<li>").appendTo($ul);
                        var $itemA = $("<a>").appendTo($item).html(value);

                        if (buttonData.command) {
                            $item.get(0).dataset["command"] = buttonData.command;
                        }
                        $item.get(0).dataset["value"] = value;

                        if (buttonData.parseItem) {
                            buttonData.parseItem($itemA, value);
                        }

                        var onExecCommandCallback = function onExecCommandCallback() {};

                        if (buttonData.parseButton) {
                            onExecCommandCallback = function onExecCommandCallback(value) {
                                buttonData.parseButton($button, value);
                            };
                        }
                        _this.bindHanlderForButton($item, buttonData);
                    });
                    $toolbarItem.addClass("dropdown-wripper dropdown-menu").dropdownMenu({
                        onClick: _this.restoreSelection
                    });
                } else {
                    this.bindHanlderForButton($button, buttonData);
                }
                return $button;
            }
        }, {
            key: "bindHanlderForButton",
            value: function bindHanlderForButton($button, buttonData, onExecCommandCallback) {
                var _this = this;

                if (buttonData.apiCommand) {
                    $button.data("apiCommand", buttonData.apiCommand).click(function (event) {
                        _this.restoreSelection();
                        _this[buttonData.apiCommand].call(_this, this.dataset['value']);
                        event.stopPropagation();
                    });
                } else if (buttonData.handler) {
                    $button.click(function (event) {
                        _this.restoreSelection().focus();
                        buttonData.handler.call(_this, this.dataset['value']);
                        event.stopPropagation();
                    });
                } else if (buttonData.type == 'color') {
                    $button.click(function (event) {
                        _this.restoreSelection().focus();
                        _this.colorPicker(buttonData.name, $button, function (value) {
                            buttonData && buttonData.parseButton($button, value);
                        });
                        event.stopPropagation();
                    });
                } else if (buttonData.command) {
                    $button.get(0).dataset['command'] = buttonData.command;
                    $button.attr("unselectable", "on").click(function (event) {
                        var command = this.dataset['command'];
                        var value = this.dataset['value'];
                        _this.restoreSelection().focus();
                        _this.execCommand(command, value);
                        onExecCommandCallback && onExecCommandCallback.call(_this, value);
                        event.stopPropagation();
                    });
                }
                return this;
            }
        }, {
            key: "initializeImage",
            value: function initializeImage(img) {
                var _this = this;

                $(img).click(function (e) {
                    _this.setImageSettingMode.call(_this, this);
                });
            }
        }, {
            key: "domNodeInsertedHandle",
            value: function domNodeInsertedHandle(e) {
                var _this = this;

                if (e.target.nodeName == "IMG") {
                    _this.initializeImage(e.target);
                } else {
                    var imgs = e.target.querySelectorAll("img");
                    imgs.forEach(function (img) {
                        _this.initializeImage(img);
                    });
                }
            }
        }, {
            key: "setImageSettingMode",
            value: function setImageSettingMode(img) {
                var _this = this;
                var $img = $(img);

                if (!$img.hasClass("setting")) {
                    $img.addClass("setting");
                    var $imageSettingBar = $("<div class='image-setting-bar'>").appendTo(document.body);
                    $imageSettingBar.css("left", $img.offset().left);
                    $imageSettingBar.css("top", $img.offset().top);
                    $("<button class='button-text border radius'>").text("100%").appendTo($imageSettingBar).click(function () {
                        $img.css({ width: "100%" });
                        _this.removeImageSettingMode(img);
                    });
                    $("<button class='button-text border radius'>").text("50%").appendTo($imageSettingBar).click(function () {
                        $img.css({ width: "50%" });
                        _this.removeImageSettingMode(img);
                    });
                    $("<button class='button-text border radius'>").text("pull left").appendTo($imageSettingBar).click(function () {
                        $img.css({ "float": "left" });
                        _this.removeImageSettingMode(img);
                    });
                    $("<button class='button-text border radius'>").text("pull right").appendTo($imageSettingBar).click(function () {
                        $img.css({ "float": "right" });
                        _this.removeImageSettingMode(img);
                    });
                    $("<button class='button-text border radius'>").text("clear pull").appendTo($imageSettingBar).click(function () {
                        $img.css({ "float": "none" });
                        _this.removeImageSettingMode(img);
                    });
                    $("<button class='button-text border radius'>").text("clear zoom").appendTo($imageSettingBar).click(function () {
                        $img.css({ "width": "auto" });
                        _this.removeImageSettingMode(img);
                    });

                    $(document).click(function (event) {

                        if (event.target != img) {
                            $img.removeClass("setting");
                            $imageSettingBar.remove();
                        }
                    });
                }
            }
        }, {
            key: "cleanHtml",
            value: function cleanHtml() {
                var content = this.$content.html();
                return content && content.replace(/(<br>|\s|<div><br><\/div>|&nbsp;)*$/, '');
            }
        }, {
            key: "save",
            value: function save() {
                if (this.settings.onSave) {
                    this.settings.onSave.call(this, this.getContent());
                }
            }
        }, {
            key: "insertPicture",
            value: function insertPicture() {
                var _this = this;

                if (!this.$pictureFileInput) {
                    this.$pictureFileInput = $("<input type=file>").hide().appendTo(this.$element).change(function () {
                        _this.settings.onImageUpload(this.files, _this);
                    });
                }
                this.$pictureFileInput.click();
            }
        }, {
            key: "code",
            value: function code() {
                var _this = this;
                var range = RichTextEditor.getCurrentRange();

                if (!this.codeDialog) {
                    var $codeInput = $("<textarea class='block' rows=10>").wrap("<div>");
                    this.codeDialog = $.dialog(null, {
                        responsive: true,
                        title: "insert code",
                        okHandle: function okHandle() {
                            var $pre = $("<pre>").html($codeInput.val());
                            range.insertNode($pre.get(0));
                            this.hide();
                        }
                    });
                    this.codeDialog.setContent($codeInput.parent());
                }
                this.codeDialog.show();
            }
        }, {
            key: "setContent",
            value: function setContent(content) {
                this.$content.html(content);
                this.$textarea.val(content);
                return this;
            }
        }, {
            key: "getContent",
            value: function getContent() {
                return this.$content.html();
            }
        }, {
            key: "focus",
            value: function focus() {
                this.$content.focus();
                return this;
            }
        }, {
            key: "setViewEditStatus",
            value: function setViewEditStatus(status) {

                if (status) {
                    return this.setEdit();
                } else {
                    return this.setView();
                }
            }
        }, {
            key: "setView",
            value: function setView() {
                this.$previewer.html(this.$content.html());
                this.$previewer.find("pre").codeHighlight();
                this.$toolbar.hide();
                this.$content.attr("contenteditable", false).hide();
                this.$previewer.show();
                this.status = 2;
                return this;
            }
        }, {
            key: "setEdit",
            value: function setEdit() {
                var _this = this;
                this.$previewer.hide();
                this.$toolbar.show();

                this.$content.attr('contenteditable', true).on('mouseup keyup mouseout', function () {
                    _this.saveSelection();
                    _this.updateToolbar();
                }).show().focus();
                this.status = 1;
                return this;
            }
        }, {
            key: "insertImage",
            value: function insertImage(imagePath) {
                this.execCommand('insertimage', imagePath);
            }
        }, {
            key: "colorPicker",
            value: function colorPicker(command, $button, onExecCommandCallback) {
                var _this = this;
                var popup = $.popup({
                    $target: $button
                });
                var $colorPicker = $("<div class='color-picker'>");
                var $colorPickerMartix = $("<div class='color-picker-martix'>").appendTo($colorPicker);
                popup.setConent($colorPicker).show();

                for (var i = 0; i < baseColors.length; i++) {
                    var colorGroup = baseColors[i];

                    for (var j = 0; j < colorGroup.length; j++) {
                        var color = colorGroup[j];
                        $("<button class='color-cell'>").css("background-color", color).data('color', color).appendTo($colorPickerMartix).click(function () {
                            var value = $(this).data('color');
                            _this.execCommand(command, value);
                            onExecCommandCallback.call(_this, value);
                            popup.remove();
                        });
                    }
                }
            }
        }, {
            key: "insertLink",
            value: function insertLink(link) {
                var _this = this;
                var range = RichTextEditor.getCurrentRange();

                if (!range) {
                    return;
                }
                var innerDom = range.extractContents();

                var $linkInput = $("<input type='text' placeholder='link'>").wrap("<div class='input-wrapper large'>");
                this.$linkDialog = $.dialog(null, {
                    responsive: true,
                    title: "insert link",
                    okHandle: function okHandle() {
                        _this.focus();
                        var link = $("<a href='" + $linkInput.val() + "' target='_blank'></a>");
                        link.append(innerDom);
                        range.insertNode(link[0]);
                        this.hide();
                    }
                });
                this.$linkDialog.setContent($linkInput.parent());
                this.$linkDialog.show();
            }
        }, {
            key: "insertHTML",
            value: function insertHTML(html) {
                var selection = document.getSelection();
                var range = void 0;

                if (selection.rangeCount) {
                    range = selection.getRangeAt(0);
                } else {
                    range = document.createRange();
                }
                range = RichTextEditor.getCurrentRange();
                var node = $(html).get(0);
                range.surroundContents(node);
                selection.removeAllRanges();
                selection.addRange(range);
                return this;
            }
        }, {
            key: "saveSelection",
            value: function saveSelection() {
                this.selectedRange = RichTextEditor.getCurrentRange();
                return this;
            }
        }, {
            key: "restoreSelection",
            value: function restoreSelection() {
                var selection = window.getSelection();

                if (this.selectedRange) {

                    try {
                        selection.removeAllRanges();
                    } catch (ex) {
                        document.body.createTextRange().select();
                        document.selection.empty();
                    }
                    selection.addRange(this.selectedRange);
                }
                return this;
            }
        }, {
            key: "markSelection",
            value: function markSelection(input, color) {
                this.restoreSelection();

                if (document.queryCommandSupported('hiliteColor')) {
                    document.execCommand('hiliteColor', 0, color || 'transparent');
                }
                this.saveSelection();
                input.data(this.settings.selectionMarker, color);
                return this;
            }
        }, {
            key: "updateToolbar",
            value: function updateToolbar() {
                var _this = this;

                $("." + this.settings.commandButtonSelector).each(function () {
                    var command = this.dataset.command;

                    if (document.queryCommandState(command)) {
                        $(this).addClass(_this.settings.activedCommandButtonClass);
                    } else {
                        $(this).removeClass(_this.settings.activedCommandButtonClass);
                    }
                });
                return this;
            }
        }, {
            key: "execCommand",
            value: function execCommand(commandWithArgs, valueArg) {
                var commandArr = commandWithArgs.split(' '),
                    command = commandArr.shift(),
                    args = commandArr.join(' ') + (valueArg || '');
                document.execCommand(command, false, args);
                this.saveSelection();
                this.updateToolbar();
                return this;
            }
        }, {
            key: "Buttons",
            get: function get() {
                return [{ name: 'undo', type: 'icon', command: 'undo' }, { name: 'redo', type: 'icon', command: 'redo' }, {
                    name: 'formatBlock',
                    type: 'text',
                    values: ["h1", "h2", "h3", "h4", "h5", "h6"],
                    parseButton: function parseButton($button, value) {
                        $button.text("head" + value);
                    },
                    parseItem: function parseItem($item, value) {
                        $item.text("head" + value);
                    },
                    command: 'formatBlock'
                }, {
                    name: 'fontName',
                    type: 'text',
                    command: 'fontName',
                    values: this.settings.fontNames,
                    parseButton: function parseButton($button, value) {
                        $button.text(value);
                    },
                    parseItem: function parseItem($item, value) {
                        $item.css("font-family", value);
                    }
                }, {
                    name: 'fontSize',
                    type: 'text',
                    command: 'fontSize',
                    values: this.settings.fontSizes,
                    parseButton: function parseButton($button, value) {
                        $button.text(value);
                    },
                    parseItem: function parseItem($item, value) {
                        $item.css("font-size", value + "px");
                    }
                }, {
                    name: 'forecolor',
                    type: 'color',
                    text: 'F',
                    command: 'forecolor',
                    parseButton: function parseButton($button, value) {
                        $button.css("color", value);
                    }
                }, {
                    name: 'backcolor',
                    type: 'color',
                    text: 'B',
                    command: 'backcolor',
                    parseButton: function parseButton($button, value) {
                        $button.css("background-color", value);
                    }
                }, { name: 'removeformat', type: 'icon', command: 'removeformat' }, { name: 'bold', type: 'icon', command: 'bold' }, { name: 'italic', type: 'icon', command: 'italic' }, { name: 'underline', type: 'icon', command: 'underline' }, { name: 'strikethrough', type: 'icon', command: 'strikethrough' }, { name: 'justifyleft', type: 'icon', command: 'justifyleft' }, { name: 'justifycenter', type: 'icon', command: 'justifycenter' }, { name: 'justifyright', type: 'icon', command: 'justifyright' }, { name: 'justifyfull', type: 'icon', command: 'justifyfull' }, { name: 'indent', type: 'icon', command: 'indent' }, { name: 'outdent', type: 'icon', command: 'outdent' }, { name: 'code', type: 'icon', apiCommand: 'code' }, { name: 'formatBlock', type: 'icon', command: 'formatBlock', value: 'blockquote' }, { name: 'insertimage', type: 'icon', apiCommand: 'insertPicture' }, { name: 'link', type: 'icon', command: 'link', apiCommand: 'insertLink' }, { name: 'insertorderedlist', type: 'icon', command: 'insertorderedlist' }, { name: 'insertunorderedlist', type: 'icon', command: 'insertunorderedlist' }];
            }
        }], [{
            key: "createButtonDom",
            value: function createButtonDom(buttonData) {
                var $button = $("<button>").attr("title", buttonData.name);

                switch (buttonData.type) {
                    case 'icon':
                        $button.addClass("button-icon").addClass("edit-icon-" + buttonData.name);
                        break;
                    case 'text':
                        $button.addClass("button-text");

                        if (buttonData.text) {
                            $button.text(buttonData.text);
                        }
                        break;
                    case 'color':
                        $button.addClass("button-text");

                        if (buttonData.text) {
                            $button.text(buttonData.text);
                        }
                        break;
                }
                return $button;
            }
        }, {
            key: "getSelection",
            value: function getSelection() {
                return window.getSelection();
            }
        }, {
            key: "getCurrentRange",
            value: function getCurrentRange() {
                var selection = RichTextEditor.getSelection();

                if (selection.getRangeAt && selection.rangeCount) {
                    return selection.getRangeAt(0);
                }
            }
        }, {
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new RichTextEditor(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return {
                    focus: false, // set focus to editable area after initializing summernote
                    lang: 'en-US', // language 'en-US', 'ko-KR', ...
                    editViewStatus: true,
                    content: null,
                    commandButtonSelector: 'command-button',
                    activedCommandButtonClass: 'actived-command',
                    selectionMarker: 'edit-focus-marker',
                    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica Neue', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana'],
                    fontSizes: ['8', '9', '10', '11', '12', '14', '18', '24', '36'],
                    lineHeights: ['1.0', '1.2', '1.4', '1.5', '1.6', '1.8', '2.0', '3.0'],
                    // callbacks
                    oninit: null, // initialize
                    onfocus: null, // editable has focus
                    onblur: null, // editable out of focus
                    onenter: null, // enter key pressed
                    onkeyup: null, // keyup
                    onkeydown: null, // keydown
                    onImageUploadError: null, // imageUploadError
                    onToolbarClick: null,
                    onInput: null,
                    onSave: null,
                    onFocus: null,
                    onImageUpload: function onImageUpload(files, editor) {
                        editor.restoreSelection().focus();
                        $.each(files, function (index, fileInfo) {

                            if (/^image\//.test(fileInfo.type)) {
                                $.when(readFileIntoDataUrl(fileInfo)).done(function (dataUrl) {
                                    editor.insertImage(dataUrl);
                                }).fail(function (e) {});
                            } else {}
                        });
                    },
                    buttons: []
                };
            }
        }]);

        return RichTextEditor;
    }();

    $.fn[NAME] = RichTextEditor._jQueryInterface;
    $.fn[NAME].Constructor = RichTextEditor;
    return RichTextEditor;
}(_jquery2.default);
exports.default = RichTextEditor;

/***/ }),
/* 42 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var ScrollTopNav = function ($) {
    var defaultSettings = {
        height: 500
    };

    $.fn.scrollTopNav = function (options) {
        var settings = $.extend({}, defaultSettings, options);

        this.each(function (index, element) {
            var $nav = $(element);
            var height = settings.height;

            if (element.dataset["optionHeight"]) {
                height = element.dataset["optionHeight"];
            }
            $(window).scroll(function () {
                var scrollY = $(document).scrollTop();

                if (scrollY > height) {
                    $nav.addClass('top');
                } else {
                    $nav.removeClass('top');
                }
            });
        });
    };
}(_jquery2.default);
exports.default = ScrollTopNav;

/***/ }),
/* 43 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var SideNav = function ($) {
    var NAME = 'sideNav';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.sideNav';

    var SideNav = function () {
        function SideNav(element, options) {
            _classCallCheck(this, SideNav);

            this.element = element;
            this.$element = $(element);
            this.settings = $.extend({}, SideNav.DefaultSettings, options);
            this.menus = {};
            this.currentMenu = null;
            this.$handlers = $('[data-target="#' + this.element.id + '"]');
            this.initialize();
        }

        _createClass(SideNav, [{
            key: 'initialize',
            value: function initialize() {

                if (this.settings.data) {
                    this.createItems(this.$element, this.settings.data);
                } else {
                    this.bindEvent();
                }
            }
        }, {
            key: 'createItems',
            value: function createItems($parent, itemsData) {
                var self = this;

                itemsData.forEach(function (value) {
                    self.createItem.call(self, $parent, value);
                });
            }
        }, {
            key: 'createItem',
            value: function createItem($parent, itemData) {
                var self = this;
                var $li = $("<li>").appendTo($parent);

                if (itemData.items && itemData.items.length) {
                    $li.addClass("has-child");
                    var $title = $("<h5>").addClass("title").text(itemData.displayName).appendTo($li).on("click", self.toggleClickHandler);
                    var $ul = $("<ul>").appendTo($li);
                    self.createItems($ul, itemData.items);
                    $title.trigger("click");
                } else {
                    var $titleBlock = $("<div>").addClass("title-block").appendTo($li);
                    var $icon = $("<i>").addClass(itemData.icon).appendTo($titleBlock);
                    var hrefAttr = this.settings.userUiSref ? "ui-sref" : "href";
                    var _$title = $("<a>").addClass("title").attr(hrefAttr, itemData.url).text(itemData.displayName).appendTo($titleBlock);

                    if (this.settings.enableDefaultHandler) {
                        _$title.on("click", self.linkClickHandler);
                    }
                }
                this.menus[itemData.name] = {
                    data: itemData,
                    $li: $li
                };
            }
        }, {
            key: 'setCurrent',
            value: function setCurrent(currentMenuName) {
                if (!currentMenuName || !this.menus[currentMenuName]) {
                    return;
                }

                if (this.currentMenu) {
                    this.currentMenu.$li.removeClass("actived");
                }
                this.menus[currentMenuName].$li.addClass("actived");
                this.currentMenu = this.menus[currentMenuName];
            }
        }, {
            key: 'bindEvent',
            value: function bindEvent() {
                var _this = this;

                this.$handlers.on("click", function (event) {
                    _this.$element.toggleClass("show");
                });

                if (this.settings.enableDefaultHandler) {
                    this.$element.find("a.title").on("click", this.linkClickHandler);
                }
                this.$element.find("h5.title").on("click", this.toggleClickHandler);
            }
        }, {
            key: 'toggleClickHandler',
            value: function toggleClickHandler(e) {
                var $li = $(this).closest("li");

                if ($li.hasClass("opened")) {
                    $li.removeClass("opened");
                } else {
                    $li.closest("ul").find("li.opened").removeClass("opened");
                    $li.addClass("opened");
                }
            }
        }, {
            key: 'linkClickHandler',
            value: function linkClickHandler(e) {
                $(this).closest(".sidenav").find("li").removeClass("actived");
                $(this).closest("li").addClass("actived");
            }
        }], [{
            key: '_jQueryInterface',
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new SideNav(this);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: 'DefaultSettings',
            get: function get() {
                return {
                    menu: null,
                    enableDefaultHandler: true,
                    userUiSref: false
                };
            }
        }]);

        return SideNav;
    }();

    $.fn[NAME] = SideNav._jQueryInterface;
    $.fn[NAME].Constructor = SideNav;
    return SideNav;
}(_jquery2.default);
exports.default = SideNav;

/***/ }),
/* 44 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Slider = function ($) {
    var NAME = 'slider';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.slider';
    var EVENT_KEY = '.' + DATA_KEY;
    var TRANSITION_DURATION = 600;
    var ClassName = {
        Slider: 'slider',
        ACTIVE: 'active',
        SLIDE: 'slide',
        RIGHT: 'right',
        LEFT: 'left',
        NEXT: 'next',
        PREV: 'prev',
        ITEM: 'item'
    };
    var Event = {
        SLIDE: 'slide' + EVENT_KEY,
        SLID: 'slid' + EVENT_KEY,
        KEYDOWN: 'keydown' + EVENT_KEY,
        MOUSEENTER: 'mouseenter' + EVENT_KEY,
        MOUSELEAVE: 'mouseleave' + EVENT_KEY,
        TOUCHEND: 'touchend' + EVENT_KEY
    };

    var Selector = {
        ACTIVE: '.active',
        ACTIVE_ITEM: '.active.item',
        ITEM: '.item',
        NEXT_PREV: '.next, .prev',
        DATA_SLIDE: '[data-slide], [data-slide-to]',
        DATA_RIDE: '[data-ride="slider"]'
    };
    var Direction = {
        NEXT: 'next',
        PREV: 'prev'
    };

    var Slider = function () {
        function Slider(element, options) {
            _classCallCheck(this, Slider);

            this.element = element;
            this.$element = $(element);
            this.settings = $.extend({}, Slider.DefaultSettings, options);
            this.currentIndex = 1;
            this.length = 0;
            this.timer = null;
            this.isPaused = false;
            this.isSliding = false;
            this.initialized = false;

            if (this.settings.autoInitialize) {
                this.initialize();
            }
        }

        _createClass(Slider, [{
            key: 'initialize',
            value: function initialize() {

                if (this.initialized) {
                    return;
                }
                var $items = this.$element.find(Selector.ITEM);
                this.length = $items.length;

                var $activeItem = this.$element.find(Selector.ACTIVE_ITEM);

                if (!$activeItem.length) {
                    $items.eq(this.currentIndex - 1).addClass("active");
                } else {
                    this.currentIndex = $items.index($activeItem) + 1;
                }

                if (this.settings.enableIndicator) {
                    this.createIndicator();
                }

                if (this.settings.enableControl) {
                    this.createControl();
                }
                this.bindEvent();

                if (this.settings.slide) {
                    this.cycle();
                }
                this.initialized = true;
            }
        }, {
            key: 'createIndicator',
            value: function createIndicator() {
                var _this = this;
                this.$indicatorList = $("<ol>").addClass("slider-indicators").insertBefore(this.$element.find(".slider-inner"));

                for (var i = 0; i < this.length; i++) {
                    var $indicator = $("<li>").on("click", function () {
                        _this.to(_this.$indicators.index($(this)) + 1);
                    }).appendTo(this.$indicatorList);

                    if (i == this.currentIndex - 1) {
                        $indicator.addClass("active");
                    }
                }
                this.$indicators = this.$indicatorList.find("li");
            }
        }, {
            key: 'addIndicator',
            value: function addIndicator() {
                var _this = this;
                $("<li>").on("click", function () {
                    _this.to(_this.$indicators.index($(this)) + 1);
                }).appendTo(this.$indicatorList);
                this.$indicators = this.$indicatorList.find("li");
            }
        }, {
            key: 'createControl',
            value: function createControl() {
                this.$pre = $("<a>").addClass("slider-control left").attr("data-slide", "pre").appendTo(this.$element);
                this.$next = $("<a>").addClass("slider-control right").attr("data-slide", "next").appendTo(this.$element);
            }
        }, {
            key: 'reComputeLength',
            value: function reComputeLength() {
                var $items = this.$element.find(Selector.ITEM);
                this.length = $items.length;
            }
        }, {
            key: 'bindEvent',
            value: function bindEvent() {
                var _this = this;

                this.$element.hover(function () {
                    _this.pause();
                }, function () {
                    if (_this.settings.slide) {
                        _this.cycle();
                    }
                });

                if (this.settings.enableControl) {
                    this.$element.find(Selector.DATA_SLIDE).on("click", function () {
                        _this[this.dataset.slide].call(_this);
                    });
                }
            }
        }, {
            key: 'cycle',
            value: function cycle(e) {
                e || (this.isPaused = false);
                var _this = this;

                if (this.settings.interval && !this.isPaused) {
                    this.timer = setInterval(function () {
                        _this.next();
                    }, _this.settings.interval);
                }
            }
        }, {
            key: 'pre',
            value: function pre() {
                if (this.isSliding) return;
                var index = this.currentIndex - 1;

                if (index == 0) {
                    index = this.length;
                }
                this.slide(Direction.PREV, index);
            }
        }, {
            key: 'next',
            value: function next() {

                if (this.isSliding) return;

                var index = this.currentIndex + 1;

                if (index > this.length) {
                    index = 1;
                }
                this.slide(Direction.NEXT, index);
            }
        }, {
            key: 'to',
            value: function to(index) {
                var _this = this;

                if (index > this.length || index < 0) {
                    return;
                }

                if (this.isSliding) {
                    return this.$element.one('slide', function () {
                        _this.to(index);
                    });
                }

                if (this.currentIndex === index) {
                    this.pause();
                    this.cycle();
                    return;
                }
                var direction = index > this.currentIndex ? Direction.NEXT : Direction.PREV;
                this.slide(direction, index);
            }
        }, {
            key: 'slide',
            value: function slide(direction, index) {
                var _this = this;
                var $items = this.$element.find(Selector.ITEM);
                var $currentItem = $items.eq(this.currentIndex - 1);
                var $nextItem = $items.eq(index - 1);
                var isCycling = this.timer;

                if ($nextItem.hasClass('active')) return this.isSliding = false;

                var directionalClassName = void 0;
                var orderClassName = void 0;
                var eventDirectionName = void 0;

                if (direction === Direction.NEXT) {
                    directionalClassName = ClassName.LEFT;
                    orderClassName = ClassName.NEXT;
                    eventDirectionName = Direction.LEFT;
                } else {
                    directionalClassName = ClassName.RIGHT;
                    orderClassName = ClassName.PREV;
                    eventDirectionName = Direction.RIGHT;
                }
                this.isSliding = true;
                isCycling && this.pause();

                $nextItem.addClass(orderClassName);
                $nextItem[0].offsetWidth; // force reflow

                $currentItem.addClass(directionalClassName);
                $nextItem.addClass(directionalClassName);

                $currentItem.one("webkitTransitionEnd", function () {
                    $nextItem.removeClass([directionalClassName, orderClassName].join(' ')).addClass(ClassName.ACTIVE);
                    $currentItem.removeClass([ClassName.ACTIVE, orderClassName, directionalClassName].join(' '));
                    _this.isSliding = false;
                    setTimeout(function () {}, 0);
                }).emulateTransitionEnd(TRANSITION_DURATION);

                if (this.settings.enableIndicator) {
                    this.setActiveIndicator(index);
                }
                this.currentIndex = index;
                isCycling && this.cycle();
                return this;
            }
        }, {
            key: 'setActiveIndicator',
            value: function setActiveIndicator(index) {
                this.$indicators.eq(this.currentIndex - 1).removeClass("active");
                this.$indicators.eq(index - 1).addClass("active");
            }
        }, {
            key: 'pause',
            value: function pause() {
                this.isPaused = true;

                if (this.$element.find([ClassName.NEXT, ClassName.PREV].join(",")).length) {
                    this.$element.trigger("webkitTransitionEnd");
                    this.cycle(true);
                }
                clearInterval(this.timer);
            }
        }, {
            key: 'dispose',
            value: function dispose() {
                this.$element.off(EVENT_KEY).removeData(DATA_KEY);
                this.isPaused = null;
                this.isSliding = null;
                this.timer = null;
                this.$indicatorList && this.$indicatorList.remove();
                this.$pre && this.$pre.remove();
                this.$next && this.$next.remove();
            }
        }], [{
            key: '_jQueryInterface',
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new Slider(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: 'DefaultSettings',
            get: function get() {
                return {
                    interval: 5000,
                    slide: true,
                    enableIndicator: true,
                    enableControl: true,
                    autoInitialize: true
                };
            }
        }, {
            key: 'VERSION',
            get: function get() {
                return VERSION;
            }
        }]);

        return Slider;
    }();

    $.fn[NAME] = Slider._jQueryInterface;
    $.fn[NAME].Constructor = Slider;
    return Slider;
}(_jquery2.default);
exports.default = Slider;

/***/ }),
/* 45 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _util = __webpack_require__(1);

var _util2 = _interopRequireDefault(_util);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Tab = function ($) {
    var NAME = 'tab';
    var VERSION = '1.0.1';
    var DATA_KEY = 'canknow.tab';
    var EVENT_KEY = "." + DATA_KEY;
    var DATA_API_KEY = '.data-api';
    var TRANSITION_DURATION = 150;

    var Event = {
        HIDE: "hide" + EVENT_KEY,
        HIDDEN: "hidden" + EVENT_KEY,
        SHOW: "show" + EVENT_KEY,
        SHOWN: "shown" + EVENT_KEY,
        CLICK: "click" + EVENT_KEY,
        CLICK_DATA_API: "click" + EVENT_KEY + DATA_API_KEY
    };
    var ClassName = {
        ACTIVE: 'actived',
        DISABLED: 'disabled',
        FADE: 'fade',
        SHOW: 'show'
    };
    var Selector = {
        NAV_LIST_GROUP: '.tab-nav-list',
        ACTIVE: '.actived'
    };

    var defaultSettings = {};

    var Tab = function () {
        function Tab(element, options) {
            _classCallCheck(this, Tab);

            this.element = element;
            this.$element = $(element);
            this.$navList = this.$element.find(Selector.NAV_LIST_GROUP);
            this.$tabPages = this.$element.find(".tab-page");
            this.settings = $.extend({}, Tab.DefaultSettings, options);
            this._initialize();
        }

        _createClass(Tab, [{
            key: "_initialize",
            value: function _initialize() {
                var $activeNavItems = this.$navList.find(Selector.ACTIVE);
                var index = 0;

                if ($activeNavItems.length) {
                    index = this.$navList.find("li").index($activeNavItems);
                } else {
                    this.$navList.find("li").eq(index).addClass(ClassName.SHOW).addClass(ClassName.ACTIVE);
                }
                this.$tabPages.eq(index).addClass(ClassName.SHOW).addClass(ClassName.ACTIVE);
                this._bindEvent();
            }
        }, {
            key: "_bindEvent",
            value: function _bindEvent() {
                var _this = this;
                this.$navList.find("li").on(Event.CLICK, function () {
                    _this.show(this);
                });
            }
        }, {
            key: "show",
            value: function show(trigger) {
                var _this2 = this;

                if ($(trigger).hasClass(ClassName.ACTIVE) || $(trigger).hasClass(ClassName.DISABLED)) {
                    return;
                }
                var target = void 0;
                var previous = void 0;
                var index = this.$navList.find("li").index(trigger);
                target = this.$tabPages.get(index);
                previous = $.makeArray(this.$navList.find(Selector.ACTIVE));
                previous = previous[previous.length - 1];

                var hideEvent = $.Event(Event.HIDE, {
                    relatedTarget: trigger
                });
                var showEvent = $.Event(Event.SHOW, {
                    relatedTarget: previous
                });

                if (previous) {
                    $(previous).trigger(hideEvent);
                }
                $(target).trigger(showEvent);

                if (showEvent.isDefaultPrevented() || hideEvent.isDefaultPrevented()) {
                    return;
                }
                this._activate(trigger, this.$navList[0]);

                var complete = function complete() {
                    var hiddenEvent = $.Event(Event.HIDDEN, {
                        relatedTarget: trigger
                    });
                    var shownEvent = $.Event(Event.SHOWN, {
                        relatedTarget: previous
                    });
                    $(previous).trigger(hiddenEvent);
                    _this2.$element.trigger(shownEvent);
                };

                if (target) {
                    this._activate(target, target.parentNode, complete);
                } else {
                    complete();
                }
            }
        }, {
            key: "_activate",
            value: function _activate(target, container, callback) {
                var _this3 = this;

                var active = $(container).find(Selector.ACTIVE)[0];
                var isTransitioning = _util2.default.supportsTransitionEnd();
                var complete = function complete() {
                    return _this3._transitionComplete(target, active, isTransitioning, callback);
                };

                if (active && isTransitioning) {
                    $(active).one(_util2.default.TRANSITION_END, complete).emulateTransitionEnd(TRANSITION_DURATION);
                } else {
                    complete();
                }

                if (active) {
                    $(active).removeClass(ClassName.SHOW);
                }
            }
        }, {
            key: "_transitionComplete",
            value: function _transitionComplete(target, active, isTransitioning, callback) {

                if (active) {
                    $(active).removeClass(ClassName.ACTIVE);
                    active.setAttribute('aria-expanded', false);
                }
                $(target).addClass(ClassName.ACTIVE);
                target.setAttribute('aria-expanded', true);

                if (isTransitioning) {
                    _util2.default.reflow(target);
                    $(target).addClass(ClassName.SHOW);
                }

                if (callback) {
                    callback();
                }
            }
        }], [{
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new Tab(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "VERSION",
            get: function get() {
                return VERSION;
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return defaultSettings;
            }
        }]);

        return Tab;
    }();

    $.fn[NAME] = Tab._jQueryInterface;
    $.fn[NAME].Constructor = Tab;
    return Tab;
}(_jquery2.default);
exports.default = Tab;

/***/ }),
/* 46 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

var _common = __webpack_require__(47);

var _common2 = _interopRequireDefault(_common);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Table = function ($) {
    var NAME = 'table';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.table';

    var defaultSettings = {
        title: null,
        paging: false,
        simplePaging: false,
        pageSize: 10,
        pageSizes: [10, 25, 50, 100, 250, 500],
        pageLength: 3,
        sorting: true,
        multiSorting: true,
        defaultSorting: '',
        initializeLoad: true,
        saveUserPreferences: false,
        pageSizeChangeArea: true,
        gotoPageArea: 'combobox', //possible values: 'textbox', 'combobox', 'none'
        onInitializeLoadSuccess: null,
        texts: {
            pagingInfo: 'Showing {0}-{1} of {2}',
            pageSizeChangeLabel: 'Row count',
            gotoPageLabel: 'Go to page'
        },
        actions: {
            listAction: null,
            get: function get(sortParam, currentPageIndex, pageSize) {},
            delete: function _delete() {},
            add: function add() {}
        },
        fields: {}
    };

    var Table = function () {
        function Table(element, options) {
            _classCallCheck(this, Table);

            this.element = element;
            this.$element = $(element);
            this.settings = $.extend({}, Table.DefaultSettings, options);
            this.lastSorting = [];
            this.currentPageIndex = 1;
            this.totalCount = 0;
            this.parameters = {};
            this.$bottomPanel = null; //Reference to the panel at the bottom of the table (jQuery object)
            this.$paginationList = null;
            this.$pageSizeChangeArea = null; //Reference to the page size change area in to bottom panel (jQuery object)
            this.$pageInfoSpan = null; //Reference to the paging info area in to bottom panel (jQuery object)
            this.$gotoPageArea = null; //Reference to 'Go to page' input area in to bottom panel (jQuery object)
            this.$gotoPageInput = null; //Reference to 'Go to page' input in to bottom panel (jQuery object)
            this.firstLoad = true;
            this.initialize();
        }

        _createClass(Table, [{
            key: "initialize",
            value: function initialize() {
                this.buildDefaultSortingArray();
                this.$element.addClass("table-sorting");
                this.create();
                this.cookieKeyPrefix = this.generateCookieKeyPrefix();

                if (this.settings.initializeLoad) {
                    this.reloadTable();
                }
            }
        }, {
            key: "create",
            value: function create() {
                this.createHeader();

                if (this.settings.paging) {
                    this.createBottomPanel();
                    this.createPaginationList();

                    if (!this.settings.simplePaging) {
                        this.createGotoPageInput();
                        this.createPageSizeSelection();
                    }
                }
            }
        }, {
            key: "load",
            value: function load(postData, onSuccess) {
                this.parameters = postData;
                this.reloadTable(onSuccess);
            }
        }, {
            key: "reloadTable",
            value: function reloadTable(onSuccess, onComplete) {
                var _this = this;
                var parameters = {
                    sorting: this.createSortParamForLoading(),
                    pageIndex: this.currentPageIndex,
                    pageSize: this.settings.pageSize
                };

                if (this.parameters) {
                    parameters = $.extend(parameters, this.parameters);
                }

                if (this.settings.actions.listAction.parameters) {
                    parameters = $.extend(parameters, this.settings.actions.listAction.parameters);
                }
                var $tableContainer = this.$element.closest(".responsive-table-container").addClass("mask loader-wraper dark");
                var $loading = $('<div class="loader text">Loading</div>').appendTo($tableContainer);

                this.settings.actions.listAction.beforeCallback && this.settings.actions.listAction.beforeCallback.call(this);
                this.settings.actions.listAction.method(parameters).success(function (result) {
                    _this.settings.actions.listAction.callback(result) && _this.settings.actions.listAction.callback.call(_this);

                    if (_this.settings.actions.listAction.getTotalCountFromResult) {
                        _this.totalCount = _this.settings.actions.listAction.getTotalCountFromResult(result);
                    } else {
                        _this.totalCount = result.totalCount;
                    }
                    _this.onRecordsLoaded.call(_this);

                    if (onSuccess) {
                        onSuccess.call(this, result);
                    }
                    $tableContainer.removeClass("mask loader-wraper dark");
                    $loading.remove();

                    if (_this.firstLoad) {

                        if (_this.settings.onInitializeLoadSuccess) {
                            _this.settings.onInitializeLoadSuccess.call(this, result);
                        }
                        _this.firstLoad = false;
                    }
                }).finally(function () {

                    if (onComplete) {
                        onComplete.call(this);
                    }
                });
            }
        }, {
            key: "buildDefaultSortingArray",
            value: function buildDefaultSortingArray() {
                var _this = this;
                $.each(_this.settings.defaultSorting.split(","), function (orderIndex, orderValue) {

                    $.each(_this.settings.fields, function (fieldName, fieldProps) {

                        if (fieldProps.sorting) {
                            var colOffset = orderValue.indexOf(fieldName);

                            if (colOffset > -1) {

                                if (orderValue.toUpperCase().indexOf(' DESC', colOffset) > -1) {
                                    _this.lastSorting.push({
                                        fieldName: fieldName,
                                        sortOrder: 'DESC'
                                    });
                                } else {
                                    _this.lastSorting.push({
                                        fieldName: fieldName,
                                        sortOrder: 'ASC'
                                    });
                                }
                            }
                        }
                    });
                });
            }
        }, {
            key: "createHeader",
            value: function createHeader() {
                var _this = this;
                var $ths = this.$element.find("thead th[data-fieldname]");

                $ths.each(function (index, th) {
                    _this.makeColumnSortable($(th), th.dataset["fieldname"]);
                });
            }
        }, {
            key: "makeColumnSortable",
            value: function makeColumnSortable($columnHeader, fieldName) {
                var _this = this;

                $columnHeader.data("fieldName", fieldName).addClass('table-column-header-sortable').click(function (e) {
                    e.preventDefault();

                    if (!_this.settings.multiSorting || !e.ctrlKey) {
                        _this.lastSorting = []; //clear previous sorting
                    }
                    _this.sortTableByColumn($columnHeader);
                });

                //Set default sorting
                $.each(this.lastSorting, function (sortIndex, sortField) {

                    if (sortField.fieldName == fieldName) {

                        if (sortField.sortOrder == 'DESC') {
                            $columnHeader.addClass('table-column-header-sorted-desc');
                        } else {
                            $columnHeader.addClass('table-column-header-sorted-asc');
                        }
                    }
                });
            }
        }, {
            key: "sortTableByColumn",
            value: function sortTableByColumn($columnHeader) {
                //Remove sorting styles from all columns except this one
                if (this.lastSorting.length == 0) {
                    $columnHeader.siblings().removeClass('table-column-header-sorted-asc table-column-header-sorted-desc');
                }

                //If current sorting list includes this column, remove it from the list
                for (var i = 0; i < this.lastSorting.length; i++) {

                    if (this.lastSorting[i].fieldName == $columnHeader.data('fieldName')) {
                        this.lastSorting.splice(i--, 1);
                    }
                }

                //Sort ASC or DESC according to current sorting state
                if ($columnHeader.hasClass('table-column-header-sorted-asc')) {
                    $columnHeader.removeClass('table-column-header-sorted-asc').addClass('table-column-header-sorted-desc');
                    this.lastSorting.push({
                        'fieldName': $columnHeader.data('fieldName'),
                        sortOrder: 'DESC'
                    });
                } else {
                    $columnHeader.removeClass('table-column-header-sorted-desc').addClass('table-column-header-sorted-asc');
                    this.lastSorting.push({
                        'fieldName': $columnHeader.data('fieldName'),
                        sortOrder: 'ASC'
                    });
                }

                //Load current page again
                this.reloadTable();
            }
        }, {
            key: "addSortParamToUrl",
            value: function addSortParamToUrl(url) {
                if (!this.settings.sorting || this.lastSorting.length == 0) {
                    return url;
                }
                var sorting = [];

                $.each(this.lastSorting, function (idx, value) {
                    sorting.push(value.fieldName + ' ' + value.sortOrder);
                });
                return url + (url.indexOf('?') < 0 ? '?' : '&') + 'sorting=' + sorting.join(",");
            }
        }, {
            key: "createSortParamForLoading",
            value: function createSortParamForLoading() {
                var sortParam = '';

                if (this.settings.sorting && this.lastSorting.length) {
                    var sorting = [];

                    $.each(this.lastSorting, function (idx, value) {
                        sorting.push(value.fieldName + ' ' + value.sortOrder);
                    });
                    sortParam = sorting.join(",");
                }
                return sortParam;
            }
        }, {
            key: "simpleHash",
            value: function simpleHash(value) {
                var hash = 0;

                if (value.length == 0) {
                    return hash;
                }
                for (var i = 0; i < value.length; i++) {
                    var ch = value.charCodeAt(i);
                    hash = (hash << 5) - hash + ch;
                    hash = hash & hash;
                }
                return hash;
            }
        }, {
            key: "generateCookieKeyPrefix",
            value: function generateCookieKeyPrefix() {
                var strToHash = '';

                if (this.settings.tableId) {
                    strToHash = strToHash + this.options.tableId + '#';
                }
                strToHash = strToHash + this.$element.find('thead th').length;
                return 'table#' + this.simpleHash(strToHash);
            }
        }, {
            key: "setCookie",
            value: function setCookie(key, value) {
                key = this.cookieKeyPrefix + key;
                var expireDate = new Date();
                expireDate.setDate(expireDate.getDate() + 30);
                document.cookie = encodeURIComponent(key) + '=' + encodeURIComponent(value) + "; expires=" + expireDate.toUTCString();
            }
        }, {
            key: "getCookie",
            value: function getCookie(key) {
                key = this.cookieKeyPrefix + key;
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
            }
        }, {
            key: "onRecordsLoaded",
            value: function onRecordsLoaded(data) {
                if (this.settings.paging) {
                    this.createPagination();

                    if (!this.settings.simplePaging) {
                        this.refreshGotoPageInput();
                        this.createPagingInfo();
                    }
                }
            }
        }, {
            key: "createBottomPanel",
            value: function createBottomPanel() {
                this.$bottomPanel = $('<div />').addClass('table-bottom-panel').insertAfter(this.$element);
                $('<div/>').addClass('table-left-area').appendTo(this.$bottomPanel);
                $('<div/>').addClass('table-right-area').appendTo(this.$bottomPanel);
            }
        }, {
            key: "createPagingInfo",
            value: function createPagingInfo() {
                if (this.totalCount <= 0) {
                    this.$pageInfoSpan.empty();
                    return;
                }
                var startNo = (this.currentPageIndex - 1) * this.settings.pageSize + 1;
                var endNo = this.currentPageIndex * this.settings.pageSize;
                endNo = normalizeNumber(endNo, startNo, this.totalCount, 0);

                if (endNo >= startNo) {
                    var pagingInfoMessage = formatString(this.settings.texts.pagingInfo, startNo, endNo, this.totalCount);
                    this.$pageInfoSpan.html(pagingInfoMessage);
                }
            }
        }, {
            key: "createPaginationList",
            value: function createPaginationList() {
                if (!this.settings.simplePaging) {
                    this.$pageInfoSpan = $('<span></span>').addClass('pagination-info').appendTo(this.$bottomPanel.find('.table-right-area'));
                }
                var $paginationContainer = $("<div>").addClass("pagination-container").appendTo(this.$bottomPanel.find('.table-right-area'));

                if (this.settings.simplePaging) {
                    $paginationContainer.addClass("simple-paging");
                }
                this.$paginationList = $("<ul>").addClass("pagination").appendTo($paginationContainer);
            }
        }, {
            key: "savePagingSettings",
            value: function savePagingSettings() {
                if (!this.settings.saveUserPreferences) {
                    return;
                }
                this.setCookie('pageSize', this.settings.pageSize);
            }
        }, {
            key: "calculatePageCount",
            value: function calculatePageCount() {
                return Math.ceil(this.totalCount / this.settings.pageSize);
            }
        }, {
            key: "changePageSize",
            value: function changePageSize(pageSize) {
                if (pageSize == this.settings.pageSize) {
                    return;
                }
                this.settings.pageSize = pageSize;
                var pageCount = this.calculatePageCount();

                if (this.currentPageIndex > pageCount) {
                    this.currentPageIndex = pageCount;
                }

                if (this.currentPageIndex <= 0) {
                    this.currentPageIndex = 1;
                }
                this.savePagingSettings();
                this.reloadTable();
            }
        }, {
            key: "createPagination",
            value: function createPagination() {
                this.$paginationList.empty();
                var pageCount = this.calculatePageCount();

                if (pageCount <= 1) {
                    return;
                }
                var previousPageNo = normalizeNumber(this.currentPageIndex - 1, 1, pageCount, 1);
                var nextPageNo = normalizeNumber(this.currentPageIndex + 1, 1, pageCount, 1);

                var startIndex = normalizeNumber(this.currentPageIndex - this.settings.pageLength, 1, pageCount, 1);
                var endIndex = normalizeNumber(this.currentPageIndex + this.settings.pageLength, 1, pageCount, 1);

                this.createFirstPaginationItem();
                this.createPrePaginationItem();

                for (var i = startIndex; i <= endIndex; i++) {
                    this.createPaginationItem(i);
                }
                this.createNextPaginationItem(pageCount);
                this.createLastPaginationItem(pageCount);
            }
        }, {
            key: "createFirstPaginationItem",
            value: function createFirstPaginationItem() {
                var _this = this;
                var $paginationItem = $('<li></li>').append($("<a>").text("<<")).appendTo(this.$paginationList);

                if (this.currentPageIndex == 1) {
                    $paginationItem.attr("disabled", true);
                } else {
                    $paginationItem.click(function (e) {
                        e.preventDefault();
                        _this.changePage(1);
                    });
                }
            }
        }, {
            key: "createPrePaginationItem",
            value: function createPrePaginationItem() {
                var _this = this;
                var $paginationItem = $('<li></li>').append($("<a>").text("<")).appendTo(this.$paginationList);

                if (_this.currentPageIndex == 1) {
                    $paginationItem.attr("disabled", true);
                } else {
                    $paginationItem.click(function (e) {
                        e.preventDefault();
                        _this.changePage(_this.currentPageIndex - 1);
                    });
                }
            }
        }, {
            key: "createPaginationItem",
            value: function createPaginationItem(pageIndex) {
                var _this = this;
                var $paginationItem = $('<li></li>').append($("<a>").text(pageIndex)).data('pageIndex', pageIndex).appendTo(this.$paginationList).click(function (e) {
                    e.preventDefault();
                    _this.changePage($(this).data('pageIndex'));
                });

                if (this.currentPageIndex == pageIndex) {
                    $paginationItem.addClass('current');
                }
            }
        }, {
            key: "createNextPaginationItem",
            value: function createNextPaginationItem(pageCount) {
                var _this = this;
                var $paginationItem = $('<li></li>').append($("<a>").text(">")).appendTo(this.$paginationList);

                if (_this.currentPageIndex >= pageCount) {
                    $paginationItem.attr("disabled", true);
                } else {
                    $paginationItem.click(function (e) {
                        e.preventDefault();
                        _this.changePage(_this.currentPageIndex + 1);
                    });
                }
            }
        }, {
            key: "createLastPaginationItem",
            value: function createLastPaginationItem(pageCount) {
                var _this = this;
                var $paginationItem = $('<li></li>').append($("<a>").text(">>")).appendTo(this.$paginationList);

                if (_this.currentPageIndex >= pageCount) {
                    $paginationItem.attr("disabled", true);
                } else {
                    $paginationItem.click(function (e) {
                        e.preventDefault();
                        _this.changePage(pageCount);
                    });
                }
            }
        }, {
            key: "createGotoPageInput",
            value: function createGotoPageInput() {
                var _this = this;

                if (!_this.settings.gotoPageArea || _this.settings.gotoPageArea == 'none') {
                    return;
                }

                //Add a span to contain goto page items
                this.$gotoPageArea = $('<span></span>').addClass('table-goto-page').appendTo(_this.$bottomPanel.find('.table-left-area'));

                //Goto page label
                this.$gotoPageArea.append('<span>' + _this.settings.texts.gotoPageLabel + ': </span>');

                //Goto page input
                if (_this.settings.gotoPageArea == 'combobox') {
                    _this.$gotoPageInput = $('<select></select>').appendTo(this.$gotoPageArea).data('pageCount', 1).change(function () {
                        _this.changePage(parseInt($(this).val()));
                    });
                    _this.$gotoPageInput.append('<option value="1">1</option>');
                } else {
                    //textbox
                    _this.$gotoPageInput = $('<input type="text" maxlength="10" value="' + _this.currentPageIndex + '" />').appendTo(this.$gotoPageArea).keypress(function (event) {

                        if (event.which == 13) {
                            //enter
                            event.preventDefault();
                            _this.changePage(parseInt(_this.$gotoPageInput.val()));
                        } else if (event.which == 43) {
                            // +
                            event.preventDefault();
                            _this.changePage(parseInt(_this.$gotoPageInput.val()) + 1);
                        } else if (event.which == 45) {
                            // -
                            event.preventDefault();
                            _this.changePage(parseInt(_this.$gotoPageInput.val()) - 1);
                        } else {
                            //Allow only digits
                            var isValid = 47 < event.keyCode && event.keyCode < 58 && event.shiftKey == false && event.altKey == false || event.keyCode == 8 || event.keyCode == 9;

                            if (!isValid) {
                                event.preventDefault();
                            }
                        }
                    });
                }
            }
        }, {
            key: "refreshGotoPageInput",
            value: function refreshGotoPageInput() {
                if (!this.settings.gotoPageArea || this.settings.gotoPageArea == 'none') {
                    return;
                }

                if (this.totalCount <= 0) {
                    this.$gotoPageArea.hide();
                } else {
                    this.$gotoPageArea.show();
                }

                if (this.settings.gotoPageArea == 'combobox') {
                    var oldPageCount = this.$gotoPageInput.data('pageCount');
                    var currentPageCount = this.calculatePageCount();

                    if (oldPageCount != currentPageCount) {
                        this.$gotoPageInput.empty();

                        //Skip some pages is there are too many pages
                        var pageStep = 1;

                        if (currentPageCount > 10000) {
                            pageStep = 100;
                        } else if (currentPageCount > 5000) {
                            pageStep = 10;
                        } else if (currentPageCount > 2000) {
                            pageStep = 5;
                        } else if (currentPageCount > 1000) {
                            pageStep = 2;
                        }

                        for (var i = pageStep; i <= currentPageCount; i += pageStep) {
                            this.$gotoPageInput.append('<option value="' + i + '">' + i + '</option>');
                        }
                        this.$gotoPageInput.data('pageCount', currentPageCount);
                    }
                }

                //same for 'textbox' and 'combobox'
                this.$gotoPageInput.val(this.currentPageIndex);
            }
        }, {
            key: "createPageSizeSelection",
            value: function createPageSizeSelection() {
                var _this = this;

                if (!_this.settings.pageSizeChangeArea) {
                    return;
                }

                //Add current page size to page sizes list if not contains it
                if (_this.findIndexInArray(_this.settings.pageSize, _this.settings.pageSizes) < 0) {
                    _this.settings.pageSizes.push(parseInt(_this.settings.pageSize));
                    _this.settings.pageSizes.sort(function (a, b) {
                        return a - b;
                    });
                }

                //Add a span to contain page size change items
                _this.$pageSizeChangeArea = $('<span></span>').addClass('table-page-size-change').appendTo(_this.$bottomPanel.find('.table-left-area'));

                //Page size label
                _this.$pageSizeChangeArea.append('<span>' + _this.settings.texts.pageSizeChangeLabel + ': </span>');

                //Page size change combobox
                var $pageSizeChangeCombobox = $('<select></select>').appendTo(_this.$pageSizeChangeArea);

                //Add page sizes to the combobox
                for (var i = 0; i < _this.settings.pageSizes.length; i++) {
                    $pageSizeChangeCombobox.append('<option value="' + _this.settings.pageSizes[i] + '">' + _this.settings.pageSizes[i] + '</option>');
                }

                //Select current page size
                $pageSizeChangeCombobox.val(_this.settings.pageSize);

                //Change page size on combobox change
                $pageSizeChangeCombobox.change(function () {
                    _this.changePageSize(parseInt($(this).val()));
                });
            }
        }, {
            key: "calculatePageNumbers",
            value: function calculatePageNumbers(pageCount) {
                if (pageCount <= 4) {
                    var pageNumbers = [];

                    for (var i = 1; i <= pageCount; ++i) {
                        pageNumbers.push(i);
                    }
                    return pageNumbers;
                } else {
                    var shownPageNumbers = [1, 2, pageCount - 1, pageCount];
                    var previousPageNo = normalizeNumber(this.currentPageIndex - 1, 1, pageCount, 1);
                    var nextPageNo = normalizeNumber(this.currentPageIndex + 1, 1, pageCount, 1);

                    this.insertToArrayIfDoesNotExists(shownPageNumbers, previousPageNo);
                    this.insertToArrayIfDoesNotExists(shownPageNumbers, this.currentPageIndex);
                    this.insertToArrayIfDoesNotExists(shownPageNumbers, nextPageNo);

                    shownPageNumbers.sort(function (a, b) {
                        return a - b;
                    });
                    return shownPageNumbers;
                }
            }
        }, {
            key: "changePage",
            value: function changePage(pageIndex) {
                pageIndex = normalizeNumber(pageIndex, 1, this.calculatePageCount(), 1);

                if (pageIndex == this.currentPageIndex) {
                    this.refreshGotoPageInput && this.refreshGotoPageInput();
                    return;
                }
                this.currentPageIndex = pageIndex;
                this.reloadTable();
            }
        }, {
            key: "findIndexInArray",
            value: function findIndexInArray(value, array, compareFunc) {
                //If not defined, use default comparision
                if (!compareFunc) {

                    compareFunc = function compareFunc(a, b) {
                        return a == b;
                    };
                }

                for (var i = 0; i < array.length; i++) {

                    if (compareFunc(value, array[i])) {
                        return i;
                    }
                }
                return -1;
            }
        }], [{
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new Table(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "DefaultSettings",
            get: function get() {
                return defaultSettings;
            },
            set: function set(value) {
                defaultSettings = value;
            }
        }]);

        return Table;
    }();

    $.fn[NAME] = Table._jQueryInterface;
    $.fn[NAME].Constructor = Table;
    window.Table = Table;
    return Table;
}(_jquery2.default);
exports.default = Table;

/***/ }),
/* 47 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});
var CommonLibs = function () {
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);

        if (r != null) return unescape(r[2]);
    }

    function GetUrlRelativePath() {
        var url = document.location.toString();
        var arrUrl = url.split("//");

        var start = arrUrl[1].indexOf("/");
        var relUrl = arrUrl[1].substring(start);

        if (relUrl.indexOf("?") != -1) {
            relUrl = relUrl.split("?")[0];
        }
        return relUrl;
    }

    function parsePath(path) {
        var pathItems = path.split("/");
        return pathItems;
    }

    function normalizeNumber(number, min, max, defaultValue) {

        if (number == undefined || number == null || isNaN(number)) {
            return defaultValue;
        }

        if (number < min) {
            return min;
        }

        if (number > max) {
            return max;
        }
        return number;
    }

    /* Formats a string just like string.format in c#.
     *  Example:
     *  formatString('Hello {0}','Halil') = 'Hello Halil'
     *************************************************************************/
    function formatString() {

        if (arguments.length == 0) {
            return null;
        }
        var str = arguments[0];

        for (var i = 1; i < arguments.length; i++) {
            var placeHolder = '{' + (i - 1) + '}';
            str = str.replace(placeHolder, arguments[i]);
        }
        return str;
    }
    window.GetUrlRelativePath = GetUrlRelativePath;
    window.GetQueryString = GetQueryString;
    window.parsePath = parsePath;
    window.normalizeNumber = normalizeNumber;
    window.formatString = formatString;

    return {
        GetUrlRelativePath: GetUrlRelativePath,
        GetQueryString: GetQueryString,
        parsePath: parsePath,
        normalizeNumber: normalizeNumber,
        formatString: formatString
    };
}();
exports.default = CommonLibs;

/***/ }),
/* 48 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var TurnLigth = function ($) {
    $.fn.turnOffLight = function () {
        var lightOverlay = $("<div>").addClass("light-overlay").appendTo(document.body);
        this.addClass("light-target");
    };
    $.fn.turnOnLight = function () {
        $(".light-overlay").remove();
        this.removeClass("light-target");
    };
}(_jquery2.default);
exports.default = TurnLigth;

/***/ }),
/* 49 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _validateCore = __webpack_require__(4);

var _inputValidate = __webpack_require__(11);

var _inputValidate2 = _interopRequireDefault(_inputValidate);

var _formValidate = __webpack_require__(50);

var _formValidate2 = _interopRequireDefault(_formValidate);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

exports.default = {
    ValidateStatus: _validateCore.ValidateStatus,
    Validators: _validateCore.Validators,
    Validator: _validateCore.Validator,
    InputValidate: _inputValidate2.default,
    FormValidate: _formValidate2.default
};

/***/ }),
/* 50 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _validateCore = __webpack_require__(4);

var _inputValidate = __webpack_require__(11);

var _inputValidate2 = _interopRequireDefault(_inputValidate);

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var FormValidate = function ($) {
    var NAME = 'formValidate';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.formValidate';
    var EVENT_KEY = "." + DATA_KEY;

    var FormValidate = function () {
        function FormValidate(element, options) {
            _classCallCheck(this, FormValidate);

            this.element = element;
            this.$element = $(element);

            this.$inputValidates = [];
            this.status = 0; //0未验证，1通过验证，-1验证失败,2验证中
            this.settings = $.extend({}, FormValidate.DefaultSettings, options);

            this.submiting = false;
            this.autoSubmit = false;
            this.initialized = false;
            this.promises = [];
            this.initialize();
        }

        _createClass(FormValidate, [{
            key: "initialize",
            value: function initialize() {
                var _this = this;

                // Add novalidate tag if HTML5.
                this.$element.attr("novalidate", "novalidate");
                this.$buttonSubmit = this.$element.find("[type='submit']").on("click", function (event) {
                    _this.submit.call(_this, event);
                    event.stopPropagation();
                    return false;
                });
                _this.$element.submit(function (event) {
                    return _this.submitForm.call(_this, event);
                });
                this.settings.errorShowMode = this.$element[0].dataset.errorModel ? this.$element[0].dataset.errorModel : this.settings.errorShowMode;
                this.settings.lockSubmitHandler = this.$element[0].dataset.lockSubmitHandler ? this.$element[0].dataset.lockSubmitHandler : this.settings.lockSubmitHandler;
                var $dataValidates = this.$element.find('[data-validate]');
                $dataValidates.each(function () {
                    var $element = $(this);
                    _this.$inputValidates.push($element.inputValidate({
                        validators: _this.settings.validators,
                        highlight: _this.settings.highlight,
                        unhighlight: _this.settings.unhighlight,
                        errorShowMode: _this.settings.errorShowMode,
                        errorClass: _this.settings.errorClass,
                        onValid: function onValid() {
                            _this.onValid.call(_this);
                        },
                        onInValid: function onInValid() {
                            _this.onInvalid.call(_this);
                        }
                    }));
                });

                if (this.settings.lockSubmitHandler) {
                    this.disableGo();
                }
                this.initialized = true;
            }
        }, {
            key: "onInvalid",
            value: function onInvalid() {
                this.status = _validateCore.ValidateStatus.inValid;

                if (this.settings.lockSubmitHandler) {
                    this.disableGo();
                }
            }
        }, {
            key: "onValid",
            value: function onValid() {
                this.status = _validateCore.ValidateStatus.valid;

                if (this.settings.lockSubmitHandler) {
                    this.enableGo();
                }

                if (this.autoSubmit) {
                    this.submitForm();
                    this.autoSubmit = false;
                }
            }
        }, {
            key: "getData",
            value: function getData() {
                return this.$element.serializeObject();
            }
        }, {
            key: "submitForm",
            value: function submitForm() {

                if (this.submiting) {
                    return false;
                }
                this.setLoading();

                if (this.settings.onsubmit) {
                    this.settings.onsubmit.call(this, this.$element[0], event);
                    return false;
                }
                this.$element.get(0).submit();
                return false;
            }
        }, {
            key: "submit",
            value: function submit() {

                if (this.validate(true)) {
                    this.submitForm();
                }
            }
        }, {
            key: "disableGo",
            value: function disableGo() {
                this.$buttonSubmit.attr("disabled", true);
                return this;
            }
        }, {
            key: "enableGo",
            value: function enableGo() {
                if (!this.submiting) {
                    this.$buttonSubmit.attr("disabled", false);
                }
                return this;
            }
        }, {
            key: "setLoading",
            value: function setLoading() {
                this.submiting = true;
                this.$buttonSubmit.addClass("button-loading").attr("disabled", true);
                return this;
            }
        }, {
            key: "clearLoading",
            value: function clearLoading() {
                this.submiting = false;
                this.$buttonSubmit.removeClass("button-loading").attr("disabled", false);
                return this;
            }
        }, {
            key: "validate",
            value: function validate(autoSubmit) {
                var _this = this;

                if (this.$inputValidates.length == 0) {
                    this.onValid();
                    return true;
                }
                var toValidates = [];
                this.promises = [];

                for (var i = 0; i < this.$inputValidates.length; i++) {
                    var $inputValidate = this.$inputValidates[i];

                    if ($inputValidate.status == _validateCore.ValidateStatus.toValid) {
                        toValidates.push(this.$inputValidates[i]);
                    } else if ($inputValidate.status == _validateCore.ValidateStatus.inValid) {
                        return false;
                    } else if ($inputValidate.status == _validateCore.ValidateStatus.pending) {
                        this.promises.push($inputValidate.promise);
                    }
                }

                if (autoSubmit) {
                    this.autoSubmit = true;
                }

                if (toValidates.length) {

                    for (var _i = 0; _i < toValidates.length; _i++) {
                        var status = toValidates[_i].validate();

                        if (status === false) {
                            this.onInValid();
                            return false;
                        } else if (status instanceof Object) {
                            this.promises.push(status);
                        }
                    }
                }

                if (this.promises.length) {
                    $.when(this.promises).then(function () {
                        _this.onValid();
                    }, function () {
                        _this.onInvalid();
                    });
                    return false;
                }
                return true;
            }
        }], [{
            key: "setDefaults",
            value: function setDefaults(options) {
                FormValidate.DefaultSettings = $.extend(FormValidate.DefaultSettings, options);
            }
        }, {
            key: "DefaultSettings",
            value: function DefaultSettings() {
                return {
                    debug: false,
                    validators: _validateCore.Validators,
                    errorClass: 'validate-message validate-message-validation-error',
                    highlight: function highlight(element) {},
                    unhighlight: function unhighlight(element) {},
                    onInvalid: function onInvalid() {},
                    onsubmit: null,
                    errorShowMode: 0,
                    lockSubmitHandler: true
                };
            }
        }, {
            key: "_jQueryInterface",
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $this = $(this);
                    var data = $this.data(DATA_KEY);

                    if (!data) {
                        data = new FormValidate(this, options);
                        $this.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: "VERSION",
            get: function get() {
                return VERSION;
            }
        }]);

        return FormValidate;
    }();

    $.fn[NAME] = FormValidate._jQueryInterface;
    $.fn[NAME].Constructor = FormValidate;
    return FormValidate;
}(_jquery2.default);

exports.default = FormValidate;

/***/ }),
/* 51 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _jquery = __webpack_require__(0);

var _jquery2 = _interopRequireDefault(_jquery);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var WebkitNotify = function ($) {
    'use strict';

    var Notification = window.Notification;

    var WebkitNotify = function () {
        function WebkitNotify() {
            _classCallCheck(this, WebkitNotify);

            this._initialize();
        }

        _createClass(WebkitNotify, [{
            key: "_initialize",
            value: function _initialize() {

                if (Notification && Notification.permission !== "granted") {
                    Notification.requestPermission(function (status) {

                        if (Notification.permission !== status) {
                            Notification.permission = status;
                        }
                    });
                }
            }
        }, {
            key: "notification",
            value: function notification(settings) {
                this.settings = $.extend({}, WebkitNotify.DefaultSettings, settings);

                var options = {
                    dir: "ltr",
                    lang: "utf-8",
                    icon: this.settings.icon,
                    body: this.settings.body
                };

                if (Notification && Notification.permission === "granted") {
                    var notification = new Notification(this.settings.title, options);
                    notification.onclick = this.settings.onClick;
                } else if (Notification && Notification.permission !== "denied") {
                    Notification.requestPermission(function (status) {

                        if (Notification.permission !== status) {
                            Notification.permission = status;
                        }

                        if (status === "granted") {
                            var notification = new Notification(this.settings.title, options);
                            notification.onclick = this.settings.onClick;
                        }
                    });
                }
            }
        }], [{
            key: "DefaultSettings",
            get: function get() {
                return {
                    icon: "/Content/WebFrame/image/notificationIcon.png",
                    title: "Notification Title",
                    body: "Notification Body",
                    onClick: function onClick() {}
                };
            }
        }]);

        return WebkitNotify;
    }();

    window.WebkitNotify = WebkitNotify;
    return WebkitNotify;
}(_jquery2.default);
exports.default = WebkitNotify;

/***/ }),
/* 52 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var StyleToggle = function ($) {
    var DATA_API_KEY = '.data-api';
    var NAME = 'styleToggle';
    var VERSION = '4.0.0-alpha.6';
    var DATA_KEY = 'canknow.styleToggle';
    var EVENT_KEY = '.' + DATA_KEY;

    var Event = {
        HIDE: 'hide' + EVENT_KEY,
        SHOW: 'show' + EVENT_KEY,
        CLICK: 'click' + EVENT_KEY,
        CLICK_DATA_API: 'click' + EVENT_KEY + DATA_API_KEY
    };

    var StyleToggle = function () {
        function StyleToggle(element, options) {
            _classCallCheck(this, StyleToggle);

            this.element = element;
            this.$element = $(element);
            this.settings = $.extend({}, StyleToggle.DefaultSettings, options);
            this.$handlers = $('[data-target="#' + this.element.id + '"]');

            if (this.element.dataset.style) {
                this.settings.style = this.element.dataset.style;
            }

            if (this.settings.handler) {

                if (!this.$handlers.length) {
                    this.$handlers = this.settings.handler;
                } else {
                    this.$handlers.add(this.settings.handler);
                }
            }
            this.bindEvent();
        }

        _createClass(StyleToggle, [{
            key: 'bindEvent',
            value: function bindEvent() {
                var _this = this;
                this.$handlers.on(Event.CLICK_DATA_API, function (event) {
                    _this.toggle.call(_this, event);
                });
            }
        }, {
            key: 'toggle',
            value: function toggle() {
                this.$element.toggleClass(this.settings.style);
                return false;
            }
        }, {
            key: 'dispose',
            value: function dispose() {
                this.$element.off(EVENT_KEY);
                this.$handlers.off(Event.CLICK_DATA_API);
                this.element = null;
            }
        }], [{
            key: '_jQueryInterface',
            value: function _jQueryInterface(options) {
                return this.each(function () {
                    var $element = $(this);
                    var data = $element.data(DATA_KEY);

                    if (!data) {
                        data = new StyleToggle(this, options);
                        $element.data(DATA_KEY, data);
                    }
                });
            }
        }, {
            key: 'DefaultSettings',
            get: function get() {
                return {
                    handler: null,
                    style: "show"
                };
            }
        }]);

        return StyleToggle;
    }();

    $.fn[NAME] = StyleToggle._jQueryInterface;
    $.fn[NAME].Constructor = StyleToggle;
    return StyleToggle;
}(jQuery);
exports.default = StyleToggle;

/***/ }),
/* 53 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _localization = __webpack_require__(3);

var _localization2 = _interopRequireDefault(_localization);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Canknow = function ($) {
    var Canknow = function () {
        function Canknow() {
            _classCallCheck(this, Canknow);

            this.initialize();
            this.localization = _localization2.default;
        }

        _createClass(Canknow, [{
            key: "startPlugins",
            value: function startPlugins(domElement) {

                if (domElement.dataset && domElement.dataset["ride"]) {
                    this.processElement(domElement);
                }

                //plugin init
                if (domElement.nodeType == 1) {
                    var pluginElements = domElement.querySelectorAll("[data-ride]");

                    for (var i = 0; i < pluginElements.length; i++) {
                        var pluginElement = pluginElements[i];
                        this.processElement(pluginElement);
                    }
                }
            }
        }, {
            key: "processElement",
            value: function processElement(pluginElement) {
                var pluginNames = pluginElement.dataset["ride"].trim().split(" ");

                pluginNames.forEach(function (pluginName) {

                    if (!pluginElement[pluginName] && $.fn[pluginName]) {
                        $(pluginElement)[pluginName]();
                    }
                });
            }
        }, {
            key: "initialize",
            value: function initialize() {
                var _this = this;
                $(function () {
                    _this.startPlugins(document.body);

                    document.addEventListener("DOMNodeInserted", function (e) {
                        _this.startPlugins(e.target);
                    });
                });
            }
        }]);

        return Canknow;
    }();

    $.canknow = new Canknow();
    return Canknow;
}(jQuery);
exports.default = Canknow;

/***/ })
/******/ ]);