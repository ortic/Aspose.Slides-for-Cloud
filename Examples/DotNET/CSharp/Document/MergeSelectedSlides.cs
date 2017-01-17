using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Document
{
    class MergeSelectedSlides
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample.pptx";
            String storage = "";
            String folder = "";

            String mergeFile1 = "test_slide.pptx";
            String mergeFile2 = "demo.pptx";

            OrderedMergeRequest body = new OrderedMergeRequest();
            PresentationToMerge ptm1 = new PresentationToMerge(); ptm1.Path = mergeFile1;
            PresentationToMerge ptm2 = new PresentationToMerge(); ptm2.Path = mergeFile2;
            body.Presentations = new System.Collections.Generic.List<PresentationToMerge> { ptm1, ptm2 };

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));
                storageApi.PutCreate(mergeFile1, null, null, System.IO.File.ReadAllBytes(Common.GetDataDir() + mergeFile1));
                storageApi.PutCreate(mergeFile2, null, null, System.IO.File.ReadAllBytes(Common.GetDataDir() + mergeFile2));

                // Invoke Aspose.Slides Cloud SDK API to merge selected slides
                DocumentResponse apiResponse = slidesApi.PutPresentationMerge(fileName, storage, folder, body);

                if (apiResponse != null)
                {
                    // Download document from storage server
                    Com.Aspose.Storage.Model.ResponseMessage storageRes = storageApi.GetDownload(fileName, null, null);
                    System.Diagnostics.Debug.WriteLine("response:" + storageRes.ResponseStream);
                    System.IO.File.WriteAllBytes(Common.GetDataDir() + fileName, storageRes.ResponseStream);
                    Console.WriteLine("Merge Selected Slides of PowerPoint Presentations, Done!");
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
