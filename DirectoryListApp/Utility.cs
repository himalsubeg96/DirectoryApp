﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DirectoryListApp
{
    public class Utility
    {
        public static int PageSize { get { return 25; } }
        public static SelectList GetAllDistrict()
        {
            using (var ent = new DirectoryEntities())
            {
                return new SelectList(ent.tblDistricts.ToList(), "DistrictId_val", "DistrictName_Nep");
            }
        }
        public static string GetDistrictById(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblDistricts.Where(x => x.DistrictId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.DistrictName_Nep;
                else
                    return "";
            }
        }
        public static string GetDistrictName(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblDistricts.Where(x => x.DistrictId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.DistrictName;
                else
                    return "";
            }
        }

        public static SelectList GetAllState()
        {
            using (var ent = new DirectoryEntities())
            {
                return new SelectList(ent.tblStates.ToList(), "StateId_val", "StateName_Nep");
            }
        }
        public static string GetStateById(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblStates.Where(x => x.StateId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.StateName_Nep;
                else
                    return "";
            }
        }
        public static string GetStateName(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblStates.Where(x => x.StateId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.StateName;
                else
                    return "";
            }
        }
        public static SelectList GetAllPalika()
        {
            using (var ent = new DirectoryEntities())
            {
                return new SelectList(ent.tblPalikas.ToList(), "PalikaId_val", "PalikaName_Nep");
            }
        }
        public static string GetPalikaById(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblPalikas.Where(x => x.PalikaId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.PalikaName_Nep;
                else
                    return "";
            }
        }
        public static string GetPalikaName(int? id)
        {
            using (var ent = new DirectoryEntities())
            {
                var obj = ent.tblPalikas.Where(x => x.PalikaId_val == id).SingleOrDefault();
                if (obj != null)
                    return obj.PalikaName;
                else
                    return "";
            }
        }
    }
}