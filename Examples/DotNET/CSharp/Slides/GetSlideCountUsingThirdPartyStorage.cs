using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Slides
{
    class GetSlideCountUsingThirdPartyStorage
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample-input.pptx";
            String folder = "";
            String storage = "dropboxstorage ";

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.Slides Cloud SDK API to get slide count using third party storage
                SlideListResponse apiResponse = slidesApi.GetSlidesSlidesList(fileName, folder, storage);

                if (apiResponse != null && apiResponse.Status.Equals("OK"))
                {
                    int count = apiResponse.Slides.SlideList.Count;
                    Console.WriteLine("Total Slides :: " + count);
                    Console.WriteLine("Get Slide Count Using Third Party Storage, Done!");
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
