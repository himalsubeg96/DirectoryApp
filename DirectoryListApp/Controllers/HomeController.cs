using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DirectoryListApp.Controllers
{
    public class HomeController : Controller
    {
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult LoggedIn()
        {
            if (!User.IsInRole("Customer"))
            {
                return RedirectToAction("Index", "CommonSetup", new { area = "Admin" });
            }
            return RedirectToAction("Index", "Home", new { Area = "" });
        }

    }
}