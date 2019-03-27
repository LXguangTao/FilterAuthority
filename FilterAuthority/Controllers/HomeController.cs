using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using FilterAuthority.Models;
using FilterAuthority.App_Start;

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
                ViewBag.role = Modules;
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
        [MyAuth]
        public ActionResult SignOut()
        {
            FormsAuthentication.SignOut();
            return Redirect("~/Home/Login");
        }
        [MyAuth]
        public ActionResult AddUser()
        {
            return View();
        }
        [MyAuth]
        public ActionResult AlterUser()
        {
            return View();
        }
        [MyAuth]
        public ActionResult SelfInfo()
        {
            return View();
        }
        [MyAuth]
        public ActionResult DeleteUser()
        {
            return View();
        }
        [MyAuth]
        public ActionResult SelfChangePwd()
        {
            return View();
        }
        [MyAuth]
        public ActionResult PowerManager()
        {
            return View();
        }
        [MyAuth]
        public ActionResult CheckUser()
        {
            return View();
        }
    }
}