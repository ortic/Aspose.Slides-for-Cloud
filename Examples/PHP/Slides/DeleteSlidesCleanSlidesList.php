//ExStart:
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

	public function deleteSlidesCleanSlidesList() {
		$fileName = "sample.pptx";
		Utils::uploadFile($fileName);

		$result = $this->slidesApi->DeleteSlidesCleanSlidesList($fileName, $folder = "", $storage = "");
		print_r($result);
	}
}

$slides = new Slides();
$slides->deleteSlidesCleanSlidesList();

?>
//ExEnd:
