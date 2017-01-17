using System;
using System.IO;

    class Common
    {
        public static string APP_SID = "6dd37866-34c8-4449-9331-befa3e86bd6f";
        public static string APP_KEY = "1ddbe7208305c55333e690284419cd2b";
        public static string FOLDER = "";
        public static string STORAGE = "";
        public static string BASEPATH = "http://api.aspose.cloud/v1.1";
        // public static string BASEPATH = "http://localhost:8080/v1.1";
        public static string OUTFOLDER = "C://temp/";

        public static string GetDataDir()
        {
            var parent = Directory.GetParent(Directory.GetCurrentDirectory()).Parent;
            string startDirectory = null;
            if (parent != null)
            {
                var directoryInfo = parent.Parent;
                if (directoryInfo != null)
                {
                    startDirectory = directoryInfo.FullName;
                }
            }
            else
            {
                startDirectory = parent.FullName;
            }
            return Path.Combine(startDirectory, "Data\\");
        }
      
    }

