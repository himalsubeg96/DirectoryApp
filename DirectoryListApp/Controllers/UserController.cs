using DirectoryListApp.Models;
using DirectoryListApp.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DirectoryListApp.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        UserProvider _proUser =new UserProvider();
        public UserController()
        {
            _proUser = new UserProvider();
        }
        // GET: User
        public ActionResult Index()
        {
            return View(_proUser.GetUserDetails() ?? new UserModel());
        }

        public ActionResult Insert()
        {
            return PartialView("_UserDetailsInsert", _proUser.GetUserDetails() ?? new UserModel());
        }

        [HttpPost]
        public ActionResult Insert(UserModel model, HttpPostedFileBase file)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            if (file != null)
            {
                var image = Utility.GetUploadedImagePath(file, "User");
                model.Image = image.RelativePath;
            }
            else if (model.Id == Guid.Empty)
            {
                model.Image = "/DirectoryLogo/NoImage(1).png";
            }

            if (_proUser.InsertUpdateUserDetails(model))
            {
                return RedirectToAction("Index");
            }
            return View(model);
        }

    }
}