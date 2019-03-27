using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security;
using System.Web.Routing;

namespace FilterAuthority.App_Start
{
    public class MyAuthAttribute:AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            string username = filterContext.HttpContext.User.Identity.Name;
            string actionname = filterContext.ActionDescriptor.ActionName;
            string controllername = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
            string path = "/" + controllername + "/" + actionname;
            using (FilterAuthorityEntities m = new FilterAuthorityEntities())
            {
                string role = m.View_UserRole.FirstOrDefault(x=>x.Name==username).RoleName;
                var module = m.View_RoleModules.Where(x => x.RoleName == role).Select(x=>x.Path).ToList();
                if (module.Contains(path))
                {
                    //filterContext.Result = new RedirectToRouteResult(
                    //    new RouteValueDictionary(
                    //        new {
                    //            controller = controllername,
                    //            action = actionname,
                    //            returnUrl = filterContext.HttpContext.Request.Url
                    //            }
                    //        )
                    //    );
                }
                else
                {
                    filterContext.Result = new RedirectToRouteResult(
                        new RouteValueDictionary(
                            new
                            {
                                controller = "Home",
                                action = "Login",
                                returnUrl = filterContext.HttpContext.Request.Url
                            }
                            )
                        );
                }

            }
        }
    }
}