package com.aspose.slides.api;

import com.aspose.storage.api.StorageApi;
import com.aspose.slides.client.ApiException;
import com.aspose.slides.model.ColorSchemeResponse;
import com.aspose.slides.model.CommonResponse;
import com.aspose.slides.model.DocumentProperties;
import com.aspose.slides.model.DocumentPropertiesResponse;
import com.aspose.slides.model.DocumentProperty;
import com.aspose.slides.model.DocumentPropertyResponse;
import com.aspose.slides.model.DocumentResponse;
import com.aspose.slides.model.FontSchemeResponse;
import com.aspose.slides.model.FormatSchemeResponse;
import com.aspose.slides.model.ImagesResponse;
import com.aspose.slides.model.OrderedMergeRequest;
import com.aspose.slides.model.PlaceholderResponse;
import com.aspose.slides.model.PlaceholdersResponse;
import com.aspose.slides.model.Portion;
import com.aspose.slides.model.PresentationStringReplaceResponse;
import com.aspose.slides.model.PresentationsMergeRequest;
import com.aspose.slides.model.ResponseMessage;
import com.aspose.slides.model.Shape;
import com.aspose.slides.model.ShapeListResponse;
import com.aspose.slides.model.ShapeResponse;
import com.aspose.slides.model.SlideBackgroundResponse;
import com.aspose.slides.model.SlideCommentsResponse;
import com.aspose.slides.model.SlideListResponse;
import com.aspose.slides.model.SlideResponse;
import com.aspose.slides.model.SlideStringReplaceResponse;
import com.aspose.slides.model.SplitDocumentResponse;
import com.aspose.slides.model.TextItemsResponse;
import com.aspose.slides.model.ThemeResponse;

import java.io.File;
import java.util.UUID;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 *
 * @author Imran Anwar
 * @author Farooq Sheikh
 */
public class SlidesApiTest {

	SlidesApi slidesApi;
	StorageApi storageApi;
	// Please get the appSID and apiKey from https://cloud.aspose.com
	String appSID = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx";
	String apiKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";

	public SlidesApiTest() {
	}

	@BeforeClass
	public static void setUpClass() {
	}

	@AfterClass
	public static void tearDownClass() {
	}
	@Before
	public void setUp() {
		slidesApi = new SlidesApi("http://api.aspose.com/v1.1",apiKey,appSID);
	}

	@After
	public void tearDown() {
	}

	/**
	 * Test of GetSlidesDocument method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesDocument() {
		System.out.println("GetSlidesDocument");
		String name = "test_slide.pptx";
		String password = "";
		String storage = "";
		String folder = "";
		try {			
			ResponseMessage result = slidesApi.GetSlidesDocument(name, password, storage, folder);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesDocumentWithFormat method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesDocumentWithFormat() {
		System.out.println("GetSlidesDocumentWithFormat");
		String name = "test_slide.pptx";
		String format = "pdf";
		Integer jpegQuality = 1;
		String password = "";
		String storage = "";
		String folder = "";
		String outPath = "";
		try {
			
			ResponseMessage result = slidesApi.GetSlidesDocumentWithFormat(name, format, jpegQuality, password, storage, folder, outPath);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PostSlidesDocument method, of class SlidesApi.
	 */
	@Test
	public void testPostSlidesDocument() {
		System.out.println("PostSlidesDocument");
		String name = "test_slide" + UUID.randomUUID().toString().subSequence(0, 8) +".pptx";
		String templatePath = "";
		String templateStorage = null;
		Boolean isImageDataEmbeeded = false;
		String password = "123";
		String storage = null;
		String folder = null;
		File file;
		try {
			file = new File(getClass().getResource("/test_convert_slide.pptx").toURI());
			//ResponseMessage result = slidesApi.PostSlidesDocument(name, templatePath, templateStorage, isImageDataEmbeeded, password, storage, folder, file);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		} catch(java.net.URISyntaxException uriExp){
			System.out.println("uri exp:" + uriExp.getMessage());
		}
	}

	/**
	 * Test of PostSlidesSplit method, of class SlidesApi.
	 */
	@Test
	public void testPostSlidesSplit() {
		System.out.println("PostSlidesSplit");
		String name = "test_slide.pptx";
		Integer width = 200;
		Integer height = 300;
		Integer to = 3;
		Integer from = 2;
		String destFolder = "";
		String format = "html";
		String storage = "";
		String folder = "";
		try {
			SplitDocumentResponse result = slidesApi.PostSlidesSplit(name, width, height, to, from, destFolder, format, storage, folder);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PutNewPresentation method, of class SlidesApi.
	 */
	@Test
	public void testPutNewPresentation() {
		System.out.println("PutNewPresentation");
		String name = "test_slide_tmp" + UUID.randomUUID().toString().subSequence(0, 8) +".pptx" ;
		String password = "";
		String storage = "";
		String folder = "";
		File file;
		try {
			file = new File(getClass().getResource("/test_convert_slide.pptx").toURI());
			 DocumentResponse result = slidesApi.PutNewPresentation(name, password, storage, folder, file);
			 System.out.println("Empty presentation file has been created successfully");
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		} catch(java.net.URISyntaxException uriExp){
			System.out.println("uri exp:" + uriExp.getMessage());
		}

	}

	/**
	 * Test of PutNewPresentationFromStoredTemplate method, of class SlidesApi.
	 */
	@Test
	public void testPutNewPresentationFromStoredTemplate() {
		System.out.println("PutNewPresentationFromStoredTemplate");
		String name = "test_slide_tmp" + UUID.randomUUID().toString().subSequence(0, 8) +".pptx";
		String templatePath = "";
		String templateStorage = "";
		String password = "";
		String storage = "";
		String folder = "";
		File file;
		try {
			file = new File(getClass().getResource("/test_convert_slide.pptx").toURI());
			//ResponseMessage result = slidesApi.PutNewPresentationFromStoredTemplate(name, templatePath, templateStorage, password, storage, folder, file);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		} catch(java.net.URISyntaxException uriExp){
			System.out.println("uri exp:" + uriExp.getMessage());
		}

	}

	/**
	 * Test of PutSlidesConvert method, of class SlidesApi.
	 */
	@Test
	public void testPutSlidesConvert() {
		System.out.println("PutSlidesConvert");
		String password = "";
		String format = "html";
		String outPath = "";
		File file;
		try {
			file = new File(getClass().getResource("/test_convert_slide.pptx").toURI());
			ResponseMessage result = slidesApi.PutSlidesConvert(password, format, outPath, file);		
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		} catch(java.net.URISyntaxException uriExp){
			System.out.println("uri exp:" + uriExp.getMessage());
		}

	}

	/**
	 * Test of PutSlidesDocumentFromHtml method, of class SlidesApi.
	 */
//	@Test
//	public void testPutSlidesDocumentFromHtml() {
//		System.out.println("PutSlidesDocumentFromHtml");
//		String name = "test_slide.pptx";
//		String password = "";
//		String storage = "";
//		String folder = "";
//		File file;
//		try {
//			file = new File(getClass().getResource("/test_convert_slide.pptx").toURI());
//			ResponseMessage result = slidesApi.PutSlidesDocumentFromHtml(name, password, storage, folder, file);
//			
//			
//		} catch (ApiException apiException) {
//			System.out.println("exp:" + apiException.getMessage());
//			assertNull(apiException);
//		} catch(java.net.URISyntaxException uriExp){
//			System.out.println("uri exp:" + uriExp.getMessage());
//		}
//
//	}

	/**
	 * Test of GetSlidesImages method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesImages() {
		System.out.println("GetSlidesImages");
		String name = "test_slide.pptx";
		String folder = "";
		String storage = "";
		try {
			ImagesResponse result = slidesApi.GetSlidesImages(name, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesSlideImages method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesSlideImages() {
		System.out.println("GetSlidesSlideImages");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			ImagesResponse result = slidesApi.GetSlidesSlideImages(name, slideIndex, folder, storage);
		
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PostPresentationMerge method, of class SlidesApi.
	 */
	@Test
	public void testPostPresentationMerge() {
		System.out.println("PostPresentationMerge");
		String name = "test_slide.pptx";
		String storage = "";
		String folder = "";
		PresentationsMergeRequest body = new PresentationsMergeRequest();
		try {
			DocumentResponse result = slidesApi.PostPresentationMerge(name, storage, folder, body);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PutPresentationMerge method, of class SlidesApi.
	 */
	@Test
	public void testPutPresentationMerge() {
		System.out.println("PutPresentationMerge");
		String name = "test_slide.pptx";
		String storage = "";
		String folder = "";
		OrderedMergeRequest body = new OrderedMergeRequest();
		try {
			DocumentResponse result = slidesApi.PutPresentationMerge(name, storage, folder, body);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesPlaceholder method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesPlaceholder() {
		System.out.println("GetSlidesPlaceholder");
		String name = "test_slide_placeholder.pptx";
		Integer slideIndex = 1;
		Integer placeholderIndex = 1;
		String folder = "";
		String storage = "";
		try {
			PlaceholderResponse result = slidesApi.GetSlidesPlaceholder(name, slideIndex, placeholderIndex, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesPlaceholders method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesPlaceholders() {
		System.out.println("GetSlidesPlaceholders");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			PlaceholdersResponse result = slidesApi.GetSlidesPlaceholders(name, slideIndex, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of DeleteSlidesDocumentProperties method, of class SlidesApi.
	 */
	@Test
	public void testDeleteSlidesDocumentProperties() {
		System.out.println("DeleteSlidesDocumentProperties");
		String name = "test_slide.pptx";
		String folder = "";
		String storage = "";
		try {
			DocumentPropertiesResponse result = slidesApi.DeleteSlidesDocumentProperties(name, folder, storage);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of DeleteSlidesDocumentProperty method, of class SlidesApi.
	 */
	@Test
	public void testDeleteSlidesDocumentProperty() {
		System.out.println("DeleteSlidesDocumentProperty");
		String name = "test_slide.pptx";
		String propertyName = "Author";
		String folder = "";
		String storage = "";
		try {
			CommonResponse result = slidesApi.DeleteSlidesDocumentProperty(name, propertyName, folder, storage);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesDocumentProperties method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesDocumentProperties() {
		System.out.println("GetSlidesDocumentProperties");
		String name = "test_slide.pptx";
		String folder = "";
		String storage = "";
		try {
			DocumentPropertiesResponse result = slidesApi.GetSlidesDocumentProperties(name, folder, storage);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PostSlidesSetDocumentProperties method, of class SlidesApi.
	 */
	@Test
	public void testPostSlidesSetDocumentProperties() {
		System.out.println("PostSlidesSetDocumentProperties");
		String name = "test_slide.pptx";
		String folder = "";
		String storage = "";
		DocumentProperties body = new DocumentProperties();
		try {
			
			DocumentPropertiesResponse result = slidesApi.PostSlidesSetDocumentProperties(name, folder, storage, body);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PutSlidesSetDocumentProperty method, of class SlidesApi.
	 */
	@Test
	public void testPutSlidesSetDocumentProperty() {
		System.out.println("PutSlidesSetDocumentProperty");
		String name = "test_slide.pptx";
		String propertyName = "Author";
		String folder = "";
		String storage = "";
		DocumentProperty body = new DocumentProperty();
		body.setName("Author");
		body.setValue("Imran Anwar");
		
		try {
			DocumentPropertyResponse result = slidesApi.PutSlidesSetDocumentProperty(name, propertyName, folder, storage, body);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetParagraphPortion method, of class SlidesApi.
	 */
	@Test
	public void testGetParagraphPortion() {
		System.out.println("GetParagraphPortion");
		String name = "test_slide_placeholder.pptx";
		Integer slideIndex = 2;
		Integer shapeIndex = 1;
		Integer paragraphIndex = 1;
		Integer portionIndex = 1;
		String folder = "";
		String storage = "";
		try {
			
			ResponseMessage result = slidesApi.GetParagraphPortion(name, slideIndex, shapeIndex, paragraphIndex, portionIndex, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetShapeParagraph method, of class SlidesApi.
	 */
	@Test
	public void testGetShapeParagraph() {
		System.out.println("GetShapeParagraph");
		String name = "test_slide_placeholder.pptx";
		Integer slideIndex = 1;
		Integer shapeIndex = 1;
		Integer paragraphIndex = 1;
		String folder = "";
		String storage = "";
		try {
			
			ResponseMessage result = slidesApi.GetShapeParagraph(name, slideIndex, shapeIndex, paragraphIndex, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlideShapeParagraphs method, of class SlidesApi.
	 */
	@Test
	public void testGetSlideShapeParagraphs() {
		System.out.println("GetSlideShapeParagraphs");
		String name = "test_slide_placeholder.pptx";
		Integer slideIndex = 1;
		Integer shapeIndex = 1;
		String folder = "";
		String storage = "";
		try {
			
			ResponseMessage result = slidesApi.GetSlideShapeParagraphs(name, slideIndex, shapeIndex, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesSlideShapes method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesSlideShapes() {
		System.out.println("GetSlidesSlideShapes");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			ShapeListResponse result = slidesApi.GetSlidesSlideShapes(name, slideIndex, folder, storage);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesSlideShapesParent method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesSlideShapesParent() {
		System.out.println("GetSlidesSlideShapesParent");
		String name = "test_slide_placeholder.pptx";
		Integer slideIndex = 2;
		String shapePath = "2";
		String folder = "";
		String storage = "";
		try {
			
			ShapeResponse result = slidesApi.GetSlidesSlideShapesParent(name, slideIndex, shapePath, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PutSetParagraphPortionProperties method, of class SlidesApi.
	 */
	@Test
	public void testPutSetParagraphPortionProperties() {
		System.out.println("PutSetParagraphPortionProperties");
		String name = "test_slide_placeholder.pptx";
		Integer slideIndex = 1;
		Integer shapeIndex = 1;
		Integer paragraphIndex = 1;
		Integer portionIndex = 1;
		String folder = "";
		String storage = "";
		Portion body = new Portion();
		body.setText("this is the new text");
		body.setFontColor("#FF000000");
		body.setFontHeight(5.0);
		try {
			
			ResponseMessage result = slidesApi.PutSetParagraphPortionProperties(name, slideIndex, shapeIndex, paragraphIndex, portionIndex, folder, storage, body);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PutSlideShapeInfo method, of class SlidesApi.
	 */
	@Test
	public void testPutSlideShapeInfo() {
		System.out.println("PutSlideShapeInfo");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String shapePath = "2";
		String folder = "";
		String storage = "";
		Shape body = new Shape();
		body.setName("NewShape");
		body.setText("NewText");
		try {
			
			ResponseMessage result = slidesApi.PutSlideShapeInfo(name, slideIndex, shapePath, folder, storage, body);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of DeleteSlideByIndex method, of class SlidesApi.
	 */
	@Test
	public void testDeleteSlideByIndex() {
		System.out.println("DeleteSlideByIndex");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			SlideListResponse result = slidesApi.DeleteSlideByIndex(name, slideIndex, folder, storage);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of DeleteSlidesCleanSlidesList method, of class SlidesApi.
	 */
	@Test
	public void testDeleteSlidesCleanSlidesList() {
		System.out.println("DeleteSlidesCleanSlidesList");
		String name = "test_slide.pptx";
		String folder = "";
		String storage = "";
		try {
			SlideListResponse result = slidesApi.DeleteSlidesCleanSlidesList(name, folder, storage);
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of DeleteSlidesSlideBackground method, of class SlidesApi.
	 */
	@Test
	public void testDeleteSlidesSlideBackground() {
		System.out.println("DeleteSlidesSlideBackground");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			SlideBackgroundResponse result = slidesApi.DeleteSlidesSlideBackground(name, slideIndex, folder, storage);
		
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesSlide method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesSlide() {
		System.out.println("GetSlidesSlide");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			 SlideResponse result = slidesApi.GetSlidesSlide(name, slideIndex, folder, storage);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesSlideBackground method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesSlideBackground() {
		System.out.println("GetSlidesSlideBackground");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			SlideBackgroundResponse result = slidesApi.GetSlidesSlideBackground(name, slideIndex, folder, storage);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesSlideComments method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesSlideComments() {
		System.out.println("GetSlidesSlideComments");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			SlideCommentsResponse result = slidesApi.GetSlidesSlideComments(name, slideIndex, folder, storage);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesSlidesList method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesSlidesList() {
		System.out.println("GetSlidesSlidesList");
		String name = "test_slide.pptx";
		String folder = "";
		String storage = "";
		try {
			SlideListResponse result = slidesApi.GetSlidesSlidesList(name, folder, storage);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlideWithFormat method, of class SlidesApi.
	 */
	@Test
	public void testGetSlideWithFormat() {
		System.out.println("GetSlideWithFormat");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String format = "html";
		Integer width = 200;
		Integer height = 300;
		String folder = "";
		String storage = "";
		try {
			
			ResponseMessage result = slidesApi.GetSlideWithFormat(name, slideIndex, format, width, height, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PostAddEmptySlide method, of class SlidesApi.
	 */
	@Test
	public void testPostAddEmptySlide() {
		System.out.println("PostAddEmptySlide");
		String name = "test_slide.pptx";
		String folder = "";
		String storage = "";
		try {
			SlideListResponse result = slidesApi.PostAddEmptySlide(name, folder, storage);
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PostAddEmptySlideAtPosition method, of class SlidesApi.
	 */
	@Test
	public void testPostAddEmptySlideAtPosition() {
		System.out.println("PostAddEmptySlideAtPosition");
		String name = "test_slide.pptx";
		Integer position = 1;
		String folder = "";
		String storage = "";
		try {
			SlideListResponse result = slidesApi.PostAddEmptySlideAtPosition(name, position, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PostAddSlideCopy method, of class SlidesApi.
	 */
	@Test
	public void testPostAddSlideCopy() {
		System.out.println("PostAddSlideCopy");
		String name = "test_slide.pptx";
		Integer slideToClone = 1;
		String folder = "";
		String storage = "";
		try {
			SlideListResponse result = slidesApi.PostAddSlideCopy(name, slideToClone, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PostClonePresentationSlide method, of class SlidesApi.
	 */
	@Test
	public void testPostClonePresentationSlide() {
		System.out.println("PostClonePresentationSlide");
		String name = "test_slide.pptx";
		Integer position = 1;
		Integer slideToClone = 1;
		String folder = "";
		String storage = "";
		try {
			SlideListResponse result = slidesApi.PostClonePresentationSlide(name, position, slideToClone, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PostCopySlideFromSourcePresentation method, of class SlidesApi.
	 */
	@Test
	public void testPostCopySlideFromSourcePresentation() {
		System.out.println("PostCopySlideFromSourcePresentation");
		String name = "test_slide.pptx";
		Integer slideToCopy = 1;
		String source = "test_slide_placeholder.pptx";
		Integer position = 1;
		String folder = "";
		String storage = "";
		try {
			SlideListResponse result = slidesApi.PostCopySlideFromSourcePresentation(name, slideToCopy, source, position, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PostSlidesReorderPosition method, of class SlidesApi.
	 */
	@Test
	public void testPostSlidesReorderPosition() {
		System.out.println("PostSlidesReorderPosition");
		String name = "test_slide.pptx";
		Integer oldPosition = 1;
		Integer newPosition = 1;
		String folder = "";
		String storage = "";
		try {
			SlideListResponse result = slidesApi.PostSlidesReorderPosition(name, oldPosition, newPosition, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PutSlidesSlideBackground method, of class SlidesApi.
	 */
	@Test
	public void testPutSlidesSlideBackground() {
		System.out.println("PutSlidesSlideBackground");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		String body = "#FF000000";
		try {
			SlideBackgroundResponse result = slidesApi.PutSlidesSlideBackground(name, slideIndex, folder, storage, body);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesPresentationTextItems method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesPresentationTextItems() {
		System.out.println("GetSlidesPresentationTextItems");
		String name = "test_slide.pptx";
		Boolean withEmpty = false;
		String folder = "";
		String storage = "";
		try {
			TextItemsResponse result = slidesApi.GetSlidesPresentationTextItems(name, withEmpty, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesSlideTextItems method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesSlideTextItems() {
		System.out.println("GetSlidesSlideTextItems");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		Boolean withEmpty = false;
		String folder = "";
		String storage = "";
		try {
			TextItemsResponse result = slidesApi.GetSlidesSlideTextItems(name, slideIndex, withEmpty, folder, storage);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PostSlidesPresentationReplaceText method, of class SlidesApi.
	 */
	@Test
	public void testPostSlidesPresentationReplaceText() {
		System.out.println("PostSlidesPresentationReplaceText");
		String name = "test_slide.pptx";
		String oldValue = "one";
		String newValue = "two";
		Boolean ignoreCase = true;
		String folder = "";
		String storage = "";
		try {
			PresentationStringReplaceResponse result = slidesApi.PostSlidesPresentationReplaceText(name, oldValue, newValue, ignoreCase, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of PostSlidesSlideReplaceText method, of class SlidesApi.
	 */
	@Test
	public void testPostSlidesSlideReplaceText() {
		System.out.println("PostSlidesSlideReplaceText");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String oldValue = "old";
		String newValue = "new";
		Boolean ignoreCase = false;
		String folder = "";
		String storage = "";
		try {
			SlideStringReplaceResponse result = slidesApi.PostSlidesSlideReplaceText(name, slideIndex, oldValue, newValue, ignoreCase, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesTheme method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesTheme() {
		System.out.println("GetSlidesTheme");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			ThemeResponse result = slidesApi.GetSlidesTheme(name, slideIndex, folder, storage);
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesThemeColorScheme method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesThemeColorScheme() {
		System.out.println("GetSlidesThemeColorScheme");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			ColorSchemeResponse result = slidesApi.GetSlidesThemeColorScheme(name, slideIndex, folder, storage);
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesThemeFontScheme method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesThemeFontScheme() {
		System.out.println("GetSlidesThemeFontScheme");
		String name = "test_slide.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			FontSchemeResponse result = slidesApi.GetSlidesThemeFontScheme(name, slideIndex, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}

	/**
	 * Test of GetSlidesThemeFormatScheme method, of class SlidesApi.
	 */
	@Test
	public void testGetSlidesThemeFormatScheme() {
		System.out.println("GetSlidesThemeFormatScheme");
		String name = "test_slide_placeholder.pptx";
		Integer slideIndex = 1;
		String folder = "";
		String storage = "";
		try {
			FormatSchemeResponse result = slidesApi.GetSlidesThemeFormatScheme(name, slideIndex, folder, storage);
			
			
		} catch (ApiException apiException) {
			System.out.println("exp:" + apiException.getMessage());
			assertNull(apiException);
		}
	}
}
