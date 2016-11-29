<?php

namespace Aspose\Slides;

use Aspose\Slides\ApiException as Exception;
use Aspose\Slides\APIClient;

class SlidesApi {

    function __construct() {
	$this->apiClient = new ApiClient();
    }

    /**
     * GetSlidesDocument
     * Read presentation info.
     * name, string: The document name. (required)

     * password, string: The document password. (optional)

     * storage, string: Document's storage. (optional)

     * folder, string: Document's folder. (optional)

     * @return ResponseMessage
     */
    public function GetSlidesDocument($name, $password = null, $storage = null, $folder = null) {
	// verify required params are set
	if ($name == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/octet-stream';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($password != null) {
	    $resourcePath = str_replace("{" . "password" . "}", $this->apiClient->toQueryValue($password), $resourcePath);
	} else {
	    $resourcePath = str_replace("&password={" . "password" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ResponseMessage');
	return $responseObject;
    }

    /**
     * GetSlidesDocumentWithFormat
     * Export presentation to some format.
     * name, string: The document name. (required)

     * format, string: The conversion format. (required)

     * jpegQuality, integer: Quality of the JPEG images inside PDF document. (optional)

     * password, string: The document password. (optional)

     * storage, string: Document's storage. (optional)

     * folder, string: Document's folder. (optional)

     * outPath, string: Path to save result (optional)

     * @return ResponseMessage
     */
    public function GetSlidesDocumentWithFormat($name, $format, $jpegQuality = null, $password = null, $storage = null, $folder = null, $outPath = null) {
	// verify required params are set
	if ($name == '' || $format == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/?appSid={appSid}&amp;toFormat={toFormat}&amp;jpegQuality={jpegQuality}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/octet-stream';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($format != null) {
	    $resourcePath = str_replace("{" . "format" . "}", $this->apiClient->toQueryValue($format), $resourcePath);
	} else {
	    $resourcePath = str_replace("&format={" . "format" . "}", "", $resourcePath);
	}
	if ($jpegQuality != null) {
	    $resourcePath = str_replace("{" . "jpegQuality" . "}", $this->apiClient->toQueryValue($jpegQuality), $resourcePath);
	} else {
	    $resourcePath = str_replace("&jpegQuality={" . "jpegQuality" . "}", "", $resourcePath);
	}
	if ($password != null) {
	    $resourcePath = str_replace("{" . "password" . "}", $this->apiClient->toQueryValue($password), $resourcePath);
	} else {
	    $resourcePath = str_replace("&password={" . "password" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($outPath != null) {
	    $resourcePath = str_replace("{" . "outPath" . "}", $this->apiClient->toQueryValue($outPath), $resourcePath);
	} else {
	    $resourcePath = str_replace("&outPath={" . "outPath" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ResponseMessage');
	return $responseObject;
    }

    /**
     * PostSlidesDocument
     * Create presentation
     * name, string: The document name. (required)

     * templatePath, string: Template file path. (required)

     * templateStorage, string: Template storage name. (optional)

     * isImageDataEmbeeded, bool: Is Image Data Embeeded (optional)

     * password, string: The document password. (optional)

     * storage, string: Document's storage. (optional)

     * folder, string: Document's folder. (optional)

     * file, File:  (required)

     * @return ResponseMessage
     */
    public function PostSlidesDocument($name, $templatePath, $templateStorage = null, $isImageDataEmbeeded = null, $password = null, $storage = null, $folder = null, $file) {
	// verify required params are set
	if ($name == '' || $templatePath == '' || $file == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/?appSid={appSid}&amp;templatePath={templatePath}&amp;templateStorage={templateStorage}&amp;isImageDataEmbeeded={isImageDataEmbeeded}&amp;password={password}&amp;storage={storage}&amp;folder={folder}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'multipart/form-data';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($templatePath != null) {
	    $resourcePath = str_replace("{" . "templatePath" . "}", $this->apiClient->toQueryValue($templatePath), $resourcePath);
	} else {
	    $resourcePath = str_replace("&templatePath={" . "templatePath" . "}", "", $resourcePath);
	}
	if ($templateStorage != null) {
	    $resourcePath = str_replace("{" . "templateStorage" . "}", $this->apiClient->toQueryValue($templateStorage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&templateStorage={" . "templateStorage" . "}", "", $resourcePath);
	}
	if ($isImageDataEmbeeded != null) {
	    $resourcePath = str_replace("{" . "isImageDataEmbeeded" . "}", $this->apiClient->toQueryValue($isImageDataEmbeeded), $resourcePath);
	} else {
	    $resourcePath = str_replace("&isImageDataEmbeeded={" . "isImageDataEmbeeded" . "}", "", $resourcePath);
	}
	if ($password != null) {
	    $resourcePath = str_replace("{" . "password" . "}", $this->apiClient->toQueryValue($password), $resourcePath);
	} else {
	    $resourcePath = str_replace("&password={" . "password" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ResponseMessage');
	return $responseObject;
    }

    /**
     * PostSlidesSplit
     * Splitting presentations. Create one image per slide.
     * name, string: The document name. (required)

     * width, int: The width of created images. (optional)

     * height, int: The height of created images. (optional)

     * to, int: The last slide number for splitting, if is not specified splitting ends at the last slide of the document. (optional)

     * from, int: The start slide number for splitting, if is not specified splitting starts from the first slide of the presentation. (optional)

     * destFolder, string: Folder on storage where images are going to be uploaded. If not specified then images are uploaded to same folder as presentation. (optional)

     * format, string: The format. Default value is jpeg. (optional)

     * storage, string: The document storage. (optional)

     * folder, string: The document folder. (optional)

     * @return SplitDocumentResponse
     */
    public function PostSlidesSplit($name, $width = null, $height = null, $to = null, $from = null, $destFolder = null, $format = null, $storage = null, $folder = null) {
	// verify required params are set
	if ($name == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/split/?appSid={appSid}&amp;width={width}&amp;height={height}&amp;to={to}&amp;from={from}&amp;destFolder={destFolder}&amp;toFormat={toFormat}&amp;storage={storage}&amp;folder={folder}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($width != null) {
	    $resourcePath = str_replace("{" . "width" . "}", $this->apiClient->toQueryValue($width), $resourcePath);
	} else {
	    $resourcePath = str_replace("&width={" . "width" . "}", "", $resourcePath);
	}
	if ($height != null) {
	    $resourcePath = str_replace("{" . "height" . "}", $this->apiClient->toQueryValue($height), $resourcePath);
	} else {
	    $resourcePath = str_replace("&height={" . "height" . "}", "", $resourcePath);
	}
	if ($to != null) {
	    $resourcePath = str_replace("{" . "to" . "}", $this->apiClient->toQueryValue($to), $resourcePath);
	} else {
	    $resourcePath = str_replace("&to={" . "to" . "}", "", $resourcePath);
	}
	if ($from != null) {
	    $resourcePath = str_replace("{" . "from" . "}", $this->apiClient->toQueryValue($from), $resourcePath);
	} else {
	    $resourcePath = str_replace("&from={" . "from" . "}", "", $resourcePath);
	}
	if ($destFolder != null) {
	    $resourcePath = str_replace("{" . "destFolder" . "}", $this->apiClient->toQueryValue($destFolder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&destFolder={" . "destFolder" . "}", "", $resourcePath);
	}
	if ($format != null) {
	    $resourcePath = str_replace("{" . "format" . "}", $this->apiClient->toQueryValue($format), $resourcePath);
	} else {
	    $resourcePath = str_replace("&format={" . "format" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SplitDocumentResponse');
	return $responseObject;
    }

    /**
     * PutNewPresentation
     * Create presentation
     * name, string: The document name. (required)

     * password, string: The document password. (optional)

     * storage, string: Document's storage. (optional)

     * folder, string: Document's folder. (optional)

     * file, File:  (required)

     * @return ResponseMessage
     */
    public function PutNewPresentation($name, $password = null, $storage = null, $folder = null, $file) {
	// verify required params are set
	if ($name == '' || $file == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "PUT";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'multipart/form-data';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($password != null) {
	    $resourcePath = str_replace("{" . "password" . "}", $this->apiClient->toQueryValue($password), $resourcePath);
	} else {
	    $resourcePath = str_replace("&password={" . "password" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ResponseMessage');
	return $responseObject;
    }

    /**
     * PutNewPresentationFromStoredTemplate
     * Create presentation from stored template
     * name, string: The document name. (required)

     * templatePath, string: Template file path. (required)

     * templateStorage, string: Template storage name. (optional)

     * password, string: The document password. (optional)

     * storage, string: Document's storage. (optional)

     * folder, string: Document's folder. (optional)

     * file, File:  (required)

     * @return ResponseMessage
     */
    public function PutNewPresentationFromStoredTemplate($name, $templatePath, $templateStorage = null, $password = null, $storage = null, $folder = null, $file) {
	// verify required params are set
	if ($name == '' || $templatePath == '' || $file == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/?appSid={appSid}&amp;templatePath={templatePath}&amp;templateStorage={templateStorage}&amp;password={password}&amp;storage={storage}&amp;folder={folder}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "PUT";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'multipart/form-data';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($templatePath != null) {
	    $resourcePath = str_replace("{" . "templatePath" . "}", $this->apiClient->toQueryValue($templatePath), $resourcePath);
	} else {
	    $resourcePath = str_replace("&templatePath={" . "templatePath" . "}", "", $resourcePath);
	}
	if ($templateStorage != null) {
	    $resourcePath = str_replace("{" . "templateStorage" . "}", $this->apiClient->toQueryValue($templateStorage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&templateStorage={" . "templateStorage" . "}", "", $resourcePath);
	}
	if ($password != null) {
	    $resourcePath = str_replace("{" . "password" . "}", $this->apiClient->toQueryValue($password), $resourcePath);
	} else {
	    $resourcePath = str_replace("&password={" . "password" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ResponseMessage');
	return $responseObject;
    }

    /**
     * PutSlidesConvert
     * Convert presentation from request content to format specified.
     * password, string: The document password. (optional)

     * format, string: The format. (optional)

     * outPath, string: Path to save result (optional)

     * file, File:  (required)

     * @return ResponseMessage
     */
    public function PutSlidesConvert($password = null, $format = null, $outPath = null, $file) {
	// verify required params are set
	if ($file == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/convert/?appSid={appSid}&amp;password={password}&amp;toFormat={toFormat}&amp;outPath={outPath}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "PUT";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/octet-stream';
	$headerParams['Content-Type'] = 'multipart/form-data';

	if ($password != null) {
	    $resourcePath = str_replace("{" . "password" . "}", $this->apiClient->toQueryValue($password), $resourcePath);
	} else {
	    $resourcePath = str_replace("&password={" . "password" . "}", "", $resourcePath);
	}
	if ($format != null) {
	    $resourcePath = str_replace("{" . "format" . "}", $this->apiClient->toQueryValue($format), $resourcePath);
	} else {
	    $resourcePath = str_replace("&format={" . "format" . "}", "", $resourcePath);
	}
	if ($outPath != null) {
	    $resourcePath = str_replace("{" . "outPath" . "}", $this->apiClient->toQueryValue($outPath), $resourcePath);
	} else {
	    $resourcePath = str_replace("&outPath={" . "outPath" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ResponseMessage');
	return $responseObject;
    }

    /**
     * PutSlidesDocumentFromHtml
     * Create presentation document from html
     * name, string: The document name. (required)

     * password, string: The document password. (optional)

     * storage, string: Document's storage. (optional)

     * folder, string: Document's folder. (optional)

     * file, File:  (required)

     * @return ResponseMessage
     */
    public function PutSlidesDocumentFromHtml($name, $password = null, $storage = null, $folder = null, $file) {
	// verify required params are set
	if ($name == '' || $file == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/fromHtml/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "PUT";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'multipart/form-data';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($password != null) {
	    $resourcePath = str_replace("{" . "password" . "}", $this->apiClient->toQueryValue($password), $resourcePath);
	} else {
	    $resourcePath = str_replace("&password={" . "password" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ResponseMessage');
	return $responseObject;

    }
	/**
	 * PostSlidesSaveAsHtml
	 * 
	* name, string:  (required)

	* password, string:  (optional)

	* storage, string:  (optional)

	* folder, string:  (optional)

	* outPath, string:  (optional)

	* body, HtmlExportOptions:  (required)

	* @return ResponseMessage
	 */
   
	public function PostSlidesSaveAsHtml($name, $password=null, $storage=null, $folder=null, $outPath=null, $body) {
		// verify required params are set
		if($name == '' || $body == '' ) {
			throw new Exception("missing required params");
		}
		//parse inputs
		$resourcePath = "/slides/{name}/saveAs/html/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}";
		//$resourcePath = str_replace("{format}", "json", $resourcePath);
		$resourcePath = str_replace("toFormat={toFormat}", "format={format}",str_replace("/?", "?",str_replace("&amp;", "&",str_replace("\\*", "",$resourcePath))));
		$method = "POST";
		$queryParams = array();
		$headerParams = array();
		$headerParams['Accept'] = 'application/xml,application/octet-stream';
		$headerParams['Content-Type'] = 'application/json';

		if($name != null) {
			$resourcePath = str_replace("{" . "name" . "}" , $this->apiClient->toQueryValue($name), $resourcePath);
			}else{
				$resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
			}
			if($password != null) {
			$resourcePath = str_replace("{" . "password" . "}" , $this->apiClient->toQueryValue($password), $resourcePath);
			}else{
				$resourcePath = str_replace("&password={" . "password" . "}", "", $resourcePath);
			}
			if($storage != null) {
			$resourcePath = str_replace("{" . "storage" . "}" , $this->apiClient->toQueryValue($storage), $resourcePath);
			}else{
				$resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
			}
			if($folder != null) {
			$resourcePath = str_replace("{" . "folder" . "}" , $this->apiClient->toQueryValue($folder), $resourcePath);
			}else{
				$resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
			}
			if($outPath != null) {
			$resourcePath = str_replace("{" . "outPath" . "}" , $this->apiClient->toQueryValue($outPath), $resourcePath);
			}else{
				$resourcePath = str_replace("&outPath={" . "outPath" . "}", "", $resourcePath);
			}
			//make the API Call
		if (! isset($body)) {
			$body = null;
		}
		if(isset($file)) {
			$body = $file;
		}
		$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

		if(! $response){
			return null;
		}

		$responseObject = $this->apiClient->deserialize($response,
															'ResponseMessage');
		return $responseObject;

		}
    /**
	 * PostSlidesSaveAsPdf
	 * 
	* name, string:  (required)

	* password, string:  (optional)

	* storage, string:  (optional)

	* folder, string:  (optional)

	* outPath, string:  (optional)

	* body, PdfExportOptions:  (required)

	* @return ResponseMessage
	 */
   
	public function PostSlidesSaveAsPdf($name, $password=null, $storage=null, $folder=null, $outPath=null, $body) {
		// verify required params are set
		if($name == '' || $body == '' ) {
			throw new Exception("missing required params");
		}
		//parse inputs
		$resourcePath = "/slides/{name}/saveAs/pdf/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}";
		//$resourcePath = str_replace("{format}", "json", $resourcePath);
		$resourcePath = str_replace("toFormat={toFormat}", "format={format}",str_replace("/?", "?",str_replace("&amp;", "&",str_replace("\\*", "",$resourcePath))));
		$method = "POST";
		$queryParams = array();
		$headerParams = array();
		$headerParams['Accept'] = 'application/xml,application/octet-stream';
		$headerParams['Content-Type'] = 'application/json';

		if($name != null) {
			$resourcePath = str_replace("{" . "name" . "}" , $this->apiClient->toQueryValue($name), $resourcePath);
			}else{
				$resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
			}
			if($password != null) {
			$resourcePath = str_replace("{" . "password" . "}" , $this->apiClient->toQueryValue($password), $resourcePath);
			}else{
				$resourcePath = str_replace("&password={" . "password" . "}", "", $resourcePath);
			}
			if($storage != null) {
			$resourcePath = str_replace("{" . "storage" . "}" , $this->apiClient->toQueryValue($storage), $resourcePath);
			}else{
				$resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
			}
			if($folder != null) {
			$resourcePath = str_replace("{" . "folder" . "}" , $this->apiClient->toQueryValue($folder), $resourcePath);
			}else{
				$resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
			}
			if($outPath != null) {
			$resourcePath = str_replace("{" . "outPath" . "}" , $this->apiClient->toQueryValue($outPath), $resourcePath);
			}else{
				$resourcePath = str_replace("&outPath={" . "outPath" . "}", "", $resourcePath);
			}
			//make the API Call
		if (! isset($body)) {
			$body = null;
		}
		if(isset($file)) {
			$body = $file;
		}
		$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

		if(! $response){
			return null;
		}

		$responseObject = $this->apiClient->deserialize($response,
															'ResponseMessage');
		return $responseObject;

		}
	/**
	 * PostSlidesSaveAsTiff
	 * 
	* name, string:  (required)

	* password, string:  (optional)

	* storage, string:  (optional)

	* folder, string:  (optional)

	* outPath, string:  (optional)

	* body, TiffExportOptions:  (required)

	* @return ResponseMessage
	 */
   
	public function PostSlidesSaveAsTiff($name, $password=null, $storage=null, $folder=null, $outPath=null, $body) {
		// verify required params are set
		if($name == '' || $body == '' ) {
			throw new Exception("missing required params");
		}
		//parse inputs
		$resourcePath = "/slides/{name}/saveAs/tiff/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}";
		//$resourcePath = str_replace("{format}", "json", $resourcePath);
		$resourcePath = str_replace("toFormat={toFormat}", "format={format}",str_replace("/?", "?",str_replace("&amp;", "&",str_replace("\\*", "",$resourcePath))));
		$method = "POST";
		$queryParams = array();
		$headerParams = array();
		$headerParams['Accept'] = 'application/xml,application/octet-stream';
		$headerParams['Content-Type'] = 'application/json';

		if($name != null) {
			$resourcePath = str_replace("{" . "name" . "}" , $this->apiClient->toQueryValue($name), $resourcePath);
			}else{
				$resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
			}
			if($password != null) {
			$resourcePath = str_replace("{" . "password" . "}" , $this->apiClient->toQueryValue($password), $resourcePath);
			}else{
				$resourcePath = str_replace("&password={" . "password" . "}", "", $resourcePath);
			}
			if($storage != null) {
			$resourcePath = str_replace("{" . "storage" . "}" , $this->apiClient->toQueryValue($storage), $resourcePath);
			}else{
				$resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
			}
			if($folder != null) {
			$resourcePath = str_replace("{" . "folder" . "}" , $this->apiClient->toQueryValue($folder), $resourcePath);
			}else{
				$resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
			}
			if($outPath != null) {
			$resourcePath = str_replace("{" . "outPath" . "}" , $this->apiClient->toQueryValue($outPath), $resourcePath);
			}else{
				$resourcePath = str_replace("&outPath={" . "outPath" . "}", "", $resourcePath);
			}
			//make the API Call
		if (! isset($body)) {
			$body = null;
		}
		if(isset($file)) {
			$body = $file;
		}
		$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

		if(! $response){
			return null;
		}

		$responseObject = $this->apiClient->deserialize($response,
															'ResponseMessage');
		return $responseObject;

		}
	/**
     * GetSlidesImages
     * Read presentation images info.
     * name, string: The presentation name. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: Document's storage. (optional)

     * @return ImagesResponse
     */
    public function GetSlidesImages($name, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/images/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ImagesResponse');
	return $responseObject;
    }

    /**
     * GetSlidesSlideImages
     * Read slide images info.
     * name, string: Presentation name. (required)

     * slideIndex, int: The slide index. (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Document's storage. (optional)

     * @return ImagesResponse
     */
    public function GetSlidesSlideImages($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/images/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ImagesResponse');
	return $responseObject;
    }

    /**
     * PostPresentationMerge
     * Merge presentations.
     * name, string: Original presentation name. (required)

     * storage, string: The storage. (optional)

     * folder, string: The folder. (optional)

     * body, PresentationsMergeRequest: with a list of presentations to merge. (required)

     * @return DocumentResponse
     */
    public function PostPresentationMerge($name, $storage = null, $folder = null, $body) {
	// verify required params are set
	if ($name == '' || $body == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/merge/?appSid={appSid}&amp;storage={storage}&amp;folder={folder}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'DocumentResponse');
	return $responseObject;
    }

    /**
     * PutPresentationMerge
     * Merge presentations.
     * name, string: Original presentation name. (required)

     * storage, string: The storage. (optional)

     * folder, string: The folder. (optional)

     * body, OrderedMergeRequest: with a list of presentations to merge. (required)

     * @return DocumentResponse
     */
    public function PutPresentationMerge($name, $storage = null, $folder = null, $body) {
	// verify required params are set
	if ($name == '' || $body == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/merge/?appSid={appSid}&amp;storage={storage}&amp;folder={folder}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "PUT";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'DocumentResponse');
	return $responseObject;
    }

    /**
     * GetSlidesPlaceholder
     * Read slide placeholder info.
     * name, string: Presentation name. (required)

     * slideIndex, int: Slide index. (required)

     * placeholderIndex, int: Pleceholder index. (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Document's storage. (optional)

     * @return PlaceholderResponse
     */
    public function GetSlidesPlaceholder($name, $slideIndex, $placeholderIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '' || $placeholderIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/placeholders/{placeholderIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($placeholderIndex != null) {
	    $resourcePath = str_replace("{" . "placeholderIndex" . "}", $this->apiClient->toQueryValue($placeholderIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&placeholderIndex={" . "placeholderIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'PlaceholderResponse');
	return $responseObject;
    }

    /**
     * GetSlidesPlaceholders
     * Read slide placeholders info.
     * name, string: Presentation name. (required)

     * slideIndex, int: Slide index. (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Document's storage. (optional)

     * @return PlaceholdersResponse
     */
    public function GetSlidesPlaceholders($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/placeholders/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'PlaceholdersResponse');
	return $responseObject;
    }

    /**
     * DeleteSlidesDocumentProperties
     * Clean document properties.
     * name, string: The presentation name. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: Document's storage. (optional)

     * @return DocumentPropertiesResponse
     */
    public function DeleteSlidesDocumentProperties($name, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/documentproperties/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "DELETE";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'DocumentPropertiesResponse');
	return $responseObject;
    }

    /**
     * DeleteSlidesDocumentProperty
     * Delete document property.
     * name, string: The presentation name. (required)

     * propertyName, string: The property name. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: Document's storage. (optional)

     * @return CommonResponse
     */
    public function DeleteSlidesDocumentProperty($name, $propertyName, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $propertyName == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/documentproperties/{propertyName}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "DELETE";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($propertyName != null) {
	    $resourcePath = str_replace("{" . "propertyName" . "}", $this->apiClient->toQueryValue($propertyName), $resourcePath);
	} else {
	    $resourcePath = str_replace("&propertyName={" . "propertyName" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'CommonResponse');
	return $responseObject;
    }

    /**
     * GetSlidesDocumentProperties
     * Read presentation document properties.
     * name, string: The document name. (required)

     * folder, string: Document's folder. (optional)

     * storage, string: Document's storage. (optional)

     * @return DocumentPropertiesResponse
     */
    public function GetSlidesDocumentProperties($name, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/documentproperties/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'DocumentPropertiesResponse');
	return $responseObject;

    }
	/**
	 * GetSlidesDocumentProperty
	 * 
	* name, string:  (required)

	* propertyName, string:  (required)

	* folder, string:  (optional)

	* storage, string:  (optional)

	* @return DocumentPropertyResponse
	 */
   
	public function GetSlidesDocumentProperty($name, $propertyName, $folder=null, $storage=null) {
		// verify required params are set
		if($name == '' || $propertyName == '' ) {
			throw new Exception("missing required params");
		}
		//parse inputs
		$resourcePath = "/slides/{name}/documentproperties/{propertyName}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
		//$resourcePath = str_replace("{format}", "json", $resourcePath);
		$resourcePath = str_replace("toFormat={toFormat}", "format={format}",str_replace("/?", "?",str_replace("&amp;", "&",str_replace("\\*", "",$resourcePath))));
		$method = "GET";
		$queryParams = array();
		$headerParams = array();
		$headerParams['Accept'] = 'application/xml,application/json';
		$headerParams['Content-Type'] = 'application/json';

		if($name != null) {
			$resourcePath = str_replace("{" . "name" . "}" , $this->apiClient->toQueryValue($name), $resourcePath);
			}else{
				$resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
			}
			if($propertyName != null) {
			$resourcePath = str_replace("{" . "propertyName" . "}" , $this->apiClient->toQueryValue($propertyName), $resourcePath);
			}else{
				$resourcePath = str_replace("&propertyName={" . "propertyName" . "}", "", $resourcePath);
			}
			if($folder != null) {
			$resourcePath = str_replace("{" . "folder" . "}" , $this->apiClient->toQueryValue($folder), $resourcePath);
			}else{
				$resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
			}
			if($storage != null) {
			$resourcePath = str_replace("{" . "storage" . "}" , $this->apiClient->toQueryValue($storage), $resourcePath);
			}else{
				$resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
			}
			//make the API Call
		if (! isset($body)) {
			$body = null;
		}
		if(isset($file)) {
			$body = $file;
		}
		$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

		if(! $response){
			return null;
		}

		$responseObject = $this->apiClient->deserialize($response,
															'DocumentPropertyResponse');
		return $responseObject;

		}
    /**
     * PostSlidesSetDocumentProperties
     * Set document properties.
     * name, string: The document name. (required)

     * folder, string: Document's folder. (optional)

     * storage, string: Document's storage. (optional)

     * body, DocumentProperties: New properties. (required)

     * @return DocumentPropertiesResponse
     */
    public function PostSlidesSetDocumentProperties($name, $folder = null, $storage = null, $body) {
	// verify required params are set
	if ($name == '' || $body == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/documentproperties/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'DocumentPropertiesResponse');
	return $responseObject;
    }

    /**
     * PutSlidesSetDocumentProperty
     * Set document property.
     * name, string: The presentation name. (required)

     * propertyName, string: The property name. (required)

     * folder, string: Document's folder. (optional)

     * storage, string: Document's storage. (optional)

     * body, DocumentProperty: Property with the value. (required)

     * @return DocumentPropertyResponse
     */
    public function PutSlidesSetDocumentProperty($name, $propertyName, $folder = null, $storage = null, $body) {
	// verify required params are set
	if ($name == '' || $propertyName == '' || $body == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/documentproperties/{propertyName}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "PUT";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($propertyName != null) {
	    $resourcePath = str_replace("{" . "propertyName" . "}", $this->apiClient->toQueryValue($propertyName), $resourcePath);
	} else {
	    $resourcePath = str_replace("&propertyName={" . "propertyName" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'DocumentPropertyResponse');
	return $responseObject;
    }

    /**
     * GetParagraphPortion
     * Reads paragraph portion in shape's textBody.
     * name, string: Presentation name. (required)

     * slideIndex, int: Index of slide starting from 1 (required)

     * shapeIndex, int: Index of shape starting from 1 (required)

     * paragraphIndex, int: Index of paragraph starting from 1 (required)

     * portionIndex, int: Index of portion starting from 1 (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Document's storage. (optional)

     * @return PortionResponse
     */
    public function GetParagraphPortion($name, $slideIndex, $shapeIndex, $paragraphIndex, $portionIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '' || $shapeIndex == '' || $paragraphIndex == '' || $portionIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}/portions/{portionIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($shapeIndex != null) {
	    $resourcePath = str_replace("{" . "shapeIndex" . "}", $this->apiClient->toQueryValue($shapeIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&shapeIndex={" . "shapeIndex" . "}", "", $resourcePath);
	}
	if ($paragraphIndex != null) {
	    $resourcePath = str_replace("{" . "paragraphIndex" . "}", $this->apiClient->toQueryValue($paragraphIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&paragraphIndex={" . "paragraphIndex" . "}", "", $resourcePath);
	}
	if ($portionIndex != null) {
	    $resourcePath = str_replace("{" . "portionIndex" . "}", $this->apiClient->toQueryValue($portionIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&portionIndex={" . "portionIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'PortionResponse');
	return $responseObject;
    }

    /**
     * GetShapeParagraph
     * Reads paragraph in shape's textBody.
     * name, string: Presentation name. (required)

     * slideIndex, int: Index of slide starting from 1 (required)

     * shapeIndex, int: Index of shape starting from 1 (required)

     * paragraphIndex, int: Index of paragraph starting from 1 (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Document's storage. (optional)

     * @return ParagraphResponse
     */
    public function GetShapeParagraph($name, $slideIndex, $shapeIndex, $paragraphIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '' || $shapeIndex == '' || $paragraphIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($shapeIndex != null) {
	    $resourcePath = str_replace("{" . "shapeIndex" . "}", $this->apiClient->toQueryValue($shapeIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&shapeIndex={" . "shapeIndex" . "}", "", $resourcePath);
	}
	if ($paragraphIndex != null) {
	    $resourcePath = str_replace("{" . "paragraphIndex" . "}", $this->apiClient->toQueryValue($paragraphIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&paragraphIndex={" . "paragraphIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ParagraphResponse');
	return $responseObject;

    }
	/**
	 * GetShapeWithFormat
	 * 
	* name, string:  (required)

	* slideIndex, int:  (required)

	* shapeIndex, int:  (required)

	* format, string:  (required)

	* folder, string:  (optional)

	* storage, string:  (optional)

	* scaleX, float:  (optional)

	* scaleY, float:  (optional)

	* bounds, string:  (optional)

	* @return ResponseMessage
	 */
   
	public function GetShapeWithFormat($name, $slideIndex, $shapeIndex, $format, $folder=null, $storage=null, $scaleX=null, $scaleY=null, $bounds=null) {
		// verify required params are set
		if($name == '' || $slideIndex == '' || $shapeIndex == '' || $format == '' ) {
			throw new Exception("missing required params");
		}
		//parse inputs
		$resourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/?toFormat={toFormat}&amp;appSid={appSid}&amp;folder={folder}&amp;storage={storage}&amp;scaleX={scaleX}&amp;scaleY={scaleY}&amp;bounds={bounds}";
		//$resourcePath = str_replace("{format}", "json", $resourcePath);
		$resourcePath = str_replace("toFormat={toFormat}", "format={format}",str_replace("/?", "?",str_replace("&amp;", "&",str_replace("\\*", "",$resourcePath))));
		$method = "GET";
		$queryParams = array();
		$headerParams = array();
		$headerParams['Accept'] = 'application/xml,application/octet-stream';
		$headerParams['Content-Type'] = 'application/json';

		if($name != null) {
			$resourcePath = str_replace("{" . "name" . "}" , $this->apiClient->toQueryValue($name), $resourcePath);
			}else{
				$resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
			}
			if($slideIndex != null) {
			$resourcePath = str_replace("{" . "slideIndex" . "}" , $this->apiClient->toQueryValue($slideIndex), $resourcePath);
			}else{
				$resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
			}
			if($shapeIndex != null) {
			$resourcePath = str_replace("{" . "shapeIndex" . "}" , $this->apiClient->toQueryValue($shapeIndex), $resourcePath);
			}else{
				$resourcePath = str_replace("&shapeIndex={" . "shapeIndex" . "}", "", $resourcePath);
			}
			if($format != null) {
			$resourcePath = str_replace("{" . "format" . "}" , $this->apiClient->toQueryValue($format), $resourcePath);
			}else{
				$resourcePath = str_replace("&format={" . "format" . "}", "", $resourcePath);
			}
			if($folder != null) {
			$resourcePath = str_replace("{" . "folder" . "}" , $this->apiClient->toQueryValue($folder), $resourcePath);
			}else{
				$resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
			}
			if($storage != null) {
			$resourcePath = str_replace("{" . "storage" . "}" , $this->apiClient->toQueryValue($storage), $resourcePath);
			}else{
				$resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
			}
			if($scaleX != null) {
			$resourcePath = str_replace("{" . "scaleX" . "}" , $this->apiClient->toQueryValue($scaleX), $resourcePath);
			}else{
				$resourcePath = str_replace("&scaleX={" . "scaleX" . "}", "", $resourcePath);
			}
			if($scaleY != null) {
			$resourcePath = str_replace("{" . "scaleY" . "}" , $this->apiClient->toQueryValue($scaleY), $resourcePath);
			}else{
				$resourcePath = str_replace("&scaleY={" . "scaleY" . "}", "", $resourcePath);
			}
			if($bounds != null) {
			$resourcePath = str_replace("{" . "bounds" . "}" , $this->apiClient->toQueryValue($bounds), $resourcePath);
			}else{
				$resourcePath = str_replace("&bounds={" . "bounds" . "}", "", $resourcePath);
			}
			//make the API Call
		if (! isset($body)) {
			$body = null;
		}
		if(isset($file)) {
			$body = $file;
		}
		$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

		if(! $response){
			return null;
		}

		$responseObject = $this->apiClient->deserialize($response,
															'ResponseMessage');
		return $responseObject;

		}
    /**
     * GetSlideShapeParagraphs
     * Reads a list of paragraphs in shape's textBody.
     * name, string: Presentation name. (required)

     * slideIndex, int: Index of slide starting from 1 (required)

     * shapeIndex, int: Index of shape starting from 1 (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return ParagraphsResponse
     */
    public function GetSlideShapeParagraphs($name, $slideIndex, $shapeIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '' || $shapeIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($shapeIndex != null) {
	    $resourcePath = str_replace("{" . "shapeIndex" . "}", $this->apiClient->toQueryValue($shapeIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&shapeIndex={" . "shapeIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ParagraphsResponse');
	return $responseObject;
    }

    /**
     * GetSlidesSlideShapes
     * Read slides shapes info.
     * name, string: Presentation name. (required)

     * slideIndex, int: Slide index. (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return ShapeListResponse
     */
    public function GetSlidesSlideShapes($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/shapes/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ShapeListResponse');
	return $responseObject;
    }

    /**
     * GetSlidesSlideShapesParent
     * Read slide shapes or shape info.
     * name, string: Presentation name. (required)

     * slideIndex, int: Slide index. (required)

     * shapePath, string: Shape path. (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return ResponseMessage
     */
    public function GetSlidesSlideShapesParent($name, $slideIndex, $shapePath, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '' || $shapePath == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapePath}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($shapePath != null) {
	    $resourcePath = str_replace("{" . "shapePath" . "}", $this->apiClient->toQueryValue($shapePath), $resourcePath);
	} else {
	    $resourcePath = str_replace("&shapePath={" . "shapePath" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ShapeResponse');
	return $responseObject;

    }
	/**
	 * PostAddNewShape
	 * 
	* name, string:  (required)

	* slideIndex, int:  (required)

	* folder, string:  (optional)

	* storage, string:  (optional)

	* body, Shape:  (required)

	* @return ResponseMessage
	 */
   
	public function PostAddNewShape($name, $slideIndex, $folder=null, $storage=null, $body) {
		// verify required params are set
		if($name == '' || $slideIndex == '' || $body == '' ) {
			throw new Exception("missing required params");
		}
		//parse inputs
		$resourcePath = "/slides/{name}/slides/{slideIndex}/shapes/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
		//$resourcePath = str_replace("{format}", "json", $resourcePath);
		$resourcePath = str_replace("toFormat={toFormat}", "format={format}",str_replace("/?", "?",str_replace("&amp;", "&",str_replace("\\*", "",$resourcePath))));
		$method = "POST";
		$queryParams = array();
		$headerParams = array();
		$headerParams['Accept'] = 'application/xml,application/json';
		$headerParams['Content-Type'] = 'application/json';

		if($name != null) {
			$resourcePath = str_replace("{" . "name" . "}" , $this->apiClient->toQueryValue($name), $resourcePath);
			}else{
				$resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
			}
			if($slideIndex != null) {
			$resourcePath = str_replace("{" . "slideIndex" . "}" , $this->apiClient->toQueryValue($slideIndex), $resourcePath);
			}else{
				$resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
			}
			if($folder != null) {
			$resourcePath = str_replace("{" . "folder" . "}" , $this->apiClient->toQueryValue($folder), $resourcePath);
			}else{
				$resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
			}
			if($storage != null) {
			$resourcePath = str_replace("{" . "storage" . "}" , $this->apiClient->toQueryValue($storage), $resourcePath);
			}else{
				$resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
			}
			//make the API Call
		if (! isset($body)) {
			$body = null;
		}
		if(isset($file)) {
			$body = $file;
		}
		$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

		if(! $response){
			return null;
		}

		$responseObject = $this->apiClient->deserialize($response,
															'ResponseMessage');
		return $responseObject;

		}
    /**
     * PutSetParagraphPortionProperties
     * Updates paragraph portion properties.
     * name, string:  (required)

     * slideIndex, int:  (required)

     * shapeIndex, int:  (required)

     * paragraphIndex, int:  (required)

     * portionIndex, int:  (required)

     * folder, string:  (optional)

     * storage, string:  (optional)

     * body, Portion:  (required)

     * @return ResponseMessage
     */
    public function PutSetParagraphPortionProperties($name, $slideIndex, $shapeIndex, $paragraphIndex, $portionIndex, $folder = null, $storage = null, $body) {
	// verify required params are set
	if ($name == '' || $slideIndex == '' || $shapeIndex == '' || $paragraphIndex == '' || $portionIndex == '' || $body == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}/portions/{portionIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "PUT";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($shapeIndex != null) {
	    $resourcePath = str_replace("{" . "shapeIndex" . "}", $this->apiClient->toQueryValue($shapeIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&shapeIndex={" . "shapeIndex" . "}", "", $resourcePath);
	}
	if ($paragraphIndex != null) {
	    $resourcePath = str_replace("{" . "paragraphIndex" . "}", $this->apiClient->toQueryValue($paragraphIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&paragraphIndex={" . "paragraphIndex" . "}", "", $resourcePath);
	}
	if ($portionIndex != null) {
	    $resourcePath = str_replace("{" . "portionIndex" . "}", $this->apiClient->toQueryValue($portionIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&portionIndex={" . "portionIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ResponseMessage');
	return $responseObject;
    }

    /**
     * PutSlideShapeInfo
     * Updates shape properties.
     * name, string: Presentation name. (required)

     * slideIndex, int: Slide index. (required)

     * shapePath, string: Shape path. (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * body, Shape: Shape dto. (required)

     * @return ResponseMessage
     */
    public function PutSlideShapeInfo($name, $slideIndex, $shapePath, $folder = null, $storage = null, $body) {
	// verify required params are set
	if ($name == '' || $slideIndex == '' || $shapePath == '' || $body == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapePath}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "PUT";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($shapePath != null) {
	    $resourcePath = str_replace("{" . "shapePath" . "}", $this->apiClient->toQueryValue($shapePath), $resourcePath);
	} else {
	    $resourcePath = str_replace("&shapePath={" . "shapePath" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ResponseMessage');
	return $responseObject;
    }

    /**
     * DeleteSlideByIndex
     * Delete presentation slide by its index.
     * name, string: The presentation name. (required)

     * slideIndex, int: The slide index. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: The presentation storage. (optional)

     * @return SlideListResponse
     */
    public function DeleteSlideByIndex($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "DELETE";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideListResponse');
	return $responseObject;
    }

    /**
     * DeleteSlidesCleanSlidesList
     * Delete presentation slides.
     * name, string: The presentation name. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return SlideListResponse
     */
    public function DeleteSlidesCleanSlidesList($name, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "DELETE";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideListResponse');
	return $responseObject;
    }

    /**
     * DeleteSlidesSlideBackground
     * Remove presentation slide background color.
     * name, string:  (required)

     * slideIndex, int:  (required)

     * folder, string:  (optional)

     * storage, string:  (optional)

     * @return SlideBackgroundResponse
     */
    public function DeleteSlidesSlideBackground($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/background/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "DELETE";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideBackgroundResponse');
	return $responseObject;
    }

    /**
     * GetSlidesSlide
     * Read slide info.
     * name, string:  (required)

     * slideIndex, int:  (required)

     * folder, string:  (optional)

     * storage, string:  (optional)

     * @return ResponseMessage
     */
    public function GetSlidesSlide($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/octet-stream';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}	
	$xml = simplexml_load_string($response);
	$json = json_encode($xml);
	
	$responseObject = $this->apiClient->deserialize($json, 'SlideResponse');
	return $responseObject;
    }

    /**
     * GetSlidesSlideBackground
     * Read presentation slide background color type.
     * name, string:  (required)

     * slideIndex, int:  (required)

     * folder, string:  (optional)

     * storage, string:  (optional)

     * @return SlideBackgroundResponse
     */
    public function GetSlidesSlideBackground($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/background/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideBackgroundResponse');
	return $responseObject;
    }

    /**
     * GetSlidesSlideComments
     * Read presentation slide comments.
     * name, string:  (required)

     * slideIndex, int:  (required)

     * folder, string:  (optional)

     * storage, string:  (optional)

     * @return SlideCommentsResponse
     */
    public function GetSlidesSlideComments($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/comments/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideCommentsResponse');
	return $responseObject;
    }

    /**
     * GetSlidesSlidesList
     * Read presentation slides info.
     * name, string: The presentation name. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return SlideListResponse
     */
    public function GetSlidesSlidesList($name, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideListResponse');
	return $responseObject;
    }

    /**
     * GetSlideWithFormat
     * Convert slide to some format.
     * name, string:  (required)

     * slideIndex, int:  (required)

     * format, string:  (required)

     * width, int:  (optional)

     * height, int:  (optional)

     * folder, string:  (optional)

     * storage, string:  (optional)

     * @return ResponseMessage
     */
    public function GetSlideWithFormat($name, $slideIndex, $format, $width = null, $height = null, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '' || $format == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/?appSid={appSid}&amp;toFormat={toFormat}&amp;width={width}&amp;height={height}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/octet-stream';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($format != null) {
	    $resourcePath = str_replace("{" . "format" . "}", $this->apiClient->toQueryValue($format), $resourcePath);
	} else {
	    $resourcePath = str_replace("&format={" . "format" . "}", "", $resourcePath);
	}
	if ($width != null) {
	    $resourcePath = str_replace("{" . "width" . "}", $this->apiClient->toQueryValue($width), $resourcePath);
	} else {
	    $resourcePath = str_replace("&width={" . "width" . "}", "", $resourcePath);
	}
	if ($height != null) {
	    $resourcePath = str_replace("{" . "height" . "}", $this->apiClient->toQueryValue($height), $resourcePath);
	} else {
	    $resourcePath = str_replace("&height={" . "height" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ResponseMessage');
	return $responseObject;
    }

    /**
     * PostAddEmptySlide
     * Add empty slide to the end of presentation
     * name, string: The presentation name. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: The presentation storage. (optional)

     * @return SlideListResponse
     */
    public function PostAddEmptySlide($name, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideListResponse');
	return $responseObject;
    }

    /**
     * PostAddEmptySlideAtPosition
     * Add empty presentation slide to the end of presentation
     * name, string: The presentation name. (required)

     * position, int: The presentation slide position. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: The presentation storage. (optional)

     * @return SlideListResponse
     */
    public function PostAddEmptySlideAtPosition($name, $position, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $position == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;position={position}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($position != null) {
	    $resourcePath = str_replace("{" . "position" . "}", $this->apiClient->toQueryValue($position), $resourcePath);
	} else {
	    $resourcePath = str_replace("&position={" . "position" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideListResponse');
	return $responseObject;
    }

    /**
     * PostAddSlideCopy
     * Add a copy of slide to the end of presentation
     * name, string: The presentation name. (required)

     * slideToClone, int: The presentation slide to clone. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: The presentation storage. (optional)

     * @return SlideListResponse
     */
    public function PostAddSlideCopy($name, $slideToClone, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideToClone == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;slideToClone={slideToClone}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideToClone != null) {
	    $resourcePath = str_replace("{" . "slideToClone" . "}", $this->apiClient->toQueryValue($slideToClone), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideToClone={" . "slideToClone" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideListResponse');
	return $responseObject;
    }

    /**
     * PostClonePresentationSlide
     * Clone presentation slide
     * name, string: The presentation name. (required)

     * position, int: The presentation slide position. (required)

     * slideToClone, int: The presentation slide to clone. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: The presentation storage. (optional)

     * @return SlideListResponse
     */
    public function PostClonePresentationSlide($name, $position, $slideToClone, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $position == '' || $slideToClone == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;position={position}&amp;slideToClone={slideToClone}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($position != null) {
	    $resourcePath = str_replace("{" . "position" . "}", $this->apiClient->toQueryValue($position), $resourcePath);
	} else {
	    $resourcePath = str_replace("&position={" . "position" . "}", "", $resourcePath);
	}
	if ($slideToClone != null) {
	    $resourcePath = str_replace("{" . "slideToClone" . "}", $this->apiClient->toQueryValue($slideToClone), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideToClone={" . "slideToClone" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideListResponse');
	return $responseObject;
    }

    /**
     * PostCopySlideFromSourcePresentation
     * Copy slide from source presentation
     * name, string: The presentation name. (required)

     * slideToCopy, int: The presentation slide to copy. (required)

     * source, string: The source presentation. (required)

     * position, int: The presentation slide position. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: The presentation storage. (optional)

     * @return SlideListResponse
     */
    public function PostCopySlideFromSourcePresentation($name, $slideToCopy, $source, $position, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideToCopy == '' || $source == '' || $position == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;slideToCopy={slideToCopy}&amp;source={source}&amp;position={position}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideToCopy != null) {
	    $resourcePath = str_replace("{" . "slideToCopy" . "}", $this->apiClient->toQueryValue($slideToCopy), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideToCopy={" . "slideToCopy" . "}", "", $resourcePath);
	}
	if ($source != null) {
	    $resourcePath = str_replace("{" . "source" . "}", $this->apiClient->toQueryValue($source), $resourcePath);
	} else {
	    $resourcePath = str_replace("&source={" . "source" . "}", "", $resourcePath);
	}
	if ($position != null) {
	    $resourcePath = str_replace("{" . "position" . "}", $this->apiClient->toQueryValue($position), $resourcePath);
	} else {
	    $resourcePath = str_replace("&position={" . "position" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideListResponse');
	return $responseObject;
    }

    /**
     * PostSlidesReorderPosition
     * Reorder presentation slide position
     * name, string: The presentation name. (required)

     * oldPosition, int: The new presentation slide position. (required)

     * newPosition, int: The new presentation slide position. (required)

     * folder, string: The presentation folder. (optional)

     * storage, string: The presentation storage. (optional)

     * @return SlideListResponse
     */
    public function PostSlidesReorderPosition($name, $oldPosition, $newPosition, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $oldPosition == '' || $newPosition == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;oldPosition={oldPosition}&amp;newPosition={newPosition}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($oldPosition != null) {
	    $resourcePath = str_replace("{" . "oldPosition" . "}", $this->apiClient->toQueryValue($oldPosition), $resourcePath);
	} else {
	    $resourcePath = str_replace("&oldPosition={" . "oldPosition" . "}", "", $resourcePath);
	}
	if ($newPosition != null) {
	    $resourcePath = str_replace("{" . "newPosition" . "}", $this->apiClient->toQueryValue($newPosition), $resourcePath);
	} else {
	    $resourcePath = str_replace("&newPosition={" . "newPosition" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideListResponse');
	return $responseObject;
    }

    /**
     * PutSlidesSlideBackground
     * Set presentation slide background color.
     * name, string:  (required)

     * slideIndex, int:  (required)

     * folder, string:  (optional)

     * storage, string:  (optional)

     * body, string:  (required)

     * @return SlideBackgroundResponse
     */
    public function PutSlidesSlideBackground($name, $slideIndex, $folder = null, $storage = null, $body) {
	// verify required params are set
	if ($name == '' || $slideIndex == '' || $body == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/background/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "PUT";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideBackgroundResponse');
	return $responseObject;
    }

    /**
     * GetSlidesPresentationTextItems
     * Extract presentation text items.
     * name, string: Presentation name. (required)

     * withEmpty, bool: Incude empty items. (optional)

     * folder, string: Presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return TextItemsResponse
     */
    public function GetSlidesPresentationTextItems($name, $withEmpty = null, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/textItems/?appSid={appSid}&amp;withEmpty={withEmpty}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($withEmpty != null) {
	    $resourcePath = str_replace("{" . "withEmpty" . "}", $this->apiClient->toQueryValue($withEmpty), $resourcePath);
	} else {
	    $resourcePath = str_replace("&withEmpty={" . "withEmpty" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'TextItemsResponse');
	return $responseObject;
    }

    /**
     * GetSlidesSlideTextItems
     * Extract slide text items.
     * name, string: Presentation name. (required)

     * slideIndex, int: Slide's index. (required)

     * withEmpty, bool: Include empty items. (optional)

     * folder, string: Presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return TextItemsResponse
     */
    public function GetSlidesSlideTextItems($name, $slideIndex, $withEmpty = null, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/textItems/?appSid={appSid}&amp;withEmpty={withEmpty}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($withEmpty != null) {
	    $resourcePath = str_replace("{" . "withEmpty" . "}", $this->apiClient->toQueryValue($withEmpty), $resourcePath);
	} else {
	    $resourcePath = str_replace("&withEmpty={" . "withEmpty" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'TextItemsResponse');
	return $responseObject;
    }

    /**
     * PostSlidesPresentationReplaceText
     * Replace text by a new value.
     * name, string: The presentation name. (required)

     * oldValue, string: Text value to replace. (required)

     * newValue, string: The new text value. (required)

     * ignoreCase, bool: Is case must be ignored. (optional)

     * folder, string: The presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return PresentationStringReplaceResponse
     */
    public function PostSlidesPresentationReplaceText($name, $oldValue, $newValue, $ignoreCase = null, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $oldValue == '' || $newValue == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/replaceText/?oldValue={oldValue}&amp;newValue={newValue}&amp;appSid={appSid}&amp;ignoreCase={ignoreCase}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($oldValue != null) {
	    $resourcePath = str_replace("{" . "oldValue" . "}", $this->apiClient->toQueryValue($oldValue), $resourcePath);
	} else {
	    $resourcePath = str_replace("&oldValue={" . "oldValue" . "}", "", $resourcePath);
	}
	if ($newValue != null) {
	    $resourcePath = str_replace("{" . "newValue" . "}", $this->apiClient->toQueryValue($newValue), $resourcePath);
	} else {
	    $resourcePath = str_replace("&newValue={" . "newValue" . "}", "", $resourcePath);
	}
	if ($ignoreCase != null) {
	    $resourcePath = str_replace("{" . "ignoreCase" . "}", $this->apiClient->toQueryValue($ignoreCase), $resourcePath);
	} else {
	    $resourcePath = str_replace("&ignoreCase={" . "ignoreCase" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'PresentationStringReplaceResponse');
	return $responseObject;
    }

    /**
     * PostSlidesSlideReplaceText
     * Replace text by a new value.
     * name, string: Presentation name. (required)

     * slideIndex, int: Slide's index. (required)

     * oldValue, string: Text to replace. (required)

     * newValue, string: New text value. (required)

     * ignoreCase, bool: Is case must be ignored. (optional)

     * folder, string: Presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return SlideStringReplaceResponse
     */
    public function PostSlidesSlideReplaceText($name, $slideIndex, $oldValue, $newValue, $ignoreCase = null, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '' || $oldValue == '' || $newValue == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/replaceText/?oldValue={oldValue}&amp;newValue={newValue}&amp;appSid={appSid}&amp;ignoreCase={ignoreCase}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "POST";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($oldValue != null) {
	    $resourcePath = str_replace("{" . "oldValue" . "}", $this->apiClient->toQueryValue($oldValue), $resourcePath);
	} else {
	    $resourcePath = str_replace("&oldValue={" . "oldValue" . "}", "", $resourcePath);
	}
	if ($newValue != null) {
	    $resourcePath = str_replace("{" . "newValue" . "}", $this->apiClient->toQueryValue($newValue), $resourcePath);
	} else {
	    $resourcePath = str_replace("&newValue={" . "newValue" . "}", "", $resourcePath);
	}
	if ($ignoreCase != null) {
	    $resourcePath = str_replace("{" . "ignoreCase" . "}", $this->apiClient->toQueryValue($ignoreCase), $resourcePath);
	} else {
	    $resourcePath = str_replace("&ignoreCase={" . "ignoreCase" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'SlideStringReplaceResponse');
	return $responseObject;
    }

    /**
     * GetSlidesTheme
     * Read slide theme info.
     * name, string: Presentation name. (required)

     * slideIndex, int: Slide's index. (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return ThemeResponse
     */
    public function GetSlidesTheme($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/theme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ThemeResponse');
	return $responseObject;
    }

    /**
     * GetSlidesThemeColorScheme
     * Read slide theme color scheme info.
     * name, string: Presentation name. (required)

     * slideIndex, int: Slide's index. (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return ColorSchemeResponse
     */
    public function GetSlidesThemeColorScheme($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/theme/colorScheme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'ColorSchemeResponse');
	return $responseObject;
    }

    /**
     * GetSlidesThemeFontScheme
     * Read slide theme font scheme info.
     * name, string: Presentation name. (required)

     * slideIndex, int: Slide's index. (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return FontSchemeResponse
     */
    public function GetSlidesThemeFontScheme($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/theme/fontScheme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'FontSchemeResponse');
	return $responseObject;
    }

    /**
     * GetSlidesThemeFormatScheme
     * Read slide theme color scheme info.
     * name, string: Presentation name. (required)

     * slideIndex, int: Slide's index. (required)

     * folder, string: Presentation folder. (optional)

     * storage, string: Presentation storage. (optional)

     * @return FormatSchemeResponse
     */
    public function GetSlidesThemeFormatScheme($name, $slideIndex, $folder = null, $storage = null) {
	// verify required params are set
	if ($name == '' || $slideIndex == '') {
	    throw new Exception("missing required params");
	}
	//parse inputs
	$resourcePath = "/slides/{name}/slides/{slideIndex}/theme/FormatScheme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}";
	//$resourcePath = '/slides/{name}/slides/{slideIndex}/theme/formatScheme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}'
	//$resourcePath = str_replace("{format}", "json", $resourcePath);
	$resourcePath = str_replace("toFormat={toFormat}", "format={format}", str_replace("/?", "?", str_replace("&amp;", "&", str_replace("\\*", "", $resourcePath))));
	$method = "GET";
	$queryParams = array();
	$headerParams = array();
	$headerParams['Accept'] = 'application/xml,application/json';
	$headerParams['Content-Type'] = 'application/json';

	if ($name != null) {
	    $resourcePath = str_replace("{" . "name" . "}", $this->apiClient->toQueryValue($name), $resourcePath);
	} else {
	    $resourcePath = str_replace("&name={" . "name" . "}", "", $resourcePath);
	}
	if ($slideIndex != null) {
	    $resourcePath = str_replace("{" . "slideIndex" . "}", $this->apiClient->toQueryValue($slideIndex), $resourcePath);
	} else {
	    $resourcePath = str_replace("&slideIndex={" . "slideIndex" . "}", "", $resourcePath);
	}
	if ($folder != null) {
	    $resourcePath = str_replace("{" . "folder" . "}", $this->apiClient->toQueryValue($folder), $resourcePath);
	} else {
	    $resourcePath = str_replace("&folder={" . "folder" . "}", "", $resourcePath);
	}
	if ($storage != null) {
	    $resourcePath = str_replace("{" . "storage" . "}", $this->apiClient->toQueryValue($storage), $resourcePath);
	} else {
	    $resourcePath = str_replace("&storage={" . "storage" . "}", "", $resourcePath);
	}
	//make the API Call
	if (!isset($body)) {
	    $body = null;
	}
	if (isset($file)) {
	    $body = $file;
	}
	$response = $this->apiClient->callAPI($resourcePath, $method, $queryParams, $body, $headerParams);

	if (!$response) {
	    return null;
	}

	$responseObject = $this->apiClient->deserialize($response, 'FormatSchemeResponse');
	return $responseObject;
    }

}
