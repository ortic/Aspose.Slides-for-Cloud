//ExStart:
<?php
require_once realpath(__DIR__ . '/..') . '/vendor/autoload.php';
require_once realpath(__DIR__ . '/..') . '/Utils.php';

use Aspose\Slides\SlidesApi;
use Aspose\Slides\AsposeApp;

class Images {

	public $slidesApi;

	public function __construct() {
		AsposeApp::$appSID = Utils::appSID;
		AsposeApp::$apiKey = Utils::apiKey;
		$this->slidesApi = new SlidesApi();
	}

	public function getSlidesImages() {
		$fileName = "sample.pptx";
		Utils::uploadFile($fileName);
		
		$result = $this->slidesApi->GetSlidesImages($fileName);
		print_r($result);
	}
}

$images = new Images();
$images->getSlidesImages();

?>
//ExEnd:
