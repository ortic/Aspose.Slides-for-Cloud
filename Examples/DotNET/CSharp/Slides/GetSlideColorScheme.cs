using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Slides
{
    class GetSlideColorScheme
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "demo.pptx";
            int slideIndex = 1;
            String folder = "";
            String storage = "";

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.Slides Cloud SDK API to get slide color scheme
                ColorSchemeResponse apiResponse = slidesApi.GetSlidesThemeColorScheme(fileName, slideIndex, folder, storage);

                if (apiResponse != null && apiResponse.Status.Equals("OK"))
                {
                    ColorScheme colorScheme = apiResponse.ColorScheme;
                    Console.WriteLine("Accent1 : " + colorScheme.Accent1);
                    Console.WriteLine("Accent3 : " + colorScheme.Accent2);
                    Console.WriteLine("Dark1 : " + colorScheme.Dark1);
                    Console.WriteLine("Dark2 : " + colorScheme.Dark2);
                    Console.WriteLine("Light1 : " + colorScheme.Light1);
                    Console.WriteLine("Get Color Scheme of a PowerPoint Slide, Done!");
                    Console.ReadKey();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("error:" + ex.Message + "\n" + ex.StackTrace);

            }            
            // ExEnd:1
        }
    }
}
