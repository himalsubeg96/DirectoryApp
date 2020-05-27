using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DirectoryListApp.Models
{
    public class DirectoryModel
    {
        public int DirectoryItemId { get; set; }
        public string DirectoryItemName { get; set; }
        public Nullable<int> DirectoryCategoryId { get; set; }
        public Nullable<int> DirectorySubCategoryId { get; set; }
        public Nullable<System.DateTime> IssueDate { get; set; }
        public bool Status { get; set; }
        public string Specification { get; set; }
        //details
        public int DirectoryDetailsId { get; set; }
        public Nullable<int> MapDirectoryItemId { get; set; }
        public Nullable<int> AddressState { get; set; }
        public Nullable<int> AddressDistrict { get; set; }
        public Nullable<int> AddressPalika { get; set; }
        public string DirectoryPhone { get; set; }
        public string PAN { get; set; }
        public string VAT { get; set; }
        public string ContactPersonName { get; set; }
        public string ContactPersonPhone { get; set; }
        public string Details { get; set; }
        public string Email { get; set; }
        public List<DirectoryModel> DirectoryModelList { get; set; }
    }
    public class DirectoryCategoryModel
    {
        public int DirectoryCategoryId { get; set; }
        public string DirectoryCategoryName { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public List<DirectoryCategoryModel> DirectoryCategoryModelList { get; set; }
    }
    public class DirectorySubCategoryModel
    {
        public int DirectorySubCategoryId { get; set; }
        public string DirectorySubCategoryName { get; set; }
        public Nullable<int> DirectoryCategoryId { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public List<DirectorySubCategoryModel> DirectorySubCategoryModelList { get; set; }
    }

}