//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DirectoryListApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblDirectoryDetail
    {
        public int DirectoryDetailsId { get; set; }
        public Nullable<int> DirectoryItemId { get; set; }
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
    
        public virtual tblDirectoryItem tblDirectoryItem { get; set; }
    }
}