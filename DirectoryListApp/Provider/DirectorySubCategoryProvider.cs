using DirectoryListApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DirectoryListApp.Provider
{
    public class DirectorySubCategoryProvider
    {
        DirectoryEntities ent = new DirectoryEntities();
        public int GetTotalItemCount()
        {
            return ent.tblDirectorySubCategories.Count();
        }

        public List<DirectorySubCategoryModel> GetDirectorySubCategoryList(int page, int pagesize)
        {
            var model = new List<DirectorySubCategoryModel>();
            try
            {
                var collection = ent.tblDirectorySubCategories.OrderBy(x => x.DirectorySubCategoryId).Skip((page - 1) * pagesize).Take(pagesize);

                foreach (var item in collection)
                {
                    var data = new DirectorySubCategoryModel()
                    {
                        DirectorySubCategoryId = item.DirectorySubCategoryId,
                        DirectorySubCategoryName = item.DirectorySubCategoryName,
                        DirectoryCategoryId=item.DirectoryCategoryId

                    };
                    model.Add(data);
                }

            }
            catch (Exception ex)
            {

            }

            return model;
        }
        public List<DirectorySubCategoryModel> GetDirectorySubCategoryList(int? CategoryId, int page, int pagesize)
        {
            var model = new List<DirectorySubCategoryModel>();
            var collection = ent.tblDirectorySubCategories.Where(x => true);
            try
            {

                if (CategoryId != null)
                {
                    collection = collection.Where(x => x.DirectorySubCategoryId == CategoryId).OrderBy(x => x.DirectorySubCategoryId).Skip((page - 1) * pagesize).Take(pagesize);
                }
                else
                {
                    collection = collection.OrderBy(x => x.DirectorySubCategoryId).Skip((page - 1) * pagesize).Take(pagesize);
                }
                foreach (var item in collection)
                {
                    var data = new DirectorySubCategoryModel()
                    {
                        DirectorySubCategoryId = item.DirectorySubCategoryId,
                        DirectorySubCategoryName = item.DirectorySubCategoryName,
                        DirectoryCategoryId=item.DirectoryCategoryId
                    };
                    model.Add(data);
                }

            }
            catch (Exception ex)
            {

            }

            return model;
        }

        public DirectorySubCategoryModel GetDirectorySubCategoryData(int DirectorySubCategoryId)
        {
            var model = new DirectorySubCategoryModel();
            try
            {

                var item = ent.tblDirectorySubCategories.Single(x => x.DirectorySubCategoryId == DirectorySubCategoryId);
                model = new DirectorySubCategoryModel()
                {
                    DirectorySubCategoryId = item.DirectorySubCategoryId,
                    DirectorySubCategoryName = item.DirectorySubCategoryName,
                    DirectoryCategoryId = item.DirectoryCategoryId
                };
            }
            catch (Exception ex)
            {

            }


            return model;
        }

        public void Insert(DirectorySubCategoryModel model)
        {
            try
            {
                var objToSave = new tblDirectorySubCategory()
                {
                    DirectorySubCategoryId = model.DirectorySubCategoryId,
                    DirectorySubCategoryName = model.DirectorySubCategoryName,
                    DirectoryCategoryId = model.DirectoryCategoryId

                };
                //objToSave.CreatedBy = Utility.GetCurrentLoginUser();
                objToSave.CreatedDate = DateTime.Now.ToShortDateString().ToString();
                ent.tblDirectorySubCategories.Add(objToSave);
                ent.SaveChanges();
            }
            catch (Exception ex)
            {

            }

        }

        public void Update(DirectorySubCategoryModel model)
        {
            try
            {
                var objToEdit = ent.tblDirectorySubCategories.Single(x => x.DirectorySubCategoryId == model.DirectorySubCategoryId);
                objToEdit.DirectorySubCategoryId = model.DirectorySubCategoryId;
                objToEdit.DirectorySubCategoryName = model.DirectorySubCategoryName;
                objToEdit.DirectoryCategoryId = model.DirectoryCategoryId;

                //objToEdit.UpdatedBy = Utility.GetCurrentLoginUser();
                //objToEdit.UpdateDate = DateTime.Now.ToShortDateString().ToString();
                ent.Entry(objToEdit).State = System.Data.Entity.EntityState.Modified;
                ent.SaveChanges();
            }
            catch (Exception ex)
            {
                //Log.Error(string.Format("Error! on  Update InventoryItemCategoryData Data Auction  with error message: {0}",
                //    ex.Message));
                //Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));

            }

        }

        public void Delete(int Id)
        {
            try
            {
                var objToDelete = ent.tblDirectorySubCategories.Single(x => x.DirectorySubCategoryId == Id);
                ent.tblDirectorySubCategories.Remove(objToDelete);
                ent.SaveChanges();

            }
            catch (Exception ex)
            {
                //Log.Error(string.Format("Error! on  Delete InventoryItemCategoryData Data Auction  with error message: {0}",
                //   ex.Message));
                //Log.Error(string.Format("Error with exception: {0}", ex.StackTrace));
            }

        }
    }
}