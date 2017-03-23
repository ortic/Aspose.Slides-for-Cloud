//ExStart:
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

	public function putPresentationMerge() {
		$fileName = "sample.pptx";
		$mergeFile1 = "welcome.pptx";
		
		$body = array("Presentations"=>array($mergeFile1));
		
		Utils::uploadFile($fileName);
		Utils::uploadFile($mergeFile1);	
			
		$result = $this->slidesApi->PutPresentationMerge($fileName, $storage = "", $folder = "", $body);
		print_r($result);
	}
}

$document = new Document();
$document->putPresentationMerge();

?>
//ExEnd:
