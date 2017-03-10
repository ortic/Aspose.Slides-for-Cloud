using System;
using System.IO;

class Common
{
    public static string GetDataDir()
    {
        var parent = ((Directory.GetParent(Directory.GetCurrentDirectory()).Parent).Parent).Parent;
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