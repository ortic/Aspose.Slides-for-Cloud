//ExStart:
<?php
require_once realpath(__DIR__ . '/..') . '/vendor/autoload.php';
require_once realpath(__DIR__ . '/..') . '/Utils.php';

use Aspose\Slides\SlidesApi;
use Aspose\Slides\AsposeApp;

class Text {

	public $slidesApi;

	public function __construct() {
		AsposeApp::$appSID = Utils::appSID;
		AsposeApp::$apiKey = Utils::apiKey;
		$this->slidesApi = new SlidesApi();
	}

	public function getSlidesPresentationTextItems() {
		$fileName = "sample.pptx";
		Utils::uploadFile($fileName);

		$result = $this->slidesApi->GetSlidesPresentationTextItems($fileName, $withEmpty = "", $folder = "", $storage = "");
		print_r($result);
	}
}

$text = new Text();
$text->getSlidesPresentationTextItems();

?>
//ExEnd:
