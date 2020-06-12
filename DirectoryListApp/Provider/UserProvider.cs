using DirectoryListApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
namespace DirectoryListApp.Provider
{
    public class UserProvider
    {
        public UserModel GetUserDetails()
        {
            using (var con = new DirectoryEntities())
            {
                var userId = HttpContext.Current.User.Identity.GetUserId();
                var email = HttpContext.Current.User.Identity.GetUserName();
                var baseUrl = Utility.GetUrlForImage();
                var user = con.UsersDetails.Where(x => x.UserId == userId)
                    .Select(x => new UserModel()
                    {
                        Id = x.Id,
                        FullName = x.FullName,
                        PhoneNo = x.ContactNo,
                        Email = email,
                        Image = baseUrl + x.Image,
                    }).FirstOrDefault();
                return user;
            }
        }

        public bool InsertUpdateUserDetails(UserModel model)
        {
            try
            {
                using (var con = new DirectoryEntities())
                {
                    var userId = HttpContext.Current.User.Identity.GetUserId();
                    var user = con.UsersDetails.Where(x => x.Id == model.Id || x.UserId == userId).FirstOrDefault();
                    if (user != null)
                    {
                        user.FullName = model.FullName;
                        user.ContactNo = model.PhoneNo;
                        user.Email = model.Email;
                        if (model.Image != null)
                            user.Image = model.Image;

                        con.Entry(user).State =System.Data.Entity.EntityState.Modified;
                        con.SaveChanges();
                    }
                    else
                    {
                        UsersDetail usersDetail = new UsersDetail()
                        {
                            Id = Guid.NewGuid(),
                            FullName = model.FullName,
                            ContactNo = model.PhoneNo,
                            UserId = userId,
                            Email=model.Email,
                            Image = model.Image,
                        };
                        con.UsersDetails.Add(usersDetail);
                        con.SaveChanges();
                    }

                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}