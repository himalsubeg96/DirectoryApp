using DirectoryListApp.Areas.Directory.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static DirectoryListApp.Areas.Directory.Models.DirectoryModel;

namespace DirectoryListApp.Areas.Directory.Providers
{
    public class DirectoryCategoryProvider
    {
        DirectoryEntities ent = new DirectoryEntities();
        public int GetTotalItemCount()
        {
            return ent.tblDirectoryCategories.Count();
        }

        public List<DirectoryCategoryModel> GetDirectoryCategoryList(int page, int pagesize)
        {
            var model = new List<DirectoryCategoryModel>();
            try
            {
                var collection = ent.tblDirectoryCategories.OrderBy(x => x.DirectoryCategoryId).Skip((page - 1) * pagesize).Take(pagesize);

                foreach (var item in collection)
                {
                    var data = new DirectoryCategoryModel()
                    {
                        DirectoryCategoryId = item.DirectoryCategoryId,
                        DirectoryCategoryName = item.DirectoryCategoryName,

                    };
                    model.Add(data);
                }

            }
            catch (Exception ex)
            {

            }

            return model;
        }
        public List<DirectoryCategoryModel> GetDirectoryCategoryList(int? CategoryId, int page, int pagesize)
        {
            var model = new List<DirectoryCategoryModel>();
            var collection = ent.tblDirectoryCategories.Where(x => true);
            try
            {

                if (CategoryId != null)
                {
                    collection = collection.Where(x => x.DirectoryCategoryId == CategoryId).OrderBy(x => x.DirectoryCategoryId).Skip((page - 1) * pagesize).Take(pagesize);
                }
                else
                {
                    collection = collection.OrderBy(x => x.DirectoryCategoryId).Skip((page - 1) * pagesize).Take(pagesize);
                }
                foreach (var item in collection)
                {
                    var data = new DirectoryCategoryModel()
                    {
                        DirectoryCategoryId = item.DirectoryCategoryId,
                        DirectoryCategoryName = item.DirectoryCategoryName,
                    };
                    model.Add(data);
                }

            }
            catch (Exception ex)
            {

            }

            return model;
        }

        public DirectoryCategoryModel GetDirectoryCategoryData(int DirectoryCategoryId)
        {
            var model = new DirectoryCategoryModel();
            try
            {

                var item = ent.tblDirectoryCategories.Single(x => x.DirectoryCategoryId == DirectoryCategoryId);
                model = new DirectoryCategoryModel()
                {
                    DirectoryCategoryId = item.DirectoryCategoryId,
                    DirectoryCategoryName = item.DirectoryCategoryName,
                };
            }
            catch (Exception ex)
            {

            }


            return model;
        }

        public void Insert(DirectoryCategoryModel model)
        {
            try
            {
                var objToSave = new tblDirectoryCategory()
                {
                    DirectoryCategoryId = model.DirectoryCategoryId,
                    DirectoryCategoryName = model.DirectoryCategoryName,

                };
                //objToSave.CreatedBy = Utility.GetCurrentLoginUser();
                objToSave.CreatedDate = DateTime.Now.ToShortDateString().ToString();
                ent.tblDirectoryCategories.Add(objToSave);
                ent.SaveChanges();
            }
            catch (Exception ex)
            {

            }

        }

        public void Update(DirectoryCategoryModel model)
        {
            try
            {
                var objToEdit = ent.tblDirectoryCategories.Single(x => x.DirectoryCategoryId == model.DirectoryCategoryId);
                objToEdit.DirectoryCategoryId = model.DirectoryCategoryId;
                objToEdit.DirectoryCategoryName = model.DirectoryCategoryName;

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
                var objToDelete = ent.tblDirectoryCategories.Single(x => x.DirectoryCategoryId == Id);
                ent.tblDirectoryCategories.Remove(objToDelete);
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