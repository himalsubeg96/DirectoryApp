using DirectoryListApp.Areas.Directory.Models;
using DirectoryListApp.Areas.Directory.Providers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DirectoryListApp.Areas.Directory.Controllers
{
    public class DirectorySubCategoryController : Controller
    {
        // GET: Directory/DirectorySubCategory
        DirectorySubCategoryProvider pro = new DirectorySubCategoryProvider();
        DirectoryEntities db = new DirectoryEntities();
        public ActionResult Index(int page = 1)
        {
            int pagesize = 100;
            var model = new DirectorySubCategoryModel();
            model.DirectorySubCategoryModelList = pro.GetDirectorySubCategoryList(page, pagesize);
            ViewBag.currentPage = page;
            ViewBag.TotalPages = Math.Ceiling((double)pro.GetTotalItemCount() / pagesize);
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            var model = new DirectorySubCategoryModel();
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(DirectorySubCategoryModel model)
        {

            if (ModelState.IsValid)
            {
                pro.Insert(model);
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index", "DirectorySubCategory");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {

            var model = new DirectorySubCategoryModel();
            model = pro.GetDirectorySubCategoryData(id);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(DirectorySubCategoryModel model)
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