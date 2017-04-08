//ExStart:
<?php
require_once realpath(__DIR__ . '/..') . '/vendor/autoload.php';
require_once realpath(__DIR__ . '/..') . '/Utils.php';

use Aspose\Slides\SlidesApi;
use Aspose\Slides\AsposeApp;

class DocumentProperties {

	public $slidesApi;

	public function __construct() {
		AsposeApp::$appSID = Utils::appSID;
		AsposeApp::$apiKey = Utils::apiKey;
		$this->slidesApi = new SlidesApi();
	}

	public function deleteSlidesDocumentProperty() {
		$fileName = "sample-input.pptx";
		Utils::uploadFile($fileName);

		$result = $this->slidesApi->DeleteSlidesDocumentProperty($fileName, $propertyName = "AsposeAuthor", $folder = "", $storage = "");
		print_r($result);
	}
}

$documentProperties = new DocumentProperties();
$documentProperties->deleteSlidesDocumentProperty();

?>
//ExEnd:
