using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Slides
{
    class GetComments
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample-input.pptx";
            int slideIndex = 1;
            String folder = "";
            String storage = "";

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.Slides Cloud SDK API to get comments of a slide
                SlideCommentsResponse apiResponse = slidesApi.GetSlidesSlideComments(fileName, slideIndex, folder, storage);

                if (apiResponse != null && apiResponse.Status.Equals("OK"))
                {
                    SlideComments slideComments = apiResponse.SlideComments;

                    foreach (SlideComment slideComment in slideComments.List)
                    {
                        Console.WriteLine("Author :: " + slideComment.Author);
                        Console.WriteLine("Text :: " + slideComment.Text);
                    }
                    Console.WriteLine("Get Comments of a PowerPoint Slide, Done!");
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
