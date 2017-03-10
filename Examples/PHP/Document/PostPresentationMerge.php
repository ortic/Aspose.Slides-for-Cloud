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

	public function postPresentationMerge() {
		$fileName = "sample.pptx";
		$mergeFile1 = "welcome.pptx";
	    $mergeFile2 = "demo.pptx";
		
		Utils::uploadFile($fileName);
		Utils::uploadFile($mergeFile1);
		Utils::uploadFile($mergeFile2);
		
		$body = array("Presentations"=>array($mergeFile1, $mergeFile2));
		
		$result = $this->slidesApi->PostPresentationMerge($fileName, $folder = "", $storage = "", $body);
		print_r($result);
	}
}

$document = new Document();
$document->postPresentationMerge();

?>