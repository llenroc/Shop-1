using System.Web.Optimization;

namespace Application.WebSite.App_Start.Bundling
{
    public static class BundleExtensions
    {
        public static Bundle ForceOrdered(this Bundle bundle)
        {
            bundle.Orderer = new AsIsBundleOrderer();
            return bundle;
        }
    }
}