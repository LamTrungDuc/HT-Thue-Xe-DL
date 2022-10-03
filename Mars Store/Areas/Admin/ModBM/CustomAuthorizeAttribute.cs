using Mars_Store.Models;
using Mars_Store.Models.Function;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mars_Store.ModBM
{
    public class CustomAuthorizeAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (string.IsNullOrEmpty(SessionPersister.UserName))
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { Controller = "ADMINLOGIN", Action = "Index"}));
            }
            else
            {
                AccountModel am = new AccountModel();
                CustomPrincipal cp = new CustomPrincipal(am.Find(SessionPersister.UserName));
                if (!cp.IsInRole(Roles))
                { 
                    filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { Controller = "ADMINLOGIN", Action = "Index"}));
                }
            }
        }
    }
}