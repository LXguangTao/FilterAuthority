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
        }

        public void OnActionExecuting(ActionExecutingContext filterContext)
        {
            
        }
    }
}