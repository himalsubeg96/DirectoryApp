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
    
    public partial class tblDirectoryItem
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblDirectoryItem()
        {
            this.tblDirectoryDetails = new HashSet<tblDirectoryDetail>();
        }
    
        public int DirectoryItemId { get; set; }
        public string DirectoryItemName { get; set; }
        public Nullable<int> DirectoryCategoryId { get; set; }
        public Nullable<int> DirectorySubCategoryId { get; set; }
        public Nullable<System.DateTime> IssueDate { get; set; }
        public bool Status { get; set; }
        public string Specification { get; set; }
    
        public virtual tblDirectoryCategory tblDirectoryCategory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblDirectoryDetail> tblDirectoryDetails { get; set; }
        public virtual tblDirectorySubCategory tblDirectorySubCategory { get; set; }
    }
}
