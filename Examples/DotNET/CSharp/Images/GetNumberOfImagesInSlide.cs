using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Images
{
    class GetNumberOfImagesInSlide
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample-input.pptx";
            int slideIndex = 3;
            String folder = "";
            String storage = "";

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.Slides Cloud SDK API to get number of images in a slide
                ImagesResponse apiResponse = slidesApi.GetSlidesSlideImages(fileName, slideIndex, folder, storage);

                if (apiResponse != null)
                {
                    int count = apiResponse.Images.List.Count;
                    Console.WriteLine("Total Images Found In Slide[3] :: " + count);
                    Console.WriteLine("Get Number of Images in a Slide, Done!");
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
