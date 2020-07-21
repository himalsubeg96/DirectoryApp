using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DirectoryListApp.Areas.Directory.Models
{
   
        public class DirectoryModel
        {
            public int DirectoryItemId { get; set; }
            [DisplayName("Directory Name")]
            [Required(ErrorMessage = "*")]
            public string DirectoryItemName { get; set; }
            public Nullable<int> DirectoryCategoryId { get; set; }
            public Nullable<int> DirectorySubCategoryId { get; set; }
        public string IssueDate { get; set; }
        public bool Status { get; set; }
            public string Specification { get; set; }
            //details
            public int DirectoryDetailsId { get; set; }
            public Nullable<int> MapDirectoryItemId { get; set; }
            [DisplayName("State")]
            public Nullable<int> AddressState { get; set; }
            [DisplayName("District")]
            public Nullable<int> AddressDistrict { get; set; }
            [DisplayName("Municipality")]
            public Nullable<int> AddressPalika { get; set; }
            [DisplayName("Ward No.")]
            public Nullable<int> AddressWard { get; set; }
            [DisplayName("Phone No")]
            public string DirectoryPhone { get; set; }
            [DisplayName("TPIN/PAN")]
            public string PAN { get; set; }
            [DisplayName("VAT")]
            public string VAT { get; set; }
            [DisplayName("Contact Person Name")]
            public string ContactPersonName { get; set; }
            [DisplayName("Contact Person Phone")]
            public string ContactPersonPhone { get; set; }
            [DisplayName("Details")]
            public string Details { get; set; }
            public string Email { get; set; }
            public string PhotoLogo { get; set; }
            [DisplayName("Permanent Address")]
            public string PermanentAddress { get { return Utility.GetPalikaName(Convert.ToInt32(AddressPalika)) + "-" + AddressWard + ", " + Utility.GetDistrictName(Convert.ToInt32(AddressDistrict)) + ", " + Utility.GetStateName(Convert.ToInt32(AddressState)); } }
            public List<DirectoryModel> DirectoryModelList { get; set; }

        //reviews
        }
        public class DirectoryCategoryModel
        {
            public int DirectoryCategoryId { get; set; }
            [DisplayName("Category Name")]
            public string DirectoryCategoryName { get; set; }
            public Nullable<int> CreatedBy { get; set; }
            public string CreatedDate { get; set; }
            public List<DirectoryCategoryModel> DirectoryCategoryModelList { get; set; }
        }
        public class DirectorySubCategoryModel
        {
            public int DirectorySubCategoryId { get; set; }
            [DisplayName("Sub Category Name")]
            public string DirectorySubCategoryName { get; set; }
            public Nullable<int> DirectoryCategoryId { get; set; }
            public Nullable<int> CreatedBy { get; set; }
            public string CreatedDate { get; set; }
            public List<DirectorySubCategoryModel> DirectorySubCategoryModelList { get; set; }
        }
    
}