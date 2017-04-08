//ExStart:
<?php
require_once realpath(__DIR__ . '/..') . '/vendor/autoload.php';
require_once realpath(__DIR__ . '/..') . '/Utils.php';

use Aspose\Slides\SlidesApi;
use Aspose\Slides\AsposeApp;

class Shapes {

	public $slidesApi;

	public function __construct() {
		AsposeApp::$appSID = Utils::appSID;
		AsposeApp::$apiKey = Utils::apiKey;
		$this->slidesApi = new SlidesApi();
	}

	public function getSlidesSlideShapes() {
		$fileName = "sample.pptx";
		Utils::uploadFile($fileName);
		
		$result = $this->slidesApi->GetSlidesSlideShapes($fileName, $slideIndex = 1, $folder = "", $storage = "MyDropboxStorage");
		print_r($result);
	}
}

$shapes = new Shapes();
$shapes->getSlidesSlideShapes();

?>
//ExEnd:
