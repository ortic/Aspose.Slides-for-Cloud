using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Slides
{
    class GetSlideFontScheme
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

                // Invoke Aspose.Slides Cloud SDK API to get slide font scheme
                FontSchemeResponse apiResponse = slidesApi.GetSlidesThemeFontScheme(fileName, slideIndex, folder, storage);

                if (apiResponse != null && apiResponse.Status.Equals("OK"))
                {
                    FontScheme fontScheme = apiResponse.FontScheme;
                    Console.WriteLine("Name: " + fontScheme.Name);
                    Console.WriteLine("ComplexScript (heading part) : " + fontScheme.Major.ComplexScript);
                    Console.WriteLine("EastAsian (heading part) : " + fontScheme.Major.EastAsian);
                    Console.WriteLine("Latin (heading part) : " + fontScheme.Major.Latin);
                    Console.WriteLine("ComplexScript (body part) : " + fontScheme.Minor.ComplexScript);
                    Console.WriteLine("EastAsian (body part) : " + fontScheme.Minor.EastAsian);
                    Console.WriteLine("Latin (body part) : " + fontScheme.Minor.Latin);
                    Console.WriteLine("Get Font Scheme of a PowerPoint Slide, Done!");
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
