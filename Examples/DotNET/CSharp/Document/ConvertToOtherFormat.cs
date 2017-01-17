using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Document
{
    class ConvertToOtherFormat
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String name = "sample";
            String fileName = name + ".pptx";
            String format = "tiff";
            String jpegQuality = null;
            String password = "";
            String storage = "";
            String folder = "";
            String outPath = "";

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.Slides Cloud SDK API to convert document to other format
                ResponseMessage apiResponse = slidesApi.GetSlidesDocumentWithFormat(fileName, format, jpegQuality, password, storage, folder, outPath);

                if (apiResponse != null)
                {
                    // Download appended document from storage server
                    System.IO.File.WriteAllBytes(Common.GetDataDir() + name + "." + format, apiResponse.ResponseStream);
                    Console.WriteLine("Convert PowerPoint Documents to other File Formats, Done!");
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
