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

	public function postSlidesPresentationReplaceText() {
		$fileName = "sample.pptx";
		Utils::uploadFile($fileName);

		$result = $this->slidesApi->PostSlidesPresentationReplaceText($fileName, $oldValue = "Aspose", $newValue = "Aspose File Format APIs", $ignoreCase = "", $folder = "", $storage = "", $body = null);
		print_r($result);
	}
}

$text = new Text();
$text->postSlidesPresentationReplaceText();

?>