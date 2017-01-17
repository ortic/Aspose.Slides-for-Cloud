using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Text
{
    class ReplaceAllInstancesInPresentation
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample-input.pptx";
            String oldValue = "aspose";
            String newValue = "aspose2";
            bool ignoreCase = true;
            String folder = "";
            String storage = "";

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.Slides Cloud SDK API to get all text instances from presentation
                PresentationStringReplaceResponse apiResponse = slidesApi.PostSlidesPresentationReplaceText(fileName, oldValue, newValue, ignoreCase, folder, storage);

                if (apiResponse != null && apiResponse.Status.Equals("OK"))
                {
                    // Download updated presentation from cloud storage
                    Com.Aspose.Storage.Model.ResponseMessage storageRes = storageApi.GetDownload(fileName, null, null);
                    System.Diagnostics.Debug.WriteLine("response:" + storageRes.ResponseStream);
                    System.IO.File.WriteAllBytes(Common.GetDataDir() + fileName, storageRes.ResponseStream);
                    Console.WriteLine("Replace All Text Instances in a Presentation, Done!");
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
