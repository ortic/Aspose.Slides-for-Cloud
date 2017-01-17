using System;
using Com.Aspose.Slides.Api;
using Com.Aspose.Slides.Model;
using Com.Aspose.Storage.Api;

namespace Document
{
    class SplitPresentation
    {
        public static void Run()
        {
            // ExStart:1
            SlidesApi slidesApi = new SlidesApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            String fileName = "sample-input.pptx";
            int? width = null;
            int? height = null;
            int? from = 2;
            int? to = 3;
            String destFolder = "";
            String format = "png";
            String storage = "";
            String folder = "";

            try
            {
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(fileName, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + fileName));

                // Invoke Aspose.Slides Cloud SDK API to split powerpoint presentations
                SplitDocumentResponse apiResponse = slidesApi.PostSlidesSplit(fileName, width, height, to, from, destFolder, format, storage, folder);

                if (apiResponse != null)
                {
                    foreach (ResourceUri slideUri in apiResponse.SplitResult.Slides)
                    {
                        System.Diagnostics.Debug.WriteLine("SlideHref:" + slideUri.Href.Substring(slideUri.Href.LastIndexOf('/') + 1, (slideUri.Href.Length - slideUri.Href.LastIndexOf('/')) - 1));
                        String slidName = slideUri.Href.Substring(slideUri.Href.LastIndexOf('/') + 1, (slideUri.Href.Length - slideUri.Href.LastIndexOf('/')) - 1);
                        // Download document from storage server
                        Com.Aspose.Storage.Model.ResponseMessage storageRes = storageApi.GetDownload(slidName, null, null);
                        System.Diagnostics.Debug.WriteLine("response:" + storageRes.ResponseStream);
                        System.IO.File.WriteAllBytes(Common.GetDataDir() + slidName, storageRes.ResponseStream);
                    }
                    Console.WriteLine("Split PowerPoint Presentations, Done!");
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
