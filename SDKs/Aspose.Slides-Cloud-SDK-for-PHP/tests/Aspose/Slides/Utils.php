//ExStart:
<?php
require_once realpath(__DIR__ . '/../../..') . '/vendor/autoload.php';

use Aspose\Storage\StorageApi;
use Aspose\Storage\AsposeApp;

class Utils {
	# Get App key and App SID from https://cloud.aspose.com
	const appSID = "";
	const apiKey = "";

	public static function uploadFile($fileName) {
		AsposeApp::$appSID = Utils::appSID;
		AsposeApp::$apiKey = Utils::apiKey;

		$storage = new StorageApi();

		$file = realpath(__DIR__ . '/../../../../..') . '/Data/' . $fileName;
        $result = $storage->PutCreate($Path=$fileName, $versionId = null, $storage = null, $file); 
	} 
}

?>
//ExEnd:
