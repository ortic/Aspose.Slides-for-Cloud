<?php
require_once realpath(__DIR__ . '/..') . '/vendor/autoload.php';
require_once realpath(__DIR__ . '/..') . '/Utils.php';

use Aspose\Slides\SlidesApi;
use Aspose\Slides\AsposeApp;

class Document {

	public $slidesApi;

	public function __construct() {
		AsposeApp::$appSID = Utils::appSID;
		AsposeApp::$apiKey = Utils::apiKey;
		$this->slidesApi = new SlidesApi();
	}

	public function postSlidesSplit() {
		$fileName = "sample-input.pptx";
		Utils::uploadFile($fileName);
		
		$result = $this->slidesApi->PostSlidesSplit($fileName, $width = "", $height = "", $to = "3", $from = "2", $destFolder = "", $format = "PNG", $storage = "", $folder = "");
		print_r($result);
	}
}

$document = new Document();
$document->postSlidesSplit();

?>