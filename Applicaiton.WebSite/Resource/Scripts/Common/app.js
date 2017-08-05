/// <reference path="H:\Project\Personal\Shop\Applicaiton.WebSite\Content/Infrastructure/Framework/Scripts/infrastructure.js" />
var app = app || {};
(function () {
    var appLocalizationSource = infrastructure.localization.getSource('Application');
    app.localize = function () {
        return appLocalizationSource.apply(this, arguments);
    };
})();