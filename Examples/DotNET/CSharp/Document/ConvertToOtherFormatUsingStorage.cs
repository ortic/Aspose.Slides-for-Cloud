using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Document
{
    class ConvertToOtherFormatUsingStorage
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH); 

            String name = "sample";
            String fileName = name + ".pptx";
            String password = "";
            String format = "pdf";
            String outPath = "";
            byte[] file = System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName);

            try
            {
                // Invoke Aspose.Slides Cloud SDK API to convert document to other format using storage
                ResponseMessage apiResponse = slidesApi.PutSlidesConvert(password, format, outPath, file);

                if (apiResponse != null)
                {
                    // Download appended document from storage server
                    System.IO.File.WriteAllBytes(Common.GetDataDir() + name + "." + format, apiResponse.ResponseStream);
                    Console.WriteLine("Convert PowerPoint Documents to other File Formats without Using Storage, Done!");
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
