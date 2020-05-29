using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DirectoryListApp.Converter
{
    public class UnicodeConverter
    {
        public static string Default(object Input)
        {
            if (Input == null)
                return "";

            string Value = Input.ToString().Trim();

            var collection = Value.ToArray();
            string Unicode = "";

            foreach (var item in collection)
            {
                Unicode += ConvertToUnicode(item.ToString());
            }
            return Unicode;
        }


        public static string ToEnglish(string Value)
        {
            if (string.IsNullOrEmpty(Value))
                return "";

            var collection = Value.ToArray();
            string Unicode = "";

            foreach (var item in collection)
            {
                Unicode += ConvertToEnglish(item.ToString());
            }
            return Unicode;
        }
        public static string Currency(object Input)
        {
            if (Input == null)
                return "";

            string Number = Input.ToString().Trim();

            if (Number.Length == 0)
                return "";

            var data = Number.Trim().Split(new char[] { '.' });
            string RecUnicodeWholeNumber = "", RecUnicodeDecimalNumber = "";

            var ReverseData = data[0].ToArray().Reverse();
            int count = 1;
            bool isFirst = true;
            foreach (var item in ReverseData)
            {
                RecUnicodeWholeNumber += ConvertToUnicode(item.ToString());
                if (count == 3 && isFirst == true)
                {
                    RecUnicodeWholeNumber += ",";
                    isFirst = false;
                    count = 0;
                }
                if (count == 2 && isFirst == false)
                {
                    RecUnicodeWholeNumber += ",";
                    count = 0;
                }
                count++;
            }

            var collection = RecUnicodeWholeNumber.Reverse();
            string UnicodeNumber = "";

            foreach (var item in collection)
            {
                UnicodeNumber += item;
            }

            UnicodeNumber = UnicodeNumber.TrimStart(new char[] { ',' });

            if (data.Length == 2)
            {
                RecUnicodeDecimalNumber = ".";
                foreach (var item in data[1])
                {
                    RecUnicodeDecimalNumber += ConvertToUnicode(item.ToString());
                }
            }
            return UnicodeNumber + RecUnicodeDecimalNumber;
        }

        private static string ConvertToUnicode(string Number)
        {
            string Unicode = "";
            if (Number == "1")
                Unicode = "१";
            else if (Number == "2")
                Unicode = "२";
            else if (Number == "3")
                Unicode = "३";
            else if (Number == "4")
                Unicode = "४";
            else if (Number == "5")
                Unicode = "५";
            else if (Number == "6")
                Unicode = "६";
            else if (Number == "7")
                Unicode = "७";
            else if (Number == "8")
                Unicode = "८";
            else if (Number == "9")
                Unicode = "९";
            else if (Number == "0")
                Unicode = "०";
            else
                return Number;

            return Unicode;
        }
        private static string ConvertToEnglish(string Number)
        {
            string Unicode = "";
            if (Number == "१")
                Unicode = "1";
            else if (Number == "२")
                Unicode = "2";
            else if (Number == "३")
                Unicode = "3";
            else if (Number == "४")
                Unicode = "4";
            else if (Number == "५")
                Unicode = "5";
            else if (Number == "६")
                Unicode = "6";
            else if (Number == "७")
                Unicode = "7";
            else if (Number == "८")
                Unicode = "८";
            else if (Number == "९")
                Unicode = "9";
            else if (Number == "०")
                Unicode = "0";
            else
                return Number;

            return Unicode;
        }
    }
}