using DirectoryListApp.Areas.Admin.Models;
using DirectoryListApp.Areas.Admin.Providers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
//Add new namespaces
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;

namespace DirectoryListApp.Areas.Admin.Controllers
{
    public class CommonSetupController : Controller
    {
        CommonSetupProvider _proCommon = new CommonSetupProvider();
        DirectoryEntities ent = new DirectoryEntities();
        // GET: Admin/CommonSetup
        //Add Connection string for SQL Server and OLEDB
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        //OleDbConnection Econ;
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
        //[HttpPost]
        //public ActionResult Category(HttpPostedFileBase file)
        //{
        //    string filename = Guid.NewGuid() + Path.GetExtension(file.FileName);
        //    string filepath = "/Content/Upload/" + filename;
        //    file.SaveAs(Path.Combine(Server.MapPath("/Content/Upload"), filename));
        //    InsertExceldata(filepath, filename);
        //    return View();
        //}
        ////for excel upload
        //public void ExcelConn(string filepath)
        //{
        //    string constr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=YES;""", filepath);
        //   Econ = new OleDbConnection(constr);
        //}
        //public void InsertExceldata(string fileepath,string filename)
        //{
        //    string fullpath = Server.MapPath("/Content/Upload/")+filename;
        //    ExcelConn(fullpath);
        //    string query = string.Format("Select * from [{0}]", "Sheet1$");
        //    OleDbCommand Ecom = new OleDbCommand(query, Econ);
        //    Econ.Open();
        //    DataSet ds = new DataSet();
        //    OleDbDataAdapter oda = new OleDbDataAdapter(query, Econ);
        //    Econ.Close();
        //    oda.Fill(ds);
        //    DataTable dt = ds.Tables[0];
        //    SqlBulkCopy objbulk = new SqlBulkCopy(con);
        //    objbulk.DestinationTableName = "tblDirectoryCategory";
        //    objbulk.ColumnMappings.Add("DirectoryCategoryName", "DirectoryCategoryName");
        //    objbulk.ColumnMappings.Add("CreatedBy", "CreatedBy");
        //    objbulk.ColumnMappings.Add("CreatedDate", "CreatedDate");
        //    con.Open();
        //    objbulk.WriteToServer(dt);
        //    con.Close();
        //}
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
        public ActionResult InsertUpdateCategory(CategorySetupViewModel model,HttpPostedFileBase CategoryIcon)
        {
            var tb = ent.tblDirectoryCategories.Where(x => x.DirectoryCategoryId == model.DirectoryCategoryId).FirstOrDefault();
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            if (CategoryIcon != null)
            {
                try
                {
                    var supportedType = new[] { "jpg", "jpeg", "png" };
                    var fileExtn = System.IO.Path.GetExtension(CategoryIcon.FileName).Substring(1);
                    if (!supportedType.Contains(fileExtn))
                    {
                        ViewBag.message = "invalid file extension";
                    }
                    else
                    {                       
                        var image = Utility.GetUploadedImagePath(CategoryIcon, "CategoryIcons");
                        model.CategoryIcon = image.RelativePath;
                    }
                }
                catch (Exception)
                {

                    throw;
                }

            }
            else if (tb.CategoryIcon!=null)
            {
                model.CategoryIcon = tb.CategoryIcon;
            }
            else { model.CategoryIcon = "/Images/NoImage(1).png"; }
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
            int pagesize = Utility.PageSize;
            var model = new DirectoryViewModel();
            model.DirectoryViewModelList = _proCommon.GetDirectoryList(page, pagesize);
            ViewBag.currentPage = page;
            ViewBag.TotalPages = Math.Ceiling((double)_proCommon.GetTotalItemCount() / pagesize);
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
        public ActionResult GetDirectoryCategory(int id, int page = 1)
        {
            int pagesize = Utility.PageSize;
            var model = new DirectoryViewModel();
            model.DirectoryViewModelList = _proCommon.GetDirectoryCategory(id, page, pagesize);
            ViewBag.currentPage = page;
            ViewBag.TotalPages = Math.Ceiling((double)_proCommon.GetTotalItemCount() / pagesize);
            return View(model);
        }
    }
}