using DirectoryListApp.Areas.Admin.Models;
using DirectoryListApp.Areas.Admin.Providers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DirectoryListApp.Areas.Admin.Controllers
{
    public class CommonSetupController : Controller
    {
        CommonSetupProvider _proCommon = new CommonSetupProvider();
        DirectoryEntities ent = new DirectoryEntities();
        // GET: Admin/CommonSetup
        public CommonSetupController()
        {
            CommonSetupProvider _proCommon = new CommonSetupProvider();
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Category(int page=1)
        {
            var model = new CategorySetupViewModel();
            model.CategorySetupViewModelList = _proCommon.GetAllCategories();
            ViewBag.currentPage = page;
            return View(model);
        }

        public ActionResult InsertUpdateCategory(int? id)
        {
            var model = _proCommon.GetCategoryById(id);
            if (model != null)
            {
                return View(model);
            }
            else
            {
                return View(new CategorySetupViewModel());
            }
        }

        [HttpPost]
        public ActionResult InsertUpdateCategory(CategorySetupViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            if (_proCommon.InsertUpdateCategory(model))
            {
                return RedirectToAction("Category");
            }
            return View(model);
        }

        public ActionResult SubCategory(int page = 1)
        {
            var model = new SubCategorySetupViewModel();
            model.SubCategorySetupViewModelList = _proCommon.GetAllSubCategories();
            ViewBag.currentPage = page; 
            return View(model);
        }

        public ActionResult InsertUpdateSubCategory(int? id)
        {
            var model = _proCommon.GetSubCategoryById(id);
            if (model != null)
            {
                return View(model);
            }
            else
            {
                return View(new SubCategorySetupViewModel());
            }
        }

        [HttpPost]
        public ActionResult InsertUpdateSubCategory(SubCategorySetupViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            if (_proCommon.InsertUpdateSubCategory(model))
            {
                return RedirectToAction("SubCategory");
            }
            return View(model);
        }
        public ActionResult DirectoryList(int page=1)
        {
            int pagesize = 10000;
            var model = new DirectoryViewModel();
            model.DirectoryViewModelList = _proCommon.GetList(page, pagesize);
            ViewBag.currentPage = page;
            
            return View(model);
        }
        public ActionResult InsertDirectory()
        {
            var model = new DirectoryViewModel();
            model.Status = true;
            return View(model);
        }
        [HttpPost]
        public ActionResult InsertDirectory(DirectoryViewModel model,HttpPostedFileBase PhotoLogo)
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
                _proCommon.Insert(model);
                TempData["SuccessMessage"] = "Saved Successfully";
                return RedirectToAction("DirectoryList");
            }
            return View(model);
        }
        public ActionResult UpdateDirectory(int id)
        {
            var model = new DirectoryViewModel();
            model = _proCommon.GetDirectoryData(id);

            return View(model);
        }
        [HttpPost]
        public ActionResult UpdateDirectory(DirectoryViewModel model, HttpPostedFileBase PhotoLogo)
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
                _proCommon.Update(model);
                TempData["SuccessMessage"] = "Updated Successfully";
                return RedirectToAction("DirectoryList");
            }
            return View(model);
        }
        public ActionResult DirectoryDetail(int id)
        {
            var model = new DirectoryViewModel();
            model = _proCommon.GetDirectoryData(id);
            return PartialView("VUC_Details", model);
        }
    }
}