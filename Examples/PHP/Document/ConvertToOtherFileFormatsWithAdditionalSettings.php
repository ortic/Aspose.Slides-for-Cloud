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

	public function getSlidesDocumentWithFormat() {
		$fileName = "sample.pptx";
		Utils::uploadFile($fileName);

		$result = $this->slidesApi->GetSlidesDocumentWithFormat($fileName, $format = "pdf", $jpegQuality = null, $password = null, $storage = null, $folder = null, $outPath = null);
		$fh = fopen(realpath(__DIR__ . '/../../..') . '/Data/Output/Test.pdf', 'w');
		fwrite($fh, $result);
		fclose($fh);
	}
}

$document = new Document();
$document->getSlidesDocumentWithFormat();

?>