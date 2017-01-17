using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Slides
{
    class SaveAsImageWithDefaultSizeUsingThirdPartyStorage
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String name = "sample-input";
            String fileName = name + ".pptx";
            int slideIndex = 3;
            String format = "jpeg";
            int? width = null;
            int? height = null;
            String folder = "";
            String storage = "dropboxstorage";

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.Slides Cloud SDK API to save slide as image with default size using third party storage
                ResponseMessage apiResponse = slidesApi.GetSlideWithFormat(fileName, slideIndex, format, width, height, folder, storage);

                if (apiResponse != null)
                {                    
                    System.IO.File.WriteAllBytes(Common.GetDataDir() + name + "." + format, apiResponse.ResponseStream);
                    Console.WriteLine("Save a Particular Slide as Image with Default Size Using Third Party Storage, Done!");
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
