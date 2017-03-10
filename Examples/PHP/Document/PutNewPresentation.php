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

	public function putNewPresentation() {
		$fileName = "sample".rand().".pptx";
		$file = realpath(__DIR__ . '/../../..') . '/Data/sample.pptx';
			
		$result = $this->slidesApi->PutNewPresentation($fileName, $password = "", $storage = "", $folder = "", $file);
		print_r($result);
	}
}

$document = new Document();
$document->putNewPresentation();

?>