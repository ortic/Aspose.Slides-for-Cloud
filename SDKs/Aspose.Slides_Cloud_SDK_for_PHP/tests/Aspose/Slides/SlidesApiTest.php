<?php

use Aspose\Slides\SlidesApi;

class SlidesApiTest extends PHPUnit_Framework_TestCase {
    
    protected $slides;

    protected function setUp()
    {        
        $this->slides = new SlidesApi();
    }
    
    public function testDeleteSlideByIndex()
    {
        $result = $this->slides->DeleteSlideByIndex($name="test_slides.pptx", $slideIndex=1, $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testDeleteSlidesCleanSlidesList()
    {
        $result = $this->slides->DeleteSlidesCleanSlidesList($name="test_slides.pptx", $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testDeleteSlidesDocumentProperties()
    {
        $result = $this->slides->DeleteSlidesDocumentProperties($name="test_slides.pptx", $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testDeleteSlidesDocumentProperty()
    {
        $result = $this->slides->DeleteSlidesDocumentProperty($name="test_slides.pptx", $propertyName="Test", $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testDeleteSlidesSlideBackground()
    {
        $result = $this->slides->DeleteSlidesSlideBackground($name="test_slides.pptx", $slideIndex=1, $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetParagraphPortion()
    {
        $result = $this->slides->GetParagraphPortion($name="test_slides.pptx", $slideIndex=3, $shapeIndex=1, $paragraphIndex=1, $portionIndex=1, $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetShapeParagraph()
    {
        $result = $this->slides->GetShapeParagraph($name="test_slides.pptx", $slideIndex=3, $shapeIndex=1, $paragraphIndex=1, $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlideShapeParagraphs()
    {
        $result = $this->slides->GetSlideShapeParagraphs($name="test_slides.pptx", $slideIndex=3, $shapeIndex=1, $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlideWithFormat()
    {
        $result = $this->slides->GetSlideWithFormat($name="Test.pptx", $slideIndex=1, $format="png", $width=100, $height=100, $folder="", $storage="");
        $fh = fopen(getcwd(). '/Data/Output/Test.png', 'w');
        fwrite($fh, $result);
        fclose($fh);
        $this->assertFileExists(getcwd(). '/Data/Output/Test.png');
    }
        
    public function testGetSlidesDocument()
    {
        $result = $this->slides->GetSlidesDocument($name="Test.pptx", $password="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesDocumentProperties()
    {
        $result = $this->slides->GetSlidesDocumentProperties($name="Test.pptx");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesDocumentWithFormat()
    {
        $result = $this->slides->GetSlidesDocumentWithFormat($name="Test.pptx", $format="pdf", $jpegQuality = null, $password = null, $storage = null, $folder = null, $outPath = null);
        $fh = fopen(getcwd(). '/Data/Output/Test.pdf', 'w');
        fwrite($fh, $result);
        fclose($fh);
        $this->assertFileExists(getcwd(). '/Data/Output/Test.pdf');
    }
    
    public function testGetSlidesImages()
    {
        $result = $this->slides->GetSlidesImages($name="Test.pptx");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesPlaceholder()
    {
        $result = $this->slides->GetSlidesPlaceholder($name="Test.pptx", $slideIndex=1, $placeholderIndex=1, $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesPlaceholders()
    {
        $result = $this->slides->GetSlidesPlaceholders($name="Test.pptx", $slideIndex=1, $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesPresentationTextItems()
    {
        $result = $this->slides->GetSlidesPresentationTextItems($name="Test.pptx", $withEmpty="", $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesSlide()
    {
        $result = $this->slides->GetSlidesSlide($name="Test.pptx", $slideIndex=1, $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesSlideBackground()
    {
        $result = $this->slides->GetSlidesSlideBackground($name="Test.pptx", $slideIndex=1, $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesSlideComments()
    {
        $result = $this->slides->GetSlidesSlideComments($name="Test.pptx", $slideIndex=1, $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesSlideImages()
    {
        $result = $this->slides->GetSlidesSlideImages($name="Test.pptx", $slideIndex=1, $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesSlideShapes()
    {
        $result = $this->slides->GetSlidesSlideShapes($name="Test.pptx", $slideIndex=1, $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesSlideShapesParent()
    {
        $result = $this->slides->GetSlidesSlideShapesParent($name="Test.pptx", $slideIndex=1, $shapePath=1, $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesSlideTextItems()
    {
        $result = $this->slides->GetSlidesSlideTextItems($name="Test.pptx", $slideIndex=1, $withEmpty="", $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesSlidesList()
    {
        $result = $this->slides->GetSlidesSlidesList($name="Test.pptx", $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesTheme()
    {
        $result = $this->slides->GetSlidesTheme($name="Test.pptx", $slideIndex=1, $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesThemeColorScheme()
    {
        $result = $this->slides->GetSlidesThemeColorScheme($name="Test.pptx", $slideIndex=1, $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesThemeFontScheme()
    {
        $result = $this->slides->GetSlidesThemeFontScheme($name="Test.pptx", $slideIndex=1, $folder="", $storage="");        
        $this->assertEquals(200, $result->Code);
    }
    
    public function testGetSlidesThemeFormatScheme()
    {
        $result = $this->slides->GetSlidesThemeFormatScheme($name="test_slides.pptx", $slideIndex=1, $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPostAddEmptySlide()
    {
        $result = $this->slides->PostAddEmptySlide($name="test_slides.pptx", $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPostAddEmptySlideAtPosition()
    {
        $result = $this->slides->PostAddEmptySlideAtPosition($name="test_slides.pptx", $position=1, $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPostAddSlideCopy()
    {
        $result = $this->slides->PostAddSlideCopy($name="test_slides.pptx", $slideToClone=1, $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPostClonePresentationSlide()
    {
        $result = $this->slides->PostClonePresentationSlide($name="test_slides.pptx", $position=2, $slideToClone=1, $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPostCopySlideFromSourcePresentation()
    {
        $result = $this->slides->PostCopySlideFromSourcePresentation($name="test_slides.pptx", $slideToCopy=1, $source="Test.pptx", $position=1, $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPostPresentationMerge()
    {
        $result = $this->slides->PostPresentationMerge($name="test_slides.pptx", $folder="", $storage="", $body="Test.pptx");
        $this->assertEquals(200, $result->Code);
    }
    
    /*public function testPostSlidesDocument()
    {
        $result = $this->slides->PostSlidesDocument($name, $templatePath, $templateStorage = null, $isImageDataEmbeeded = null, $password = null, $storage = null, $folder = null, $file);
        $this->assertEquals(200, $result->Code);
    }*/
    
    public function testPostSlidesPresentationReplaceText()
    {
        $result = $this->slides->PostSlidesPresentationReplaceText($name="test_slides.pptx", $oldValue="Aspose", $newValue="Banckle", $ignoreCase="", $folder="", $storage="", $body="Test.pptx");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPostSlidesReorderPosition()
    {
        $result = $this->slides->PostSlidesReorderPosition($name="test_slides.pptx", $oldPosition=1, $newPosition=2, $folder="", $storage="", $body="Test.pptx");
        $this->assertEquals(200, $result->Code);
    }
    
    /*public function testPostSlidesSetDocumentProperties()
    {
        $body = json_encode(array("DocumentProperties" => array("Name" => "Test", "Value" => "Testing123")));
        echo $body; exit;
        $result = $this->slides->PostSlidesSetDocumentProperties($name="test_slides.pptx", $folder="", $storage="", $body);
        $this->assertEquals(200, $result->Code);
    }*/
    
    public function testPostSlidesSlideReplaceText()
    {
        $result = $this->slides->PostSlidesSlideReplaceText($name="test_slides.pptx", $slideIndex=1, $oldValue="Aspose", $newValue="Banckle", $ignoreCase="", $folder="", $storage="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPostSlidesSplit()
    {
        $result = $this->slides->PostSlidesSplit($name="test_slides.pptx", $width="", $height="", $to="", $from="", $destFolder="", $format="", $storage="", $folder="");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPutNewPresentation()
    {
        $file =  getcwd() . '/Data/Input/test_slides.pptx';
        $result = $this->slides->PutNewPresentation($name="new_presentation.pptx", $password="", $storage="", $folder="", $file);        
    }
    
    /*public function testPutNewPresentationFromStoredTemplate()
    {
        $file =  getcwd() . '/Data/Input/test_slides.pptx';
        $templatePath =  getcwd() . '/Data/Input/test_slides.pptx';
        $result = $this->slides->PutNewPresentationFromStoredTemplate($name="new_prep1.pptx", $templatePath, $templateStorage = null, $password = null, $storage="", $folder="", $file);
        $this->assertEquals(200, $result->Code);
    }*/
    
    public function testPutPresentationMerge()
    {
        $result = $this->slides->PutPresentationMerge($name="test_slides.pptx", $storage="", $folder="", $body="Test.pptx");
        $this->assertEquals(200, $result->Code);
    }
    
    /*public function testPutSetParagraphPortionProperties()
    {
        $result = $this->slides->PutSetParagraphPortionProperties($name="test_slides.pptx", $slideIndex=1, $shapeIndex=1, $paragraphIndex=1, $portionIndex=1, $storage="", $folder="", $body="Test.pptx");
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPutSlideShapeInfo()
    {
        $result = $this->slides->PutSlideShapeInfo($name="test_slides.pptx", $slideIndex, $shapePath, $storage="", $folder="", $body);
        $this->assertEquals(200, $result->Code);
    }*/
    
    public function testPutSlidesConvert()
    {
        $file =  getcwd() . '/Data/Input/test_slides.pptx';
        $result = $this->slides->PutSlidesConvert($password="", $format="pdf", $outPath="", $file);
        $fh = fopen(getcwd(). '/Data/Output/test_slides.pdf', 'w');
        fwrite($fh, $result);
        fclose($fh);
        $this->assertFileExists(getcwd(). '/Data/Output/test_slides.pdf');
    }
    
    public function testPutSlidesDocumentFromHtml()
    {
        $file =  getcwd() . '/Data/Input/index.html';
        $result = $this->slides->PutSlidesDocumentFromHtml($name="html.pptx", $password="", $storage="", $folder="", $file);
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPutSlidesSetDocumentProperty()
    {
        $body = json_encode(array("Value" => "just test"));
        $result = $this->slides->PutSlidesSetDocumentProperty($name="html.pptx", $propertyName="Test", $storage="", $folder="", $body);
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPutSlidesSlideBackground()
    {
        $result = $this->slides->PutSlidesSlideBackground($name="test_slides.pptx", $slideIndex=1, $folder="", $storage="", $body="#00FF00");
        $this->assertEquals(200, $result->Code);
    }
                      
}    