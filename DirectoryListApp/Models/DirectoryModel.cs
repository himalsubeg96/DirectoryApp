using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DirectoryListApp.Models
{
    public class DirectoryModel
    {
        public int DirectoryItemId { get; set; }
        [DisplayName("Directory Name")]
        [Required(ErrorMessage = "*")]
        public string DirectoryItemName { get; set; }
        public Nullable<int> DirectoryCategoryId { get; set; }
        public Nullable<int> DirectorySubCategoryId { get; set; }
        public Nullable<System.DateTime> IssueDate { get; set; }
        public bool Status { get; set; }
        public string Specification { get; set; }
        //details
        public int DirectoryDetailsId { get; set; }
        public Nullable<int> MapDirectoryItemId { get; set; }
        [DisplayName("प्रदेश")]
        public Nullable<int> AddressState { get; set; }
        [DisplayName("जिल्ला")]
        public Nullable<int> AddressDistrict { get; set; }
        [DisplayName("न.पा/ग.पा")]
        public Nullable<int> AddressPalika { get; set; }
        [DisplayName("वडा नं.")]
        public Nullable<int> AddressWard { get; set; }
        [DisplayName("फोन नं")]
        public string DirectoryPhone { get; set; }
        [DisplayName("TPIN/PAN")]
        public string PAN { get; set; }
        [DisplayName("करदाता नं")]
        public string VAT { get; set; }
        [DisplayName("नाम")]
        public string ContactPersonName { get; set; }
        [DisplayName("फोन नं")]
        public string ContactPersonPhone { get; set; }
        [DisplayName("विवरण")]
        public string Details { get; set; }
        public string Email { get; set; }
        [DisplayName("स्थायी ठेगाना")]
        public string PermanentAddress { get { return Utility.GetPalikaName(Convert.ToInt32(AddressPalika)) + "-" + AddressWard + ", " + Utility.GetDistrictName(Convert.ToInt32(AddressDistrict)) + ", " + Utility.GetStateName(Convert.ToInt32(AddressState)); } }
        public List<DirectoryModel> DirectoryModelList { get; set; }
    }
    public class DirectoryCategoryModel
    {
        public int DirectoryCategoryId { get; set; }
        [DisplayName("श्रेणी")]
        public string DirectoryCategoryName { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public List<DirectoryCategoryModel> DirectoryCategoryModelList { get; set; }
    }
    public class DirectorySubCategoryModel
    {
        public int DirectorySubCategoryId { get; set; }
        [DisplayName("उप-श्रेणी")]
        public string DirectorySubCategoryName { get; set; }
        public Nullable<int> DirectoryCategoryId { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public List<DirectorySubCategoryModel> DirectorySubCategoryModelList { get; set; }
    }

}