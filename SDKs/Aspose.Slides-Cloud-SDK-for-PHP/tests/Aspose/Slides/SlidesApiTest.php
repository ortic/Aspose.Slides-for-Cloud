<?php

require_once realpath(__DIR__) . '/Utils.php';

use Aspose\Slides\SlidesApi;
use Aspose\Slides\AsposeApp;

class SlidesApiTest extends PHPUnit_Framework_TestCase {
    
    protected $slides;

    protected function setUp()
    {        
    	AsposeApp::$appSID = Utils::appSID;
        AsposeApp::$apiKey = Utils::apiKey;
        $this->slides = new SlidesApi();
    }
    
    public function testDeleteSlideByIndex() {
    	// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->DeleteSlideByIndex($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testDeleteSlidesCleanSlidesList() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->DeleteSlidesCleanSlidesList($fileName, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testDeleteSlidesDocumentProperties() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->DeleteSlidesDocumentProperties($fileName, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\DocumentPropertiesResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testDeleteSlidesDocumentProperty() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->DeleteSlidesDocumentProperty($fileName, $propertyName = "Author", $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\CommonResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testDeleteSlidesSlideBackground() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->DeleteSlidesSlideBackground($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideBackgroundResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testGetParagraphPortion() {
		// Upload file to Aspose Cloud Storage
        $fileName = "test_slide_placeholder.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetParagraphPortion($fileName, $slideIndex = 3, $shapeIndex = 1, $paragraphIndex = 1, $portionIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\PortionResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetShapeParagraph() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetShapeParagraph($fileName, $slideIndex = 1, $shapeIndex = 1, $paragraphIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\ParagraphResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testGetSlideShapeParagraphs() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlideShapeParagraphs($fileName, $slideIndex = 1, $shapeIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\ParagraphsResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testGetSlideWithFormat() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlideWithFormat($fileName, $slideIndex = 1, $format = "pdf", $width = "", $height = "", $folder = "", $storage = "");
		$this->assertInternalType('string',$result );
		$fh = fopen(realpath(__DIR__ . '/../../../../..') . '/Data/Output/Test.png', 'w');
		fwrite($fh, $result);
		fclose($fh);
		$this->assertFileExists(realpath(__DIR__ . '/../../../../..'). '/Data/Output/Test.png');
    }

    public function testGetSlidesDocument() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesDocument($fileName, $password = "");
		$this->assertInternalType('string',$result );
    }

    
    public function testGetSlidesDocumentProperties() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesDocumentProperties($fileName);
		$this->assertInstanceOf('\Aspose\Slides\Models\DocumentPropertiesResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesDocumentWithFormat() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesDocumentWithFormat($fileName, $format = "pdf", $jpegQuality = null, $password = null, $storage = null, $folder = null, $outPath = null);
		$fh = fopen(realpath(__DIR__ . '/../../../../..') . '/Data/Output/Test.pdf', 'w');
		fwrite($fh, $result);
		fclose($fh);
		$this->assertFileExists(realpath(__DIR__ . '/../../../../..'). '/Data/Output/Test.pdf');
		$this->assertInternalType('string',$result );
    }

    
    public function testGetSlidesImages() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesImages($fileName);
		$this->assertInstanceOf('\Aspose\Slides\Models\ImagesResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesPlaceholder() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample-input.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesPlaceholder($fileName, $slideIndex = "1", $placeholderIndex = "0", $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\PlaceholderResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesPlaceholders() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample-input.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesPlaceholders($fileName, $slideIndex = "1", $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\PlaceholdersResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesPresentationTextItems() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesPresentationTextItems($fileName, $withEmpty = "", $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\TextItemsResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testGetSlidesSlide() {
    	// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesSlide($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideResponse', $result);
    }

    
    public function testGetSlidesSlideBackground() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesSlideBackground($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideBackgroundResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesSlideComments() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesSlideComments($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideCommentsResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testGetSlidesSlideImages() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesSlideImages($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\ImagesResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesSlideShapes() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesSlideShapes($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\ShapeListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesSlideShapesParent() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesSlideShapesParent($fileName, $slideIndex = 1, $shapePath = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\ShapeResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesSlideTextItems() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesSlideTextItems($fileName, $slideIndex = 1, $withEmpty = "", $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\TextItemsResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesSlidesList() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesSlidesList($fileName, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesTheme() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesTheme($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\ThemeResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesThemeColorScheme() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesThemeColorScheme($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\ColorSchemeResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testGetSlidesThemeFontScheme() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesThemeFontScheme($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\FontSchemeResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testGetSlidesThemeFormatScheme() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->GetSlidesThemeFormatScheme($fileName, $slideIndex = "1", $folder = "", $storage = "");
		//$this->assertInstanceOf('\Aspose\Slides\Models\FormatSchemeResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testPostAddEmptySlide() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->PostAddEmptySlide($fileName, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testPostAddEmptySlideAtPosition() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->PostAddEmptySlideAtPosition($fileName, $position = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testPostAddSlideCopy() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->PostAddSlideCopy($fileName, $slideToClone = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testPostClonePresentationSlide() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->PostClonePresentationSlide($fileName, $position = 2, $slideToClone = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testPostCopySlideFromSourcePresentation() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->PostCopySlideFromSourcePresentation($fileName, $slideToCopy = 1, $source = "sample-input.pptx", $position = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testPostPresentationMerge() {
		$fileName = "sample.pptx";
		$mergeFile1 = "welcome.pptx";
	    $mergeFile2 = "demo.pptx";
		
		Utils::uploadFile($fileName);
		Utils::uploadFile($mergeFile1);
		Utils::uploadFile($mergeFile2);
		
		$body = array("Presentations"=>array($mergeFile1, $mergeFile2));
		
		$result = $this->slides->PostPresentationMerge($fileName, $folder = "", $storage = "", $body);
		$this->assertInstanceOf('\Aspose\Slides\Models\DocumentResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testPostSlidesDocument() {
		$file = realpath(__DIR__ . '/../../../../..') . '/Data/Test.html';
		echo $file;
		$templatePath = "sample.pptx";
		$fileName = "sample".rand().".pptx";

		Utils::uploadFile($templatePath);
		$result = $this->slides->PostSlidesDocument($fileName, $templatePath, $templateStorage = null, $isImageDataEmbeeded = null, $password = null, $storage = null, $folder = null, $file);
		$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
		$this->assertEquals(201, $result->Code);
    }

    
    public function testPostSlidesPresentationReplaceText() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->PostSlidesPresentationReplaceText($fileName , $oldValue = "Aspose", $newValue = "Banckle", $ignoreCase = "", $folder = "", $storage = "", $body = "Test.pptx");
		$this->assertInstanceOf('\Aspose\Slides\Models\PresentationStringReplaceResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testPostSlidesReorderPosition() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample-input.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->PostSlidesReorderPosition($fileName, $oldPosition = "1", $newPosition = "2", $folder = "", $storage = "", $body = "Test.pptx");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testPostSlidesSetDocumentProperties() {
		$body = '{
	                    "List": [
	                      {
	                        "Name": "Test",
	                        "Value": "Testing123",
	                        "BuiltIn": false
	                      }
	                    ]
	                  }';
		// Upload file to Aspose Cloud Storage
        $fileName = "sample-input.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->PostSlidesSetDocumentProperties($fileName, $folder = "", $storage = "", $body);
		$this->assertInstanceOf('\Aspose\Slides\Models\DocumentPropertiesResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testPostSlidesSlideReplaceText() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->PostSlidesSlideReplaceText($fileName, $slideIndex = 1, $oldValue = "Aspose", $newValue = "Banckle", $ignoreCase = "", $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideStringReplaceResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testPostSlidesSplit() {
		// Upload file to Aspose Cloud Storage
        $fileName = "sample-input.pptx";
        Utils::uploadFile($name);

		$result = $this->slides->PostSlidesSplit($fileName, $width = "", $height = "", $to = "3", $from = "2", $destFolder = "", $format = "PNG", $storage = "", $folder = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SplitDocumentResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testPutNewPresentation() {
		
		$fileName = "sample".rand().".pptx";
		$file = realpath(__DIR__ . '/../../../../..') . '/Data/sample.pptx';
			
		$result = $this->slides->PutNewPresentation($fileName, $password = "", $storage = "", $folder = "", $file);
		$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
		$this->assertEquals(201, $result->Code);
    }

    
    public function testPutNewPresentationFromStoredTemplate() {	
		$fileName = "sample" . rand() . ".pptx";
		$templatePath = "sample.pptx";
		$file = $templatePath;
		Utils::uploadFile($templatePath);
		
		$result = $this->slides->PutNewPresentationFromStoredTemplate($fileName, $templatePath, $templateStorage = null, $password = null, $storage = null, $folder = null, $file);
		$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
		$this->assertEquals(201, $result->Code);
    }

    
    public function testPutPresentationMerge() {
		$fileName = "sample.pptx";
		$mergeFile1 = "welcome.pptx";
		
		$body = array("Presentations"=>array($mergeFile1));
		
		Utils::uploadFile($fileName);
		Utils::uploadFile( $mergeFile1);	
			
		$result = $this->slides->PutPresentationMerge($fileName, $storage = "", $folder = "", $body);
		$this->assertInstanceOf('\Aspose\Slides\Models\DocumentResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testPutSlideShapeInfo() {
		$body = array("Text" => "Shape Info");
		$fileName = "sample.pptx";

		Utils::uploadFile($fileName);
		$result = $this->slides->PutSlideShapeInfo($fileName, $slideIndex = "1", $shapePath = "1", $storage = "", $folder = "", $body);
	}

	public function testPutSetParagraphPortionProperties() {
		$body = array("Text" => "Paragraph portion text", "FontColor" => "#FF000000");
		$fileName = "sample.pptx";

		Utils::uploadFile($fileName);
		$result = $this->slides->PutSetParagraphPortionProperties($fileName, $slideIndex = "1", $shapeIndex = "1", $paragraphIndex = "1", $portionIndex = "1", $storage = "", $folder = "", $body);
		$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testPutSlidesConvert() {
		$file = realpath(__DIR__ . '/../../../../..'). '/Data/test_slides.pptx';
		$fileName = "sample.pptx";

		Utils::uploadFile($fileName);

		$result = $this->slides->PutSlidesConvert($password = "", $format = "pdf", $outPath = "", $file);
		$fh = fopen(realpath(__DIR__ . '/../../../../..'). '/Data/Output/test_slides.pdf', 'w');
		fwrite($fh, $result);
		fclose($fh);
		$this->assertFileExists(realpath(__DIR__ . '/../../../../..'). '/Data/Output/test_slides.pdf');
    }

    public function testPutSlidesDocumentFromHtml() {
		$file = realpath(__DIR__ . '/../../../../..'). '/Data/Test.html';
		$fileName = "sample.pptx";

		$result = $this->slides->PutSlidesDocumentFromHtml($fileName, $password = "", $storage = "", $folder = "", $file);
		$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
		$this->assertEquals(200, $result->Code);
    }
	
	public function testPutSlidesSetDocumentProperty() {
		$body = json_encode(array("Value" => "Author","Value" => "Imran Anwar"));
		
		$fileName = "sample-input.pptx";
		Utils::uploadFile($fileName);
		$result = $this->slides->PutSlidesSetDocumentProperty($fileName, $propertyName = "Author", $storage = "", $folder = "", $body);
		$this->assertInstanceOf('\Aspose\Slides\Models\DocumentPropertyResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testPostSlidesSaveAsHtml() {
		$fileName = "sample.pptx";
		$body = array("SaveAsZip" => "true");

		Utils::uploadFile($fileName);
		$result = $this->slides->PostSlidesSaveAsHtml($fileName, $password="", $storage="", $folder="", $outPath="", $body);
		$this->assertInternalType('string',$result );
    }
    
    public function testPostSlidesSaveAsPdf() {
		$fileName = "sample.pptx";
		$body = array("JpegQuality" => "50");

		Utils::uploadFile($fileName);
		$result = $this->slides->PostSlidesSaveAsPdf($fileName, $password="", $storage="", $folder="", $outPath="", $body);
		$this->assertInternalType('string',$result );
    }
    
    public function testPostSlidesSaveAsTiff()
    {
		$fileName = "sample.pptx";
		$body = array("ExportFormat" => "tiff");

		Utils::uploadFile($fileName);
		$result = $this->slides->PostSlidesSaveAsTiff($fileName, $password="", $storage="", $folder="", $outPath="", $body);
		$this->assertInternalType('string',$result );
    }
    
    public function testGetSlidesDocumentProperty()
    {
		$fileName = "sample.pptx";
		Utils::uploadFile($fileName);
		
		$result = $this->slides->GetSlidesDocumentProperty($fileName, $propertyName = "Author", $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\DocumentPropertyResponse', $result);
		$this->assertEquals(200, $result->Code);
	
    }

    public function testGetShapeWithFormat()
    {
		$fileName = "sample.pptx";
		Utils::uploadFile($fileName);

		$result = $this->slides->GetShapeWithFormat($fileName, $slideIndex = "1", $shapeIndex = "1", $format="png", $folder="", $storage="", $scaleX="", $scaleY="", $bounds="");
		$this->assertInternalType('string',$result );
		//$this->assertEquals(200, $result->Code);
    }
    
    public function testPostAddNewShape()
    {
		$fileName = "sample.pptx";
		$body = array("AlternativeText" => "Aspose","ShapeType" => "Line");
		Utils::uploadFile($fileName);

		$result = $this->slides->PostAddNewShape($fileName, $slideIndex = "1", $folder = "", $storage = "", $body);
		$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
		$this->assertEquals(201, $result->Code);
    }

    public function testPutSlidesSlideBackground() {
		$fileName = "sample.pptx";
		Utils::uploadFile($fileName);
		
		$result = $this->slides->PutSlidesSlideBackground($fileName, $slideIndex = "1", $folder = "", $storage = "", $body = "\"#FFFF0000\"");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideBackgroundResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

}    