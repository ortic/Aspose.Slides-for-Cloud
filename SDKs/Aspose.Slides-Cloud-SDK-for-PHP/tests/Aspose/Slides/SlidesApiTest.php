<?php

use Aspose\Slides\SlidesApi;
use Aspose\Slides\AsposeApp;
use Aspose\Storage\StorageApi;

class SlidesApiTest extends PHPUnit_Framework_TestCase {
    
    protected $slides;
    protected $storageApi;

    protected function setUp()
    {        
    	AsposeApp::$appSID = "App Key";
        AsposeApp::$apiKey = "App SID";
        $this->slides = new SlidesApi();
		$this->storageApi = new StorageApi();
    }
    
    public function testDeleteSlideByIndex() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->DeleteSlideByIndex($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testDeleteSlidesCleanSlidesList() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->DeleteSlidesCleanSlidesList($fileName, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testDeleteSlidesDocumentProperties() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->DeleteSlidesDocumentProperties($fileName, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\DocumentPropertiesResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testDeleteSlidesDocumentProperty() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->DeleteSlidesDocumentProperty($fileName, $propertyName = "Author", $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\CommonResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testDeleteSlidesSlideBackground() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->DeleteSlidesSlideBackground($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideBackgroundResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testGetParagraphPortion() {
		$fileName = "test_slide_placeholder.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetParagraphPortion($fileName, $slideIndex = 3, $shapeIndex = 1, $paragraphIndex = 1, $portionIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\PortionResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetShapeParagraph() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetShapeParagraph($fileName, $slideIndex = 1, $shapeIndex = 1, $paragraphIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\ParagraphResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testGetSlideShapeParagraphs() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetSlideShapeParagraphs($fileName, $slideIndex = 1, $shapeIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\ParagraphsResponse', $result);
		$this->assertEquals(200, $result->Code);
    }


    
    public function testGetSlideWithFormat() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage="", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetSlideWithFormat($fileName, $slideIndex = 1, $format = "pdf", $width = "", $height = "", $folder = "", $storage = "");
		$this->assertInternalType('string',$result );
		$fh = fopen(getcwd(). '/../../../Data/Output/Test.png', 'w');
		fwrite($fh, $result);
		fclose($fh);
		$this->assertFileExists(getcwd(). '/../../../Data/Output/Test.png');
    }

        
    public function testGetSlidesDocument() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetSlidesDocument($fileName, $password = "");
		$this->assertInternalType('string',$result );
    }

    
    public function testGetSlidesDocumentProperties() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetSlidesDocumentProperties($fileName);
		$this->assertInstanceOf('\Aspose\Slides\Models\DocumentPropertiesResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesDocumentWithFormat() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetSlidesDocumentWithFormat($fileName, $format = "pdf", $jpegQuality = null, $password = null, $storage = null, $folder = null, $outPath = null);
		$fh = fopen(getcwd(). '/../../../Data/Output/Test.pdf', 'w');
		fwrite($fh, $result);
		fclose($fh);
		$this->assertFileExists(getcwd(). '/../../../Data/Output/Test.pdf');
		$this->assertInternalType('string',$result );
    }

    
    public function testGetSlidesImages() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetSlidesImages($fileName);
		$this->assertInstanceOf('\Aspose\Slides\Models\ImagesResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesPlaceholder() {
		$fileName = "sample-input.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetSlidesPlaceholder($fileName, $slideIndex = "1", $placeholderIndex = "0", $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\PlaceholderResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesPlaceholders() {
		$fileName = "sample-input.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetSlidesPlaceholders($fileName, $slideIndex = "1", $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\PlaceholdersResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesPresentationTextItems() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetSlidesPresentationTextItems($fileName, $withEmpty = "", $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\TextItemsResponse', $result);
		$this->assertEquals(200, $result->Code);
    }

    public function testGetSlidesSlide() {
		$fileName = "sample.pptx";
		$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
		$result = $this->slides->GetSlidesSlide($fileName, $slideIndex = 1, $folder = "", $storage = "");
		$this->assertInstanceOf('\Aspose\Slides\Models\SlideResponse', $result);
    }

    
    public function testGetSlidesSlideBackground() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesSlideBackground($fileName, $slideIndex = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\SlideBackgroundResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesSlideComments() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesSlideComments($fileName, $slideIndex = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\SlideCommentsResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    public function testGetSlidesSlideImages() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesSlideImages($fileName, $slideIndex = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\ImagesResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesSlideShapes() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesSlideShapes($fileName, $slideIndex = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\ShapeListResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesSlideShapesParent() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesSlideShapesParent($fileName, $slideIndex = 1, $shapePath = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\ShapeResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesSlideTextItems() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesSlideTextItems($fileName, $slideIndex = 1, $withEmpty = "", $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\TextItemsResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesSlidesList() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesSlidesList($fileName, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesTheme() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesTheme($fileName, $slideIndex = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\ThemeResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testGetSlidesThemeColorScheme() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesThemeColorScheme($fileName, $slideIndex = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\ColorSchemeResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    public function testGetSlidesThemeFontScheme() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesThemeFontScheme($fileName, $slideIndex = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\FontSchemeResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    public function testGetSlidesThemeFormatScheme() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesThemeFormatScheme($fileName, $slideIndex = "1", $folder = "", $storage = "");
	//$this->assertInstanceOf('\Aspose\Slides\Models\FormatSchemeResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    public function testPostAddEmptySlide() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostAddEmptySlide($fileName, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPostAddEmptySlideAtPosition() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostAddEmptySlideAtPosition($fileName, $position = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPostAddSlideCopy() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostAddSlideCopy($fileName, $slideToClone = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPostClonePresentationSlide() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostClonePresentationSlide($fileName, $position = 2, $slideToClone = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    public function testPostCopySlideFromSourcePresentation() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostCopySlideFromSourcePresentation($fileName, $slideToCopy = 1, $source = "sample-input.pptx", $position = 1, $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\SlideListResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPostPresentationMerge() {
	$fileName = "sample.pptx";
	$mergeFile1 = "welcome.pptx";
        $mergeFile2 = "demo.pptx";
	
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->storageApi->PutCreate($mergeFile1, "", $storage = "", getcwd(). '/../../../Data/' . $mergeFile1);
	$result = $this->storageApi->PutCreate($mergeFile2, "", $storage = "", getcwd(). '/../../../Data/' . $mergeFile2);
	
	$body = array("Presentations"=>array($mergeFile1, $mergeFile2));
	
	$result = $this->slides->PostPresentationMerge($fileName, $folder = "", $storage = "", $body);
	$this->assertInstanceOf('\Aspose\Slides\Models\DocumentResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPostSlidesDocument() {
	$file =  getcwd(). '/../../../Data/Test.html';
	echo $file;
	$templatePath = "sample.pptx";
	$fileName = "sample".rand().".pptx";
	$result = $this->storageApi->PutCreate($templatePath, "", $storage = "", getcwd(). '/../../../Data/' . $templatePath);
	$result = $this->slides->PostSlidesDocument($fileName, $templatePath, $templateStorage = null, $isImageDataEmbeeded = null, $password = null, $storage = null, $folder = null, $file);
	$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
	$this->assertEquals(201, $result->Code);
    }

    
    public function testPostSlidesPresentationReplaceText() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostSlidesPresentationReplaceText($fileName , $oldValue = "Aspose", $newValue = "Banckle", $ignoreCase = "", $folder = "", $storage = "", $body = "Test.pptx");
	$this->assertInstanceOf('\Aspose\Slides\Models\PresentationStringReplaceResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPostSlidesReorderPosition() {
	$fileName = "sample-input.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
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
	$fileName = "sample-input.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostSlidesSetDocumentProperties($fileName, $folder = "", $storage = "", $body);
	$this->assertInstanceOf('\Aspose\Slides\Models\DocumentPropertiesResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPostSlidesSlideReplaceText() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostSlidesSlideReplaceText($fileName, $slideIndex = 1, $oldValue = "Aspose", $newValue = "Banckle", $ignoreCase = "", $folder = "", $storage = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\SlideStringReplaceResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPostSlidesSplit() {
	$fileName = "sample-input.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostSlidesSplit($fileName, $width = "", $height = "", $to = "3", $from = "2", $destFolder = "", $format = "PNG", $storage = "", $folder = "");
	$this->assertInstanceOf('\Aspose\Slides\Models\SplitDocumentResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    public function testPutNewPresentation() {
	
	$fileName = "sample".rand().".pptx";
	$file = getcwd(). '/../../../Data/sample.pptx';
		
	$result = $this->slides->PutNewPresentation($fileName, $password = "", $storage = "", $folder = "", $file);
	$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
	$this->assertEquals(201, $result->Code);
    }

    
    public function testPutNewPresentationFromStoredTemplate() {	
	$fileName = "sample" . rand() . ".pptx";
	$templatePath = "sample.pptx";
	$file = $templatePath;
	$result = $this->storageApi->PutCreate($templatePath, "", $storage = "", getcwd(). '/../../../Data/' . $templatePath);
	
	$result = $this->slides->PutNewPresentationFromStoredTemplate($fileName, $templatePath, $templateStorage = null, $password = null, $storage = null, $folder = null, $file);
	$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
	$this->assertEquals(201, $result->Code);
    }

    
    public function testPutPresentationMerge() {
	$fileName = "sample.pptx";
	$mergeFile1 = "welcome.pptx";
	
	$body = array("Presentations"=>array($mergeFile1));
	
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->storageApi->PutCreate($mergeFile1, "", $storage = "", getcwd(). '/../../../Data/' . $mergeFile1);	
		
	$result = $this->slides->PutPresentationMerge($fileName, $storage = "", $folder = "", $body);
	$this->assertInstanceOf('\Aspose\Slides\Models\DocumentResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPutSetParagraphPortionProperties() {
	$body = array("Text" => "Paragraph portion text", "FontColor" => "#FF000000");
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PutSetParagraphPortionProperties($fileName, $slideIndex = "1", $shapeIndex = "1", $paragraphIndex = "1", $portionIndex = "1", $storage = "", $folder = "", $body);
	$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);

    }

    
    public function testPutNewPresentationFromStoredTemplate() {	
	$fileName = "sample" . rand() . ".pptx";
	$templatePath = "sample.pptx";
	$file = $templatePath;
	$result = $this->storageApi->PutCreate($templatePath, "", $storage = "", getcwd(). '/../../../Data/' . $templatePath);
	
	$result = $this->slides->PutNewPresentationFromStoredTemplate($fileName, $templatePath, $templateStorage = null, $password = null, $storage = null, $folder = null, $file);
	$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
	$this->assertEquals(201, $result->Code);
    }

    
    public function testPutPresentationMerge() {
	$fileName = "sample.pptx";
	$mergeFile1 = "welcome.pptx";
	
	$body = array("Presentations"=>array($mergeFile1));
	
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->storageApi->PutCreate($mergeFile1, "", $storage = "", getcwd(). '/../../../Data/' . $mergeFile1);	
		
	$result = $this->slides->PutPresentationMerge($fileName, $storage = "", $folder = "", $body);
	$this->assertInstanceOf('\Aspose\Slides\Models\DocumentResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    public function testPutSlideShapeInfo() {
	$body = array("Text" => "Shape Info");
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PutSlideShapeInfo($fileName, $slideIndex = "1", $shapePath = "1", $storage = "", $folder = "", $body);
    public function testPutSetParagraphPortionProperties() {
	$body = array("Text" => "Paragraph portion text", "FontColor" => "#FF000000");
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PutSetParagraphPortionProperties($fileName, $slideIndex = "1", $shapeIndex = "1", $paragraphIndex = "1", $portionIndex = "1", $storage = "", $folder = "", $body);
	$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
	$this->assertEquals(200, $result->Code);
    }

    public function testPutSlidesConvert() {
	$file = getcwd(). '/../../../Data/test_slides.pptx';
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PutSlidesConvert($password = "", $format = "pdf", $outPath = "", $file);
	$fh = fopen(getcwd(). '/../../../Data/Output/test_slides.pdf', 'w');
	fwrite($fh, $result);
	fclose($fh);
	$this->assertFileExists(getcwd(). '/../../../Data/Output/test_slides.pdf');
    }

    
    public function testPutSlidesDocumentFromHtml() {
	$file = getcwd(). '/../../../Data/Test.html';
	$fileName = "sample.pptx";

	$result = $this->slides->PutSlidesDocumentFromHtml($fileName, $password = "", $storage = "", $folder = "", $file);
	$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPutSlidesSetDocumentProperty() {
	$body = json_encode(array("Value" => "Author","Value" => "Imran Anwar"));
	$fileName = "sample-input.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PutSlidesSetDocumentProperty($fileName, $propertyName = "Author", $storage = "", $folder = "", $body);
	$this->assertInstanceOf('\Aspose\Slides\Models\DocumentPropertyResponse', $result);

    public function testPutSlideShapeInfo() {
	$body = array("Text" => "Shape Info");
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PutSlideShapeInfo($fileName, $slideIndex = "1", $shapePath = "1", $storage = "", $folder = "", $body);
	$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPutSlidesConvert() {
	$file = getcwd(). '/../../../Data/test_slides.pptx';
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PutSlidesConvert($password = "", $format = "pdf", $outPath = "", $file);
	$fh = fopen(getcwd(). '/../../../Data/Output/test_slides.pdf', 'w');
	fwrite($fh, $result);
	fclose($fh);
	$this->assertFileExists(getcwd(). '/../../../Data/Output/test_slides.pdf');
    }

    
    public function testPutSlidesDocumentFromHtml() {
	$file = getcwd(). '/../../../Data/Test.html';
	$fileName = "sample.pptx";

	$result = $this->slides->PutSlidesDocumentFromHtml($fileName, $password = "", $storage = "", $folder = "", $file);
	$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPutSlidesSlideBackground() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PutSlidesSlideBackground($fileName, $slideIndex = "1", $folder = "", $storage = "", $body = "\"#FFFF0000\"");
	$this->assertInstanceOf('\Aspose\Slides\Models\SlideBackgroundResponse', $result);
    public function testPutSlidesSetDocumentProperty() {
	$body = json_encode(array("Value" => "Author","Value" => "Imran Anwar"));
	$fileName = "sample-input.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PutSlidesSetDocumentProperty($fileName, $propertyName = "Author", $storage = "", $folder = "", $body);
	$this->assertInstanceOf('\Aspose\Slides\Models\DocumentPropertyResponse', $result);
	$this->assertEquals(200, $result->Code);
    }

    
    public function testPostSlidesSaveAsHtml()
    {
	$fileName = "sample.pptx";
	$body = array("SaveAsZip" => "true");
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostSlidesSaveAsHtml($fileName, $password="", $storage="", $folder="", $outPath="", $body);
	$this->assertInternalType('string',$result );
	//$this->assertEquals(200, $result->Code);
    }
        public function testPostSlidesSaveAsPdf()
    {
	$fileName = "sample.pptx";
	$body = array("JpegQuality" => "50");
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostSlidesSaveAsPdf($fileName, $password="", $storage="", $folder="", $outPath="", $body);
	$this->assertInternalType('string',$result );
	//$this->assertEquals(200, $result->Code);
    }
        public function testPostSlidesSaveAsTiff()
    {
	$fileName = "sample.pptx";
	$body = array("ExportFormat" => "tiff");
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostSlidesSaveAsTiff($fileName, $password="", $storage="", $folder="", $outPath="", $body);
	$this->assertInternalType('string',$result );
	//$this->assertEquals(200, $result->Code);
    }
    public function testGetSlidesDocumentProperty()
    {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetSlidesDocumentProperty($fileName, $propertyName  = "Author", $folder = "", $storage = "");
	//$this->assertInternalType('string',$result );
	$this->assertInstanceOf('\Aspose\Slides\Models\DocumentPropertyResponse', $result);
	$this->assertEquals(200, $result->Code);
	
    }
        public function testGetShapeWithFormat()
    {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->GetShapeWithFormat($fileName, $slideIndex = "1", $shapeIndex = "1", $format="png", $folder="", $storage="", $scaleX="", $scaleY="", $bounds="");
	$this->assertInternalType('string',$result );
	//$this->assertEquals(200, $result->Code);
    }
       public function testPostAddNewShape()
    {
	$fileName = "sample.pptx";
	$body = array("AlternativeText" => "Aspose","ShapeType" => "Line");
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PostAddNewShape($fileName, $slideIndex = "1", $folder = "", $storage = "", $body);
	$this->assertInstanceOf('\Aspose\Slides\Models\ResponseMessage', $result);
	$this->assertEquals(201, $result->Code);
    }

    public function testPutSlidesSlideBackground() {
	$fileName = "sample.pptx";
	$result = $this->storageApi->PutCreate($fileName, "", $storage = "", getcwd(). '/../../../Data/' . $fileName);
	$result = $this->slides->PutSlidesSlideBackground($fileName, $slideIndex = "1", $folder = "", $storage = "", $body = "\"#FFFF0000\"");
	$this->assertInstanceOf('\Aspose\Slides\Models\SlideBackgroundResponse', $result);
	$this->assertEquals(200, $result->Code);
    }


}    