using Mars_Store.Models;
using Mars_Store.Models.Function;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mars_Store.Security
{
    public class CustomAuthorizeAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (SessionPersister.UserName == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { Controller = "UserLogin", Action = "Index", returnUrl = filterContext.HttpContext.Request.Url.GetComponents(UriComponents.PathAndQuery, UriFormat.SafeUnescaped) }));
            }
            else
            {
                AccountModel am = new AccountModel();
                CustomPrincipal cp = new CustomPrincipal(am.Find(SessionPersister.UserName.UserName));
                if(string.IsNullOrEmpty(this.Roles))
                { }
                else
                {
                    if (!cp.IsInRole(Roles))
                    {
                        filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { Controller = "UserLogin", Action = "Index" }));
                    }
                }
            }
        }
    }
}