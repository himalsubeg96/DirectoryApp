using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DirectoryListApp
{
    public class Utility
    {
        public static int PageSize { get { return 25; } }
        public static SelectList GetAllDistrict()
        {
            using (var ent = new DirectoryEntities())
            {
                return new SelectList(ent.tblDistricts.ToList(), "DistrictId_val", "DistrictName_Nep");
            }
        }
        public static string GetDistrictById(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblDistricts.Where(x => x.DistrictId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.DistrictName_Nep;
                else
                    return "";
            }
        }
        public static string GetDistrictName(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblDistricts.Where(x => x.DistrictId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.DistrictName;
                else
                    return "";
            }
        }

        public static SelectList GetAllState()
        {
            using (var ent = new DirectoryEntities())
            {
                return new SelectList(ent.tblStates.ToList(), "StateId_val", "StateName_Nep");
            }
        }
        public static string GetStateById(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblStates.Where(x => x.StateId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.StateName_Nep;
                else
                    return "";
            }
        }
        public static string GetStateName(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblStates.Where(x => x.StateId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.StateName;
                else
                    return "";
            }
        }
        public static SelectList GetAllPalika()
        {
            using (var ent = new DirectoryEntities())
            {
                return new SelectList(ent.tblPalikas.ToList(), "PalikaId_val", "PalikaName_Nep");
            }
        }
        public static string GetPalikaById(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblPalikas.Where(x => x.PalikaId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.PalikaName_Nep;
                else
                    return "";
            }
        }
        public static string GetPalikaName(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblPalikas.Where(x => x.PalikaId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.PalikaName;
                else
                    return "";
            }
        }
        public static SelectList GetAllDirectoryCategory()
        {
            using (var ent = new DirectoryEntities())
            {
                return new SelectList(ent.tblDirectoryCategories.ToList(), "DirectoryCategoryId", "DirectoryCategoryName");
            }
        }
        public static string GetDirectoryCategoryName(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblDirectoryCategories.Where(x => x.DirectoryCategoryId == id).SingleOrDefault();
                if (obj != null)
                    return obj.DirectoryCategoryName;
                else
                    return "";
            }
        }
        public static SelectList GetAllDirectorySubCategory()
        {
            using (var ent = new DirectoryEntities())
            {
                return new SelectList(ent.tblDirectorySubCategories.ToList(), "DirectorySubCategoryId", "DirectorySubCategoryName");
            }
        }
        public static string GetDirectorySubCategoryName(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblDirectorySubCategories.Where(x => x.DirectorySubCategoryId == id).SingleOrDefault();
                if (obj != null)
                    return obj.DirectorySubCategoryName;
                else
                    return "";
            }
        }
        public static SelectList GetDirectorySubCategoryById(int id)
        {
            List<SelectListItem> subCatList = new List<SelectListItem>();
            using (DirectoryEntities db = new DirectoryEntities())
            {
                return new SelectList(db.tblDirectorySubCategories.Where(x => x.DirectoryCategoryId == id).ToList(), "DirectorySubCategoryId", "DirectorySubCategoryName");
                
            }
        }
        public static IamgeView_Model GetUploadedImagePath(HttpPostedFileBase file, string relativeFolder)
        {
            IamgeView_Model model = new IamgeView_Model();
            string folder = "/Images/" + relativeFolder + "/";
            String Serverpath = HttpContext.Current.Server.MapPath("~" + folder);
            if (!Directory.Exists(Serverpath))
            {
                Directory.CreateDirectory(Serverpath);
            }
            string fileExt = Path.GetExtension(file.FileName);
            string fileName = Guid.NewGuid() + fileExt;
            string path = Path.Combine(HttpContext.Current.Server.MapPath("~" + folder), fileName);
            file.SaveAs(path);
            model.FullPath = path;
            model.RelativePath = folder + fileName;
            model.ImgName = fileName;
            return model;
        }
        public class IamgeView_Model
        {
            public string FullPath { get; set; }
            public string RelativePath { get; set; }
            public string ImgName { get; set; }
        }
        public static string GetUrlForImage()
        {
            string Fullurl = HttpContext.Current.Request.Url.AbsoluteUri;
            var aa = Fullurl.Split('/', ' ');
            return aa[0] + "//" + aa[2];
        }
        public static SelectList GetRoleList()
        {
            using (var ent = new DirectoryEntities())
            {
                return new SelectList(ent.AspNetRoles.ToList(), "Name", "Name");
            }
        }
    }
}