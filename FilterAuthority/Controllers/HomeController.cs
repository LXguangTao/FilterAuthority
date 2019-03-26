using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace FilterAuthority.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            string user = this.User.Identity.Name;
            using (FilterAuthorityEntities m = new FilterAuthorityEntities())
             {
                string RoleName = m.View_UserRole.FirstOrDefault(x => x.Name == user).RoleName;
                var Modules = m.View_RoleModules.Where(x => x.RoleName == RoleName && x.ParentId!=null).OrderBy(x=>x.Weight).ToList();
                var BigModules = m.View_RoleModules.Where(x => x.RoleName == RoleName && x.ParentId == null).OrderBy(x => x.Weight).ToList();
                //List<View_RoleModules> role = new List<View_RoleModules>();
                List<View_RoleModules>[] roles = null;
                for (int j=0;j<Modules.Count();j++)
                {
                    foreach (var i in BigModules)
                    {
                        if (Modules[j].Id==i.ParentId)
                        {
                            roles[j].Add(i);
                        }
                    }
                }
                
                ViewBag.role = roles;
                ViewBag.bigrole = BigModules;
            }
            return View();
        }
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult Logins()
        {
            string username = Request.Params["username"];
            string password = Request.Params["password"];
            using (FilterAuthorityEntities m = new FilterAuthorityEntities())
            {
                var user = m.User.FirstOrDefault(x => x.Name == username&&x.PassWord==password);
                if (user==null)
                {
                    return Json(new { success=false,msg="用户名或密码错误"});
                }
                FormsAuthentication.SetAuthCookie(username, false);//颁发通行证
                return Json(new { success=true,msg=""});
            }
        }
        public ActionResult Welcome()
        {
            return View();
        }
        public ActionResult SignOut()
        {
            FormsAuthentication.SignOut();
            return Redirect("~/Home/Login");
        }
        public ActionResult AddUser()
        {
            return View();
        }
        public ActionResult AlterUser()
        {
            return View();
        }
        public ActionResult SelfInfo()
        {
            return View();
        }
        public ActionResult DeleteUser()
        {
            return View();
        }
        public ActionResult SelfChangePwd()
        {
            return View();
        }
        public ActionResult PowerManager()
        {
            return View();
        }
    }
}