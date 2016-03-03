using Com.Aspose.Slides.Api;
using Com.Aspose.Storage.Api;
using Com.Aspose.Slides.Model;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace SlidesTest
{
    
    
    /// <summary>
    ///This is a test class for TestSlidesApi and is intended
    ///to contain all TestSlidesApi Unit Tests
    ///</summary>
    [TestClass()]
    public class TestSlidesApi
    {

        protected string APIKEY = "xxxxxxx";
        protected string APPSID = "xxxxxxx";
        protected string BASEPATH = "http://api.aspose.com/v1.1";
        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for DeleteSlideByIndex
        ///</summary>
        [TestMethod()]
        public void TestDeleteSlideByIndex()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);             
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);


            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            SlideListResponse actual;
            actual = target.DeleteSlideByIndex(name, slideIndex, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideListResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for DeleteSlidesCleanSlidesList
        ///</summary>
        [TestMethod()]
        public void TestDeleteSlidesCleanSlidesList()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            SlideListResponse actual;
            actual = target.DeleteSlidesCleanSlidesList(name, folder, storage);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideListResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for DeleteSlidesDocumentProperties
        ///</summary>
        [TestMethod()]
        public void TestDeleteSlidesDocumentProperties()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            DocumentPropertiesResponse actual;
            actual = target.DeleteSlidesDocumentProperties(name, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.DocumentPropertiesResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for DeleteSlidesDocumentProperty
        ///</summary>
        [TestMethod()]
        public void TestDeleteSlidesDocumentProperty()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx";
            string propertyName = "Author"; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            CommonResponse actual;
            actual = target.DeleteSlidesDocumentProperty(name, propertyName, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.CommonResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for DeleteSlidesSlideBackground
        ///</summary>
        [TestMethod()]
        public void TestDeleteSlidesSlideBackground()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            SlideBackgroundResponse actual;
            actual = target.DeleteSlidesSlideBackground(name, slideIndex, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideBackgroundResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetParagraphPortion
        ///</summary>
        [TestMethod()]
        public void TestGetParagraphPortion()
        {
            
            
            
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            int? shapeIndex = 1; 
            int? paragraphIndex = 1; 
            int? portionIndex = 1; 
            string folder = null; 
            string storage = null; 
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            ResponseMessage actual;
            actual = target.GetParagraphPortion(name, slideIndex, shapeIndex, paragraphIndex, portionIndex, folder, storage);
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetShapeParagraph
        ///</summary>
        [TestMethod()]
        public void TestGetShapeParagraph()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            int? shapeIndex = 1; 
            int? paragraphIndex = 1; 
            string folder = null; 
            string storage = null; 
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            ResponseMessage actual;
            actual = target.GetShapeParagraph(name, slideIndex, shapeIndex, paragraphIndex, folder, storage);
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetShapeWithFormat
        ///</summary>
        [TestMethod()]
        public void TestGetShapeWithFormat()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            int? shapeIndex = 1; 
            string format = "png"; 
            string folder = null; 
            string storage = null; 
            float? scaleX = null; 
            float? scaleY = null; 
            string bounds = null; 
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            ResponseMessage actual;
            actual = target.GetShapeWithFormat(name, slideIndex, shapeIndex, format, folder, storage, scaleX, scaleY, bounds);
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlideShapeParagraphs
        ///</summary>
        [TestMethod()]
        public void TestGetSlideShapeParagraphs()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            int? shapeIndex = 1; 
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            ResponseMessage actual;
            actual = target.GetSlideShapeParagraphs(name, slideIndex, shapeIndex, folder, storage);
            
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlideWithFormat
        ///</summary>
        [TestMethod()]
        public void TestGetSlideWithFormat()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1;
            string format = "pdf"; 
            int? width = null; 
            int? height = null; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            ResponseMessage actual;
            actual = target.GetSlideWithFormat(name, slideIndex, format, width, height, folder, storage);
            
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesDocument
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesDocument()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            string name = "sample-input.pptx"; 
            string password = null; 
            string storage = null; 
            string folder = null; 
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            ResponseMessage actual;
            actual = target.GetSlidesDocument(name, password, storage, folder);
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesDocumentProperties
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesDocumentProperties()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            string name = "test_slide.pptx"; 
            string folder = null; 
            string storage = null; 
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            DocumentPropertiesResponse actual;
            actual = target.GetSlidesDocumentProperties(name, folder, storage);
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.DocumentPropertiesResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesDocumentProperty
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesDocumentProperty()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "test_slide.pptx";
            string propertyName = "Author"; 
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            DocumentPropertyResponse actual;
            actual = target.GetSlidesDocumentProperty(name, propertyName, folder, storage);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.DocumentPropertyResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesDocumentWithFormat
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesDocumentWithFormat()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "test_slide.pptx";
            string format = "tiff";
            string jpegQuality = null; 
            string password = null; 
            string storage = null; 
            string folder = null; 
            string outPath = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            ResponseMessage actual;
            actual = target.GetSlidesDocumentWithFormat(name, format, jpegQuality, password, storage, folder, outPath);
            
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesImages
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesImages()
        {            
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "sample-input.pptx"; 
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            ImagesResponse actual;
            actual = target.GetSlidesImages(name, folder, storage);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ImagesResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesPlaceholder
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesPlaceholder()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "sample-input.pptx"; 
            int? slideIndex = 1; 
            int? placeholderIndex = 0; 
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            PlaceholderResponse actual;
            actual = target.GetSlidesPlaceholder(name, slideIndex, placeholderIndex, folder, storage);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.PlaceholderResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesPlaceholders
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesPlaceholders()
        {
            
            
            
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            string name = "sample-input.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null; 
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            PlaceholdersResponse actual;
            actual = target.GetSlidesPlaceholders(name, slideIndex, folder, storage);
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.PlaceholdersResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesPresentationTextItems
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesPresentationTextItems()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "test_slide.pptx"; 
            bool? withEmpty = null;
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            TextItemsResponse actual;
            actual = target.GetSlidesPresentationTextItems(name, withEmpty, folder, storage);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.TextItemsResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesSlide
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesSlide()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "sample-input.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            ResponseMessage actual;
            actual = target.GetSlidesSlide(name, slideIndex, folder, storage);
            
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesSlideBackground
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesSlideBackground()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            SlideBackgroundResponse actual;
            actual = target.GetSlidesSlideBackground(name, slideIndex, folder, storage);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideBackgroundResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesSlideComments
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesSlideComments()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null;
 
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            SlideCommentsResponse actual;
            actual = target.GetSlidesSlideComments(name, slideIndex, folder, storage);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideCommentsResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesSlideImages
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesSlideImages()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); 
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            ImagesResponse actual;
            actual = target.GetSlidesSlideImages(name, slideIndex, folder, storage);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ImagesResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesSlideShapes
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesSlideShapes()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            ResponseMessage actual;
            actual = target.GetSlidesSlideShapes(name, slideIndex, folder, storage);
            
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesSlideShapesParent
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesSlideShapesParent()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string shapePath = "1"; 
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            ResponseMessage actual;
            actual = target.GetSlidesSlideShapesParent(name, slideIndex, shapePath, folder, storage);
            
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesSlideTextItems
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesSlideTextItems()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); 
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            bool? withEmpty = null;
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            TextItemsResponse actual;
            actual = target.GetSlidesSlideTextItems(name, slideIndex, withEmpty, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.TextItemsResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesSlidesList
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesSlidesList()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "test_slide.pptx"; 
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            SlideListResponse actual;
            actual = target.GetSlidesSlidesList(name, folder, storage);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideListResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesTheme
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesTheme()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            ThemeResponse actual;
            actual = target.GetSlidesTheme(name, slideIndex, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ThemeResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesThemeColorScheme
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesThemeColorScheme()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); 
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            ColorSchemeResponse actual;
            actual = target.GetSlidesThemeColorScheme(name, slideIndex, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ColorSchemeResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesThemeFontScheme
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesThemeFontScheme()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            FontSchemeResponse actual;
            actual = target.GetSlidesThemeFontScheme(name, slideIndex, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.FontSchemeResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for GetSlidesThemeFormatScheme
        ///</summary>
        [TestMethod()]
        public void TestGetSlidesThemeFormatScheme()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            FormatSchemeResponse actual;
            actual = target.GetSlidesThemeFormatScheme(name, slideIndex, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.FormatSchemeResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostAddEmptySlide
        ///</summary>
        [TestMethod()]
        public void TestPostAddEmptySlide()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); 
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            SlideListResponse actual;
            actual = target.PostAddEmptySlide(name, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideListResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostAddEmptySlideAtPosition
        ///</summary>
        [TestMethod()]
        public void TestPostAddEmptySlideAtPosition()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? position = 1; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            SlideListResponse actual;
            actual = target.PostAddEmptySlideAtPosition(name, position, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideListResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostAddNewShape
        ///</summary>
        [TestMethod()]
        public void TestPostAddNewShape()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null;
            Shape body = new Shape();
            body.Name = "Aspsoe";
            body.ShapeType = "Line";
            body.AlternativeText = "aspose.com";

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            ResponseMessage actual;
            actual = target.PostAddNewShape(name, slideIndex, folder, storage, body);

            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostAddSlideCopy
        ///</summary>
        [TestMethod()]
        public void TestPostAddSlideCopy()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);
            
            string name = "test_slide.pptx"; 
            int? slideToClone = 1; 
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            SlideListResponse actual;
            actual = target.PostAddSlideCopy(name, slideToClone, folder, storage);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideListResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostClonePresentationSlide
        ///</summary>
        [TestMethod()]
        public void TestPostClonePresentationSlide()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); 
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? position = 1; 
            int? slideToClone = 1; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            SlideListResponse actual;
            actual = target.PostClonePresentationSlide(name, position, slideToClone, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideListResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostCopySlideFromSourcePresentation
        ///</summary>
        [TestMethod()]
        public void TestPostCopySlideFromSourcePresentation()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideToCopy = 1;
            string source = "sample-input.pptx";
            int? position = 1; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            SlideListResponse actual;
            actual = target.PostCopySlideFromSourcePresentation(name, slideToCopy, source, position, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideListResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostPresentationMerge
        ///</summary>
        [TestMethod()]
        public void TestPostPresentationMerge()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); 
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx";
            string mergeFile1 = "sample-input.pptx";
            string mergeFile2 = "demo.pptx";

            string storage = null; 
            string folder = null; 

            PresentationsMergeRequest body = new PresentationsMergeRequest();
            body.PresentationPaths = new System.Collections.Generic.List<string>  {mergeFile1,mergeFile2};

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name));

            storageApi.PutCreate(mergeFile1, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + mergeFile1));
            storageApi.PutCreate(mergeFile2, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + mergeFile2)); 

            DocumentResponse actual;
            actual = target.PostPresentationMerge(name, storage, folder, body);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.DocumentResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostSlidesDocument
        ///</summary>
        [TestMethod()]
        public void TestPostSlidesDocument()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); 
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "slide_"+ new Random().Next(100) +".pptx";
            string templatePath = "test_slide.pptx"; 
            string templateStorage = null; 
            bool? isImageDataEmbeeded = false;
            string password = null; 
            string storage = null; 
            string folder = null;

            byte[] file = System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + "test.html");

            storageApi.PutCreate(templatePath, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + templatePath)); 

            ResponseMessage actual;
            actual = target.PostSlidesDocument(name, templatePath, templateStorage, isImageDataEmbeeded, password, storage, folder, file);

            Assert.AreEqual("Created", actual.Status);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostSlidesPresentationReplaceText
        ///</summary>
        [TestMethod()]
        public void TestPostSlidesPresentationReplaceText()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); 
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx";
            string oldValue = "aspose";
            string newValue = "aspose2";
            bool? ignoreCase = null;
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            PresentationStringReplaceResponse actual;
            actual = target.PostSlidesPresentationReplaceText(name, oldValue, newValue, ignoreCase, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.PresentationStringReplaceResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostSlidesReorderPosition
        ///</summary>
        [TestMethod()]
        public void TestPostSlidesReorderPosition()
        {   
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "sample-input.pptx"; 
            int? oldPosition = 1; 
            int? newPosition = 2; 
            string folder = null; 
            string storage = null; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            SlideListResponse actual;
            actual = target.PostSlidesReorderPosition(name, oldPosition, newPosition, folder, storage);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideListResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostSlidesSaveAsHtml
        ///</summary>
        [TestMethod()]
        public void TestPostSlidesSaveAsHtml()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            string password = null; 
            string storage = null; 
            string folder = null; 
            string outPath = null; 
            HtmlExportOptions body = new HtmlExportOptions();
            body.SaveAsZip = true;

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            ResponseMessage actual;
            actual = target.PostSlidesSaveAsHtml(name, password, storage, folder, outPath, body);
            
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostSlidesSaveAsPdf
        ///</summary>
        [TestMethod()]
        public void TestPostSlidesSaveAsPdf()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            string password = null; 
            string storage = null; 
            string folder = null; 
            string outPath = null; 
            PdfExportOptions body = new PdfExportOptions();
            body.JpegQuality = "50";

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            ResponseMessage actual;
            actual = target.PostSlidesSaveAsPdf(name, password, storage, folder, outPath, body);
            
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostSlidesSaveAsTiff
        ///</summary>
        [TestMethod()]
        public void TestPostSlidesSaveAsTiff()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            string password = null; 
            string storage = null; 
            string folder = null; 
            string outPath = null; 
            TiffExportOptions body = new TiffExportOptions();
            body.ExportFormat = "tiff";

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            ResponseMessage actual;
            actual = target.PostSlidesSaveAsTiff(name, password, storage, folder, outPath, body);
            
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostSlidesSetDocumentProperties
        ///</summary>
        [TestMethod()]
        public void TestPostSlidesSetDocumentProperties()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "sample-input.pptx";
            string folder = null; 
            string storage = null;
            DocumentProperties body = new DocumentProperties();
            DocumentProperty docProperty = new DocumentProperty();
            docProperty.Name = "Author";
            docProperty.Value = "Imran Anwar";
            body.List = new System.Collections.Generic.List<DocumentProperty> { docProperty};

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            DocumentPropertiesResponse actual;
            actual = target.PostSlidesSetDocumentProperties(name, folder, storage, body);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.DocumentPropertiesResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostSlidesSlideReplaceText
        ///</summary>
        [TestMethod()]
        public void TestPostSlidesSlideReplaceText()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); 
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1;
            string oldValue = "aspose";
            string newValue = "aspose2"; 
            bool? ignoreCase = null;
            string folder = null; 
            string storage = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            SlideStringReplaceResponse actual;
            actual = target.PostSlidesSlideReplaceText(name, slideIndex, oldValue, newValue, ignoreCase, folder, storage);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideStringReplaceResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostSlidesSplit
        ///</summary>
        [TestMethod()]
        public void TestPostSlidesSplit()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "sample-input.pptx";
            int? width = null; 
            int? height = null; 
            int? to = 3; 
            int? from = 2; 
            string destFolder = null; 
            string format = "png"; 
            string storage = null; 
            string folder = null; 
            
            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 
            
            SplitDocumentResponse actual;
            actual = target.PostSlidesSplit(name, width, height, to, from, destFolder, format, storage, folder);
            
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SplitDocumentResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutNewPresentation
        ///</summary>
        [TestMethod()]
        public void TestPutNewPresentation()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            //StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "slide_" + new Random().Next(100) + ".pptx";
            string password = null; 
            string storage = null; 
            string folder = null;
            byte[] file = System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + "test_slide.pptx");

            ResponseMessage actual;
            actual = target.PutNewPresentation(name, password, storage, folder, file);
            
            Assert.AreNotEqual(null, actual);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutNewPresentationFromStoredTemplate
        ///</summary>
        [TestMethod()]
        public void TestPutNewPresentationFromStoredTemplate()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);

            string name = "slide_" + new Random().Next(100) + ".pptx";
            string templatePath = "test_slide.pptx"; 
            string templateStorage = null; 
            string password = null; 
            string storage = null; 
            string folder = null;
            byte[] file = System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + "test_slide.pptx");

            ResponseMessage actual;
            actual = target.PutNewPresentationFromStoredTemplate(name, templatePath, templateStorage, password, storage, folder, file);

            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutPresentationMerge
        ///</summary>
        [TestMethod()]
        public void TestPutPresentationMerge()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx";
            string mergeFile1 = "welcome.pptx";
            string mergeFile2 = "demo.pptx";
            string storage = null; 
            string folder = null; 
            OrderedMergeRequest body = new OrderedMergeRequest();
            PresentationToMerge ptm1 = new PresentationToMerge(); ptm1.Path = mergeFile1;
            PresentationToMerge ptm2 = new PresentationToMerge(); ptm2.Path = mergeFile2;
            body.Presentations = new System.Collections.Generic.List<PresentationToMerge> {ptm1, ptm2 };

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            DocumentResponse actual;
            actual = target.PutPresentationMerge(name, storage, folder, body);
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.DocumentResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutSetParagraphPortionProperties
        ///</summary>
        [TestMethod()]
        public void TestPutSetParagraphPortionProperties()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); 
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            int? shapeIndex = 1; 
            int? paragraphIndex = 1; 
            int? portionIndex = 1; 
            string folder = null; 
            string storage = null; 

            Portion body = new Portion();
            body.Text = "Newer Value";
            body.FontColor = "#FFFF0000";
            body.FontHeight = 5.0;

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            ResponseMessage actual;
            actual = target.PutSetParagraphPortionProperties(name, slideIndex, shapeIndex, paragraphIndex, portionIndex, folder, storage, body);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutSlideShapeInfo
        ///</summary>
        [TestMethod()]
        public void TestPutSlideShapeInfo()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string shapePath = "1"; 
            string folder = null; 
            string storage = null; 
            Shape body = new Shape();
            body.AlternativeText = "Aspose";

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            ResponseMessage actual;
            actual = target.PutSlideShapeInfo(name, slideIndex, shapePath, folder, storage, body);

            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutSlidesConvert
        ///</summary>
        [TestMethod()]
        public void TestPutSlidesConvert()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH); 
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string password = null; 
            string format = "pdf"; 
            string outPath = null;
            byte[] file = System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + "test_slide.pptx"); 

            ResponseMessage actual;
            actual = target.PutSlidesConvert(password, format, outPath, file);

            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutSlidesDocumentFromHtml
        ///</summary>
        [TestMethod()]
        public void TestPutSlidesDocumentFromHtml()
        {   
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "slide_" + new Random().Next(100) + ".pptx";
            string password = null; 
            string storage = null; 
            string folder = null;
            byte[] file = System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + "test.html"); 

            ResponseMessage actual;
            actual = target.PutSlidesDocumentFromHtml(name, password, storage, folder, file);
            
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutSlidesSetDocumentProperty
        ///</summary>
        [TestMethod()]
        public void TestPutSlidesSetDocumentProperty()
        {   
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "sample-input.pptx";
            string propertyName = "Author"; 
            string folder = null; 
            string storage = null; 
            DocumentProperty body = new DocumentProperty();
            body.Name = "Author";
            body.Value = "Imran Anwar";

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            DocumentPropertyResponse actual;
            actual = target.PutSlidesSetDocumentProperty(name, propertyName, folder, storage, body);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.DocumentPropertyResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutSlidesSlideBackground
        ///</summary>
        [TestMethod()]
        public void TestPutSlidesSlideBackground()
        {
            SlidesApi target = new SlidesApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);

            string name = "test_slide.pptx"; 
            int? slideIndex = 1; 
            string folder = null; 
            string storage = null;
            string body = "#FFFF0000"; 

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes("\\temp\\slides\\resources\\" + name)); 

            SlideBackgroundResponse actual;
            actual = target.PutSlidesSlideBackground(name, slideIndex, folder, storage, body);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new Com.Aspose.Slides.Model.SlideBackgroundResponse(), actual.GetType()); 
        }
    }
}
