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

	public function getSlidesSlideShapesParent() {
		$fileName = "sample.pptx";
		Utils::uploadFile($fileName);
		
		$result = $this->slidesApi->GetSlidesSlideShapesParent($fileName, $slideIndex = 1, $shapePath = 1, $folder = "", $storage = "");
		print_r($result);
	}
}

$shapes = new Shapes();
$shapes->getSlidesSlideShapesParent();

?>