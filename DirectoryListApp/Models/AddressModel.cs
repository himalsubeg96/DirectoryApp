using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DirectoryListApp.Models
{
    public class AddressModel
    {
    }
    public class StateModel
    {
        public int StateId { get; set; }
        public Nullable<int> StateId_val { get; set; }
        public string StateName { get; set; }
        public string StateName_Nep { get; set; }
    }
    public class DistrictModel
    {
        public int DistrictId { get; set; }
        public Nullable<int> DistrictId_val { get; set; }
        public string DistrictName { get; set; }
        public Nullable<int> StateId_val { get; set; }
        public string DistrictName_Nep { get; set; }

    }
    public class LocalLevelModel
    {
        public int PalikaId { get; set; }
        public int PalikaId_val { get; set; }
        public Nullable<int> DistrictId { get; set; }
        public string PalikaName { get; set; }
        public string PalikaName_Nep { get; set; }
    }
}