using DirectoryListApp.Areas.Directory.Models;
using DirectoryListApp.Areas.Directory.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DirectoryListApp.Areas.Directory.Controllers
{
    public class DirectoryCategoryController : Controller
    {
        // GET: Directory/DirectoryCategory
        DirectoryCategoryProvider pro = new DirectoryCategoryProvider();
        DirectoryEntities db = new DirectoryEntities();
        public ActionResult Index(int page = 1)
        {
            int pagesize = 100;
            var model = new DirectoryCategoryModel();
            model.DirectoryCategoryModelList = pro.GetDirectoryCategoryList(page, pagesize);
            ViewBag.currentPage = page;
            ViewBag.TotalPages = Math.Ceiling((double)pro.GetTotalItemCount() / pagesize);
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            var model = new DirectoryCategoryModel();
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(DirectoryCategoryModel model)
        {

            if (ModelState.IsValid)
            {
                pro.Insert(model);
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index", "DirectoryCategory");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {

            var model = new DirectoryCategoryModel();
            model = pro.GetDirectoryCategoryData(id);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(DirectoryCategoryModel model)
        {
            if (ModelState.IsValid)
            {
                pro.Update(model);
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            pro.Delete(id);
            return RedirectToAction("Index");
        }
    }
}