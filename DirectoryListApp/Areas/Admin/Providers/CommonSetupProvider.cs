using DirectoryListApp.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DirectoryListApp.Areas.Admin.Providers
{
    public class CommonSetupProvider
    {
        DirectoryEntities ent = new DirectoryEntities();
        public List<CategorySetupViewModel> GetAllCategories()
        {
            using (var con = new DirectoryEntities())
            {
               
                var data = con.tblDirectoryCategories
                    .Select(x => new CategorySetupViewModel()
                    {
                        DirectoryCategoryId = x.DirectoryCategoryId,
                        DirectoryCategoryName = x.DirectoryCategoryName,
                        
                    }).ToList();
                return data;
            }
        }
        public CategorySetupViewModel GetCategoryById(int? id)
        {
            using (var con = new DirectoryEntities())
            {
                var data = con.tblDirectoryCategories.Where(x => x.DirectoryCategoryId == id)
                    .Select(x => new CategorySetupViewModel()
                    {
                        DirectoryCategoryId = x.DirectoryCategoryId,
                        DirectoryCategoryName = x.DirectoryCategoryName,

                    }).FirstOrDefault();
                return data;
            }
        }
        public List<SubCategorySetupViewModel> GetAllSubCategories()
        {
            using (var con = new DirectoryEntities())
            {
                var data = con.tblDirectorySubCategories
                    .Select(x => new SubCategorySetupViewModel()
                    {
                        DirectorySubCategoryId = x.DirectorySubCategoryId,
                        DirectorySubCategoryName = x.DirectorySubCategoryName,
                        DirectoryCategoryId = x.DirectoryCategoryId,
                    }).ToList();
                return data;
            }
        }
        public SubCategorySetupViewModel GetSubCategoryById(int? id)
        {
            using (var con = new DirectoryEntities())
            {
                var data = con.tblDirectorySubCategories.Where(x => x.DirectorySubCategoryId == id)
                    .Select(x => new SubCategorySetupViewModel()
                    {
                        DirectorySubCategoryId = x.DirectorySubCategoryId,
                        DirectorySubCategoryName = x.DirectorySubCategoryName,
                        DirectoryCategoryId = x.DirectoryCategoryId,
                    }).FirstOrDefault();
                return data;
            }
        }
        public bool InsertUpdateCategory(CategorySetupViewModel model)
        {
            try
            {
                using (var con = new DirectoryEntities())
                {
                    if (model.DirectoryCategoryId >0)
                    {
                        var record = con.tblDirectoryCategories.Where(x => x.DirectoryCategoryId == model.DirectoryCategoryId).FirstOrDefault();
                        if (record != null)
                        {
                            record.DirectoryCategoryId = model.DirectoryCategoryId;
                            record.DirectoryCategoryName = model.DirectoryCategoryName;

                            con.Entry(record).State = System.Data.Entity.EntityState.Modified;
                        }
                    }
                    else
                    {
                        tblDirectoryCategory category = new tblDirectoryCategory()
                        {
                            DirectoryCategoryId = model.DirectoryCategoryId,
                            DirectoryCategoryName = model.DirectoryCategoryName,

                        };
                        //category.CreatedBy = Utility.GetCurrentLoginUser();
                        category.CreatedDate = DateTime.Now.ToShortDateString().ToString();
                        con.tblDirectoryCategories.Add(category);
                    }
                    con.SaveChanges();

                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool InsertUpdateSubCategory(SubCategorySetupViewModel model)
        {
            try
            {
                using (var con = new DirectoryEntities())
                {
                    if (model.DirectorySubCategoryId >0)
                    {
                        var record = con.tblDirectorySubCategories.Where(x => x.DirectorySubCategoryId == model.DirectorySubCategoryId).FirstOrDefault();
                        if (record != null)
                        {
                            record.DirectorySubCategoryId = model.DirectorySubCategoryId;
                            record.DirectorySubCategoryName = model.DirectorySubCategoryName;
                            record.DirectoryCategoryId = model.DirectoryCategoryId;
                            con.Entry(record).State = System.Data.Entity.EntityState.Modified;
                        }
                    }
                    else
                    {
                        tblDirectorySubCategory subCategory = new tblDirectorySubCategory()
                        {
                           DirectorySubCategoryId = model.DirectorySubCategoryId,
                           DirectorySubCategoryName = model.DirectorySubCategoryName,
                           DirectoryCategoryId = model.DirectoryCategoryId
                    };
                    //subCategory.CreatedBy = Utility.GetCurrentLoginUser();
                    subCategory.CreatedDate = DateTime.Now.ToShortDateString().ToString();
                    con.tblDirectorySubCategories.Add(subCategory);
                    }
                    con.SaveChanges();

                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public void Insert(DirectoryViewModel model)
        {
            var objToSave = new tblDirectoryItem()
            {
                DirectoryItemId = model.DirectoryItemId,
                DirectoryItemName = model.DirectoryItemName,
                DirectoryCategoryId = model.DirectoryCategoryId,
                DirectorySubCategoryId = model.DirectorySubCategoryId,
                IssueDate = model.IssueDate,
                Status = model.Status,
                Specification = model.Specification
            };
            ent.tblDirectoryItems.Add(objToSave);
            ent.SaveChanges();
            var addDetail = new tblDirectoryDetail()
            {
                DirectoryDetailsId = model.DirectoryDetailsId,
                DirectoryItemId = objToSave.DirectoryItemId,
                AddressState = model.AddressState,
                AddressDistrict = model.AddressDistrict,
                AddressPalika = model.AddressPalika,
                AddressWard = model.AddressWard,
                DirectoryPhone = model.DirectoryPhone,
                PAN = model.PAN,
                VAT = model.VAT,
                ContactPersonName = model.ContactPersonName,
                ContactPersonPhone = model.ContactPersonPhone,
                Details = model.Details,
                Email = model.Email,
                PhotoLogo = model.PhotoLogo
            };
            ent.tblDirectoryDetails.Add(addDetail);
            ent.SaveChanges();
        }
        public void Update(DirectoryViewModel model)
        {
            var objToEdit = ent.tblDirectoryItems.Where(x => x.DirectoryItemId == model.DirectoryItemId).FirstOrDefault();
            objToEdit.DirectoryItemName = model.DirectoryItemName;
            objToEdit.DirectoryCategoryId = model.DirectoryCategoryId;
            objToEdit.DirectorySubCategoryId = model.DirectorySubCategoryId;
            objToEdit.IssueDate = model.IssueDate;
            objToEdit.Status = model.Status;
            objToEdit.Specification = model.Specification;
            ent.Entry(objToEdit).State = System.Data.Entity.EntityState.Modified;
            ent.SaveChanges();

            var editDetail = ent.tblDirectoryDetails.Where(x => x.DirectoryItemId == model.DirectoryItemId).FirstOrDefault();
            editDetail.AddressState = model.AddressState;
            editDetail.AddressDistrict = model.AddressDistrict;
            editDetail.AddressPalika = model.AddressPalika;
            editDetail.AddressWard = model.AddressWard;
            editDetail.DirectoryPhone = model.DirectoryPhone;
            editDetail.PAN = model.PAN;
            editDetail.VAT = model.VAT;
            editDetail.DirectoryPhone = model.DirectoryPhone;
            editDetail.ContactPersonName = model.ContactPersonName;
            editDetail.ContactPersonPhone = model.ContactPersonPhone;
            editDetail.Details = model.Details;
            editDetail.Email = model.Email;
            editDetail.PhotoLogo = model.PhotoLogo;
            ent.Entry(editDetail).State = System.Data.Entity.EntityState.Modified;
            ent.SaveChanges();
        }
        public List<DirectoryViewModel> GetList(int page, int pagesize)
        {
            List<DirectoryViewModel> result = (from a in ent.tblDirectoryItems
                                           join b in ent.tblDirectoryDetails on a.DirectoryItemId equals b.DirectoryItemId
                                           select new DirectoryViewModel
                                           {
                                               DirectoryItemId = a.DirectoryItemId,
                                               DirectoryItemName = a.DirectoryItemName,
                                               DirectoryCategoryId = a.DirectoryCategoryId,
                                               DirectorySubCategoryId = a.DirectorySubCategoryId,
                                               Specification = a.Specification,
                                               AddressState = b.AddressState,
                                               AddressDistrict = b.AddressDistrict,
                                               AddressPalika = b.AddressPalika,
                                               AddressWard = b.AddressWard,
                                               PhotoLogo = b.PhotoLogo
                                           }).OrderBy(x => x.DirectoryItemId).Skip((page - 1) * pagesize).Take(pagesize).ToList();
            return result;
        }
        public DirectoryViewModel GetDirectoryData(int Id)
        {
            DirectoryViewModel result = (from a in ent.tblDirectoryItems
                                     join b in ent.tblDirectoryDetails on a.DirectoryItemId equals b.DirectoryItemId
                                     where a.DirectoryItemId == Id
                                     select new DirectoryViewModel
                                     {
                                         DirectoryItemId = a.DirectoryItemId,
                                         DirectoryItemName = a.DirectoryItemName,
                                         DirectoryCategoryId = a.DirectoryCategoryId,
                                         DirectorySubCategoryId = a.DirectorySubCategoryId,
                                         IssueDate = a.IssueDate,
                                         Status = a.Status,
                                         Specification = a.Specification,

                                         DirectoryDetailsId = b.DirectoryDetailsId,
                                         MapDirectoryItemId = (int)b.DirectoryItemId,
                                         AddressState = b.AddressState,
                                         AddressDistrict = b.AddressDistrict,
                                         AddressPalika = b.AddressPalika,
                                         AddressWard = b.AddressWard,
                                         DirectoryPhone = b.DirectoryPhone,
                                         PAN = b.PAN,
                                         VAT = b.VAT,
                                         ContactPersonName = b.ContactPersonName,
                                         ContactPersonPhone = b.ContactPersonPhone,
                                         Details = b.Details,
                                         Email = b.Email,
                                         PhotoLogo = b.PhotoLogo
                                     }).SingleOrDefault();
            return result;
        }
    }
}