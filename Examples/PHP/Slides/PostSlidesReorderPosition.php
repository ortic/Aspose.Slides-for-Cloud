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

	public function postSlidesReorderPosition() {
		$fileName = "sample-input.pptx";
		Utils::uploadFile($fileName);

		$result = $this->slidesApi->PostSlidesReorderPosition($fileName, $oldPosition = 1, $newPosition = 2, $folder = "", $storage = "", $body = null);
		print_r($result);
	}
}

$slides = new Slides();
$slides->postSlidesReorderPosition();

?>
//ExEnd:
