using Application.WebSite.App_Start.Bundling;
using System.Web.Optimization;

namespace Application.WebSite
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.IgnoreList.Clear();

            AddStyleSheets(bundles);
            AddScripts(bundles);

            BundleTable.EnableOptimizations = true;
        }

        private static void AddStyleSheets(BundleCollection bundles)
        {
            bundles.Add(
               new StyleBundle("~/Bundles/Backend/libs.css")
               .Include("~/Scripts/jstree/themes/default/style.css", new CssRewriteUrlWithVirtualDirectoryTransform())
               );

            bundles.Add(
               new StyleBundle("~/Bundles/App/Manager.css")
               .IncludeDirectory("~/Resource/Styles/App/Manager/", "*.css", true).ForceOrdered()
               );

            bundles.Add(
                new StyleBundle("~/Bundles/App/Mobile.css")
                .IncludeDirectory("~/Resource/Styles/App/Mobile/", "*.css", true).ForceOrdered()
                );
        }

        private static void AddScripts(BundleCollection bundles)
        {
            bundles.Add(
                new ScriptBundle("~/Bundles/Frontend/libs.js").Include(
                    "~/Scripts/jquery/jquery-2.1.1.min.js",
                    "~/Scripts/hammer.js",
                    "~/Scripts/underscore.min.js",
                    "~/Scripts/moment.min.js",
                    "~/Scripts/angularJS/angular.min.js",
                    "~/Scripts/angularJS/angular-ui-router.js",
                    "~/Scripts/angularJS/ui/ui-utils.js",
                    "~/Scripts/angularJS/angular-sortable-view.min.js"
                    )
                );

            bundles.Add(
                new ScriptBundle("~/Bundles/Backend/libs.js").Include(
                    "~/Scripts/jquery/jquery-2.1.1.min.js",
                    "~/Scripts/underscore.min.js",
                    "~/Scripts/moment.min.js",
                    "~/Scripts/angularJS/angular.min.js",
                    "~/Scripts/angularJS/angular-ui-router.js",
                    "~/Scripts/angularJS/ui/ui-utils.js",
                    "~/Scripts/angularJS/angular-sortable-view.min.js",

                    "~/Scripts/jstree/jstree.min.js",
                    "~/Scripts/signalR/jquery.signalR-2.2.1.js"
                    )
                    );

            bundles.Add(
                new ScriptBundle("~/Bundles/Frame/canknow.js").Include(
                    "~/Content/frame/canknow/dist/js/canknow.js",
                    "~/Content/scripts/frame/canknow/canknow.config.js"
                ));
            bundles.Add(
                new ScriptBundle("~/Bundles/Frame/canknow/angular.js")
                .IncludeDirectory("~/Content/scripts/frame/canknow/angular/", "*.js", true).ForceOrdered()
                );

            bundles.Add(
               new ScriptBundle("~/Bundles/Infrastructure.js")
                   .IncludeDirectory("~/Content/Infrastructure/Framework/Scripts/", "*.js", true).ForceOrdered()
               );

            bundles.Add(
               new ScriptBundle("~/Bundles/Common.js")
                   .IncludeDirectory("~/Resource/Scripts/Common/", "*.js", true).ForceOrdered()
               );

            bundles.Add(
                new ScriptBundle("~/Bundles/App/Common.js")
                    .IncludeDirectory("~/Resource/Scripts/App/Common/", "*.js", false)
                    .IncludeDirectory("~/Resource/Scripts/App/Common/services", "*.js", true)
                    .IncludeDirectory("~/Resource/Scripts/App/Common/directives", "*.js", true)
                    .IncludeDirectory("~/Resource/Scripts/App/Common/filters", "*.js", true).ForceOrdered()
                );

            bundles.Add(
                new ScriptBundle("~/Bundles/App/Manager.js")
                    .IncludeDirectory("~/Resource/Scripts/App/Manager/", "*.js", true).ForceOrdered()
                );

            bundles.Add(
                new ScriptBundle("~/Bundles/App/Mobile.js")
                .IncludeDirectory("~/Resource/Scripts/App/Mobile/", "*.js", true).ForceOrdered()
                );
        }
    }
}