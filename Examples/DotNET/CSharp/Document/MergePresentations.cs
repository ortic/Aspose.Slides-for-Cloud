using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Document
{
    class MergePresentations
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample.pptx";
            String storage = "";
            String folder = "";

            String mergeFile1 = "sample-input.pptx";
            String mergeFile2 = "demo.pptx";

            PresentationsMergeRequest body = new PresentationsMergeRequest();
            body.PresentationPaths = new System.Collections.Generic.List<string> { mergeFile1, mergeFile2 };

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));
                storageApi.PutCreate(mergeFile1, null, null, System.IO.File.ReadAllBytes(Common.GetDataDir() + mergeFile1));
                storageApi.PutCreate(mergeFile2, null, null, System.IO.File.ReadAllBytes(Common.GetDataDir() + mergeFile2));

                // Invoke Aspose.Slides Cloud SDK to merge PowerPoint presentations
                DocumentResponse apiResponse = slidesApi.PostPresentationMerge(fileName, storage, folder, body);

                if (apiResponse != null)
                {
                    // Download merged document from storage
                    Com.Aspose.Storage.Model.ResponseMessage storageRes = storageApi.GetDownload(fileName, null, null);
                    System.Diagnostics.Debug.WriteLine("response:" + storageRes.ResponseStream);
                    System.IO.File.WriteAllBytes(Common.GetDataDir() + fileName, storageRes.ResponseStream);
                    Console.WriteLine("Merge PowerPoint Presentations, Done!");
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
