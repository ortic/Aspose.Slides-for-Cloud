using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Document_Properties
{
    class SetProperty
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample-input.pptx";
            String propertyName = "Author";
            String folder = "";
            String storage = "";
            DocumentProperty body = new DocumentProperty();
            body.Name = "Author";
            body.Value = "Naeem Akram";
            body.BuiltIn = true;

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.Slides Cloud SDK API to set document property
                DocumentPropertyResponse apiResponse = slidesApi.PutSlidesSetDocumentProperty(fileName, propertyName, folder, storage, body);

                if (apiResponse != null && apiResponse.Status.Equals("OK"))
                {
                    DocumentProperty docProperty = apiResponse.DocumentProperty;
                    Console.WriteLine(docProperty.Name + " :: " + docProperty.Value);
                    Console.WriteLine("Set Document Properties, Done!");
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
