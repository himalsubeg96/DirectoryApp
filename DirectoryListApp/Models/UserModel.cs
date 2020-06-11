using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DirectoryListApp.Models
{
    public class UserModel
    {
        public System.Guid Id { get; set; }
        public string FullName { get; set; }
        public string PhoneNo { get; set; }
        public string Image { get; set; }
        public string Email { get; set; }
    }
}