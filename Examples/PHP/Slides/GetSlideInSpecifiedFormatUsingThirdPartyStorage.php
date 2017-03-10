<?php
require_once realpath(__DIR__ . '/..') . '/vendor/autoload.php';
require_once realpath(__DIR__ . '/..') . '/Utils.php';

use Aspose\Slides\SlidesApi;
use Aspose\Slides\AsposeApp;

class Slides {

	public $slidesApi;

	public function __construct() {
		AsposeApp::$appSID = Utils::appSID;
		AsposeApp::$apiKey = Utils::apiKey;
		$this->slidesApi = new SlidesApi();
	}

	public function getSlideWithFormat() {
		$fileName = "sample.pptx";
		Utils::uploadFile($fileName);
		$result = $this->slidesApi->GetSlideWithFormat($fileName, $slideIndex = 1, $format = "pdf", $width = "", $height = "", $folder = "", $storage = "");
		$fh = fopen(realpath(__DIR__ . '/../../..') . '/Data/Output/Test.png', 'w');
		fwrite($fh, $result);
		fclose($fh);
	}
}

$slides = new Slides();
$slides->getSlideWithFormat();

?>