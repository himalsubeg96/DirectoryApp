using DirectoryListApp.Areas.Directory.Models;
using DirectoryListApp.Areas.Directory.Providers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DirectoryListApp.Areas.Directory.Controllers
{
    public class DirectoryItemController : Controller
    {
        // GET: Directory/DirectoryItem
        DirectoryItemProvider pro = new DirectoryItemProvider();
        DirectoryEntities ent = new DirectoryEntities();
        public ActionResult Index(int page = 1)
        {
            int pagesize = Utility.PageSize;
            var model = new DirectoryModel();
            model.DirectoryModelList = pro.NewRegistered(page, pagesize);
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
        public ActionResult Create(DirectoryModel model, HttpPostedFileBase PhotoLogo)
        {
            if (PhotoLogo != null)
            {
                try
                {
                    var supportedType = new[] { "jpg", "jpeg", "png" };
                    var fileExtn = System.IO.Path.GetExtension(PhotoLogo.FileName).Substring(1);
                    if (!supportedType.Contains(fileExtn))
                    {
                        ViewBag.message = "invalid file extension";
                    }
                    else
                    {
                        //var fileName = Path.GetFileName(PhotoLogo.FileName);
                        //var path = Path.Combine(Server.MapPath("~/DirectoryLogo/"), fileName);
                        //PhotoLogo.SaveAs(path);
                        //model.PhotoLogo = fileName;
                        var image = Utility.GetUploadedImagePath(PhotoLogo, "DirectoryLogo");
                        model.PhotoLogo = image.RelativePath;
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
            else { model.PhotoLogo = "/Images/NoImage(1).png"; }
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
        public ActionResult Edit(DirectoryModel model, HttpPostedFileBase PhotoLogo)
        {
            var tb = ent.tblDirectoryDetails.Where(x => x.DirectoryItemId == model.DirectoryItemId).FirstOrDefault();
            if (PhotoLogo != null)
            {
                try
                {
                    var supportedType = new[] { "jpg", "jpeg", "png" };
                    var fileExtn = System.IO.Path.GetExtension(PhotoLogo.FileName).Substring(1);
                    if (!supportedType.Contains(fileExtn))
                    {
                        ViewBag.message = "invalid file extension";
                    }
                    else
                    {
                        //var fileName = Path.GetFileName(PhotoLogo.FileName);
                        //var path = Path.Combine(Server.MapPath("~/DirectoryLogo/"), fileName);
                        //PhotoLogo.SaveAs(path);
                        //model.PhotoLogo = fileName;
                        var image = Utility.GetUploadedImagePath(PhotoLogo, "DirectoryLogo");
                        model.PhotoLogo = image.RelativePath;
                    }
                }

                catch { }
            }

            else
            {

                model.PhotoLogo = tb.PhotoLogo;
            }
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
        public ActionResult SearchList(string anydata)
        {
            var model = new DirectoryModel();

            model.DirectoryModelList = ent.tblDirectoryItems.Where(x => x.DirectoryItemName.Contains(anydata)).Select(x => new DirectoryModel
            {
                DirectoryItemId = x.DirectoryItemId,
                DirectoryItemName = x.DirectoryItemName,
                DirectoryCategoryId = x.DirectoryCategoryId,
                DirectorySubCategoryId = x.DirectorySubCategoryId,
                Specification = x.Specification,
            }).ToList();
            return PartialView(model);
        }
        public ActionResult AdvanceSearch()
        {
            var model = new DirectoryModel();
            return View(model);
        }
        public ActionResult AdvanceSearchResult(int? category, int? subcategory, int? state, int? district, int? palika)
        {
            var model = new DirectoryModel();
            model.DirectoryModelList = pro.GetFilterList(category, subcategory, state, district, palika);
            return PartialView("VUC_AdvanceSearch", model);
        }
        public ActionResult GetDirectoryCategory(int id,int page=1)
        {
            int pagesize = Utility.PageSize;
            var model = new DirectoryModel();
            model.DirectoryModelList = pro.GetDirectoryCategory(id,page,pagesize);
            ViewBag.currentPage = page;
            ViewBag.TotalPages = Math.Ceiling((double)pro.GetTotalItemCount() / pagesize);
            return View(model);
        }
        public ActionResult GetDirectorySubCategory(int id,int page=1)
        {
            int pagesize = Utility.PageSize;
            var model = new DirectoryModel();
            model.DirectoryModelList = pro.GetDirectorySubCategory(id,page,pagesize);
            ViewBag.currentPage = page;
            ViewBag.TotalPages = Math.Ceiling((double)pro.GetTotalItemCount() / pagesize);
            return View(model);
        }
        
    }
}