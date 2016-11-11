using System;
using System.Collections.Generic;
using System.Text;
using Com.Aspose.Slides.Api;
using Com.Aspose.Storage.Api;
using Com.Aspose.Slides.Model;
namespace AsposeSlides
{
    class slides
    {
        public static void Main(String[] args)
        {

            string APIKEY = "xxxxx";
            string APPSID = "xxxxx";
            string BASEPATH = "http://api.aspose.cloud/v1.1";


            try
            {

                SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
                StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);


                //string name = "slide_" + new Random().Next(100) + ".pptx";
                //string password = null;
                //string storage = null;
                //string folder = null;
                //byte[] file = System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + "test_slide.pptx");
                ////System.Diagnostics.Debug.WriteLine("-------------working......");
                //ResponseMessage actual;
                //actual = target.PutNewPresentation(name, password, storage, folder, file);


                string name = "test_slide.pptx";
                int? slideIndex = 1;
                int? shapeIndex = 1;
                int? paragraphIndex = 1;
                int? portionIndex = 1;
                string folder = null;
                string storage = null;

                Portion body = new Portion();
                body.Text = "Newer value";
                body.FontColor = "#FFFF0000";

                storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name));

                ResponseMessage actual;
                actual = target.PutSetParagraphPortionProperties(name, slideIndex, shapeIndex, paragraphIndex, portionIndex, folder, storage, body);




                System.Diagnostics.Debug.WriteLine("-------------working......"+actual);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("--------------------------------\nException:" + ex.Message + "\n" + ex.StackTrace);
            }

        }
    }
}
