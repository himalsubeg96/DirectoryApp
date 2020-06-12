using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DirectoryListApp.Areas.Admin.Controllers
{
    public class AjaxRequestController : Controller
    {
        // GET: Admin/AjaxRequest
        public ActionResult GetDistrict(int ID)
        {
            List<SelectListItem> districtList = new List<SelectListItem>();
            using (DirectoryEntities db = new DirectoryEntities())
            {
                var projectList = db.tblDistricts.Where(x => x.StateId_val == ID).ToList();
                foreach (var item in projectList)
                {
                    districtList.Add(new SelectListItem { Text = item.DistrictName_Nep, Value = item.DistrictId_val.ToString() });
                }
            }
            return Json(districtList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetPalika(int ID)
        {
            List<SelectListItem> palikaList = new List<SelectListItem>();
            using (DirectoryEntities db = new DirectoryEntities())
            {
                var projectList = db.tblPalikas.Where(x => x.DistrictId == ID).ToList();
                foreach (var item in projectList)
                {
                    palikaList.Add(new SelectListItem { Text = item.PalikaName_Nep, Value = item.PalikaId_val.ToString() });
                }
            }
            return Json(palikaList, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetDirectorySubCategoryById(int id)
        {
            List<SelectListItem> subCatList = new List<SelectListItem>();
            using (DirectoryEntities db = new DirectoryEntities())
            {
                var catList = db.tblDirectorySubCategories.Where(x => x.DirectoryCategoryId == id).ToList();
                foreach (var item in catList)
                {
                    subCatList.Add(new SelectListItem { Text = item.DirectorySubCategoryName, Value = item.DirectorySubCategoryId.ToString() });
                }
            }
            return Json(subCatList, JsonRequestBehavior.AllowGet);
        }
    }
}