using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Text
{
    class GetAllTextItemsFromSlideUsingThirdPartyStorage
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample-input.pptx";
            int slideIndex = 1;
            Boolean withEmpty = false;
            String folder = "";
            String storage = "dropboxstorage";


            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.PDF Cloud SDK API to get all text items from a slide using third party storage
                TextItemsResponse apiResponse = slidesApi.GetSlidesSlideTextItems(fileName, slideIndex, withEmpty, folder, storage);

                if (apiResponse != null && apiResponse.Status.Equals("OK"))
                {
                    foreach (TextItem textItem in apiResponse.TextItems.Items)
                    {
                        Console.WriteLine("Text :: " + textItem.Text);
                    }
                    Console.WriteLine("Get All Text Items from a Slide Using Third Party Storage, Done!");
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
