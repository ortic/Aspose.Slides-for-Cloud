using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Text
{
    class GetAllTextItems
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample-input.pptx";
            bool withEmpty = false;
            String folder = "";
            String storage = "";


            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.Slides Cloud SDK API to get all text items from a presentation
                TextItemsResponse apiResponse = slidesApi.GetSlidesPresentationTextItems(fileName, withEmpty, folder, storage);

                if (apiResponse != null && apiResponse.Status.Equals("OK"))
                {
                    foreach (TextItem textItem in apiResponse.TextItems.Items)
                    {
                        Console.WriteLine("Text :: " + textItem.Text);
                    }
                    Console.WriteLine("Get All Text Items from a Presentation, Done!");
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
