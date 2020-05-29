using DirectoryListApp.Models;
using DirectoryListApp.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DirectoryListApp.Controllers
{
    public class DirectoryItemController : Controller
    {
        // GET: DirectoryItem
        DirectoryItemProvider pro = new DirectoryItemProvider();
        DirectoryEntities ent = new DirectoryEntities();
        public ActionResult Index(int page = 1)
        {
            int pagesize = 10000;
            var model = new DirectoryModel();
            model.DirectoryModelList = pro.GetList(page, pagesize);
            ViewBag.currentPage = page;
            ViewBag.TotalPages = Math.Ceiling((double)pro.GetTotalItemCount() / pagesize);
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            var model = new DirectoryModel();
            model.Status = true;
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(DirectoryModel model)
        {

            if (ModelState.IsValid)
            {
                pro.Insert(model);
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("Index", "DirectoryItem");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {

            var model = new DirectoryModel();
            model = pro.GetDirectoryData(id);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(DirectoryModel model)
        {
            if (ModelState.IsValid)
            {
                pro.Update(model);
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Details(int id)
        {
            var model = new DirectoryModel();
            model = pro.GetDirectoryData(id);
            return PartialView("VUC_Details", model);
        }
    }
}