using DirectoryListApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DirectoryListApp.Provider
{
    public class DirectoryItemProvider
    {
        DirectoryEntities ent = new DirectoryEntities();
        public int GetTotalItemCount()
        {
            return ent.tblDirectoryItems.Count();
        }
        public void Insert(DirectoryModel model)
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
                AddressWard=model.AddressWard,
                DirectoryPhone = model.DirectoryPhone,
                PAN = model.PAN,
                VAT = model.VAT,
                ContactPersonName = model.ContactPersonName,
                ContactPersonPhone = model.ContactPersonPhone,
                Details = model.Details,
                Email = model.Email
            };
            ent.tblDirectoryDetails.Add(addDetail);
            ent.SaveChanges();
        }
        public void Update(DirectoryModel model)
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
            ent.Entry(editDetail).State = System.Data.Entity.EntityState.Modified;
            ent.SaveChanges();
        }
        public List<DirectoryModel> GetList(int page, int pagesize)
        {
            List<DirectoryModel> result = (from a in ent.tblDirectoryItems
                                          join b in ent.tblDirectoryDetails on a.DirectoryItemId equals b.DirectoryItemId
                                          select new DirectoryModel
                                          {
                                              DirectoryItemId = a.DirectoryItemId,
                                              DirectoryItemName = a.DirectoryItemName,
                                              DirectoryCategoryId = a.DirectoryCategoryId, 
                                              DirectorySubCategoryId = a.DirectorySubCategoryId,
                                              Specification = a.Specification,
                                              AddressState = b.AddressState,
                                              AddressDistrict = b.AddressDistrict,
                                              AddressPalika = b.AddressPalika,
                                              AddressWard=b.AddressWard
                                          }).OrderBy(x => x.DirectoryItemId).Skip((page - 1) * pagesize).Take(pagesize).ToList();
            return result;
        }
        public DirectoryModel GetDirectoryData(int Id)
        {
            DirectoryModel result = (from a in ent.tblDirectoryItems
                                     join b in ent.tblDirectoryDetails on a.DirectoryItemId equals b.DirectoryItemId
                                     where a.DirectoryItemId == Id
                                     select new DirectoryModel {
                                         DirectoryItemId = a.DirectoryItemId,
                                         DirectoryItemName = a.DirectoryItemName,
                                         DirectoryCategoryId = a.DirectoryCategoryId,
                                         DirectorySubCategoryId = a.DirectorySubCategoryId,
                                         IssueDate = a.IssueDate,
                                         Status = a.Status,
                                         Specification = a.Specification,

                                         DirectoryDetailsId = b.DirectoryDetailsId,
                                         MapDirectoryItemId =(int) b.DirectoryItemId,
                                         AddressState = b.AddressState,
                                         AddressDistrict = b.AddressDistrict,
                                         AddressPalika = b.AddressPalika,
                                         AddressWard=b.AddressWard,
                                         DirectoryPhone = b.DirectoryPhone,
                                         PAN = b.PAN,
                                         VAT = b.VAT,
                                         ContactPersonName = b.ContactPersonName,
                                         ContactPersonPhone = b.ContactPersonPhone,
                                         Details = b.Details,
                                         Email = b.Email
                                     }).SingleOrDefault();
            return result;
        }
    }
}