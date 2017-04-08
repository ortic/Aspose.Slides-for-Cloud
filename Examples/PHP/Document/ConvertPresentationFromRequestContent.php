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

	public function putSlidesConvert() {
		$file = realpath(__DIR__ . '/../../..') . '/Data/sample.pptx';

		$result = $this->slidesApi->PutSlidesConvert($password = "", $format = "pdf", $outPath = "", $file);
		$fh = fopen(realpath(__DIR__ . '/../../..') . '/Data/Output/test_slides.pdf', 'w');
		fwrite($fh, $result);
		fclose($fh);
	}
}

$document = new Document();
$document->putSlidesConvert();

?>
//ExEnd:
