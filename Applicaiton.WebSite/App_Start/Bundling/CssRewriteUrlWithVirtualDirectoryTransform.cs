﻿using Castle.Core.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace Application.WebSite.App_Start.Bundling
{
    public class CssRewriteUrlWithVirtualDirectoryTransform : IItemTransform
    {
        private readonly CssRewriteUrlTransform _rewriteUrlTransform;

        public CssRewriteUrlWithVirtualDirectoryTransform()
        {
            _rewriteUrlTransform = new CssRewriteUrlTransform();
        }

        public string Process(string includedVirtualPath, string input)
        {
            var result = _rewriteUrlTransform.Process(includedVirtualPath, input);

            if (!HttpRuntime.AppDomainAppVirtualPath.IsNullOrEmpty() && HttpRuntime.AppDomainAppVirtualPath != "/")
            {
                result = result.Replace(@"url(/", @"url(" + HttpRuntime.AppDomainAppVirtualPath + @"/");
            }
            return result;
        }
    }

    public class CssRewriteUrlOfFrameTransform : IItemTransform
    {
        private readonly CssRewriteUrlTransform _rewriteUrlTransform;

        public CssRewriteUrlOfFrameTransform()
        {
            _rewriteUrlTransform = new CssRewriteUrlTransform();
        }

        public string Process(string includedVirtualPath, string input)
        {
            var result = _rewriteUrlTransform.Process(includedVirtualPath, input);

            if (!HttpRuntime.AppDomainAppVirtualPath.IsNullOrEmpty() && HttpRuntime.AppDomainAppVirtualPath != "/")
            {
                result = result.Replace(@"url(./", @"url(./../../../");
            }
            return result;
        }
    }
}