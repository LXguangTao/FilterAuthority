using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FilterAuthority.Models
{
    public class PowerFilter : FilterAttribute, IActionFilter
    {
        public void OnActionExecuted(ActionExecutedContext filterContext)
        {
            //string user = filterContext.HttpContext.User.Identity.Name;
            //using (FilterAuthorityEntities m = new FilterAuthorityEntities())
            //{
            //    string RoleName = m.View_UserRole.FirstOrDefault(x => x.Name == user).RoleName;
            //    filterContext.Result = new RedirectResult("~/home/index?RoleName=" + RoleName);
            //}
        }

        public void OnActionExecuting(ActionExecutingContext filterContext)
        {
            
        }
    }
}