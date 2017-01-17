using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Document
{
    class CreateEmptyPresentation
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample_empty_" + new Random().Next(100) + ".pptx";
            String password = "";
            String storage = "";
            String folder = "";
            byte[] file = System.IO.File.ReadAllBytes(Common.GetDataDir() + "sample.pptx");

            try
            {
                // Invoke Aspose.Slides Cloud SDK API to create empty presentation
                ResponseMessage apiResponse = slidesApi.PutNewPresentation(fileName, password, storage, folder, file);

                if (apiResponse != null)
                {
                    // Download document from storage server
                    Com.Aspose.Storage.Model.ResponseMessage storageRes = storageApi.GetDownload(fileName, null, null);
                    System.Diagnostics.Debug.WriteLine("response:" + storageRes.ResponseStream);
                    System.IO.File.WriteAllBytes(Common.GetDataDir() + fileName, storageRes.ResponseStream);
                    Console.WriteLine("Create Empty PowerPoint Presentation, Done!");
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
