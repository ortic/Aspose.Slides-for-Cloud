using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Document_Properties
{
    class GetProperties
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample-input.pptx";
            String folder = "";
            String storage = "";

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.Slides Cloud SDK API to get document properties
                DocumentPropertiesResponse apiResponse = slidesApi.GetSlidesDocumentProperties(fileName, folder, storage);

                if (apiResponse != null && apiResponse.Status.Equals("OK"))
                {
                    foreach (DocumentProperty docProperty in apiResponse.DocumentProperties.List)
                    {
                        Console.WriteLine(docProperty.Name + " :: " + docProperty.Value);
                    }
                    Console.WriteLine("Get Document Properties, Done!");
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
