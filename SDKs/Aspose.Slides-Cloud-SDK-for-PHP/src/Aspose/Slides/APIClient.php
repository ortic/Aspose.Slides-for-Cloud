<?php

namespace Aspose\Slides;

use Aspose\Slides\AsposeApp;
use Aspose\Slides\ApiException as Exception;

/**
 * APIClient.php
 */
class APIClient {

    public static $POST = "POST";
    public static $GET = "GET";
    public static $PUT = "PUT";
    public static $DELETE = "DELETE";

    /**
     * @param string $apiKey your API key
     * @param string $apiServer the address of the API server
     */
    function __construct() {
        $this->apiKey = AsposeApp::$apiKey;
        $this->apiServer = AsposeApp::$baseProductUri;
        $this->appSid = AsposeApp::$appSID;
    }

    /**
     * Encode a string to URL-safe base64
     *
     * @param string $value Valure to endode.
     *
     *
     */
    private static function encodeBase64UrlSafe($value) {
        return str_replace(array('+', '/'), array('-', '_'), base64_encode($value));
    }

    /**
     * Decode a string from URL-safe base64
     *
     * @param string $value Value to Decode.
     *
     *
     */
    private static function decodeBase64UrlSafe($value) {
        return base64_decode(str_replace(array('-', '_'), array('+', '/'), $value));
    }

    /**
     * Saves the files
     *
     * @param string $input input stream.
     * @param string $fileName fileName along with the full path.
     *
     *
     */
    public static function saveFile($input, $fileName) {
        $fh = fopen($fileName, 'w') or die('cant open file');
        fwrite($fh, $input);
        fclose($fh);
    }

    /**
    * Fine MIME Content-type for a file
    */
    public static function mimeTypeOfFile($file) {
        $finfo = finfo_open(FILEINFO_MIME_TYPE);
        $mimeType = finfo_file($finfo, $file);
        finfo_close($finfo);

        return $mimeType;
    }

    public function signURL($url, $queryParams) {
        
        // parse the url
        $UrlToSign = rtrim($url, "/");
        $url = parse_url($UrlToSign);
        $urlQuery = http_build_query($queryParams);

        $urlPartToSign = $url['scheme'] . '://' . $url['host'] . $url['path'] . "?" . $url['query'];
        
        // Create a signature using the private key and the URL-encoded
        // string using HMAC SHA1. This signature will be binary.
        $signature = hash_hmac('sha1', $urlPartToSign, $this->apiKey, true);

        $encodedSignature = self::encodeBase64UrlSafe($signature);
        $encodedSignature = str_replace(array('=', '-', '_'), array('', '%2b', '%2f'), $encodedSignature);

        preg_match_all("/%[0-9a-f]{2}/", $encodedSignature, $m);
        foreach ($m[0] as $code) {
            $encodedSignature = str_replace($code, strtoupper($code), $encodedSignature);
        }

        $url = $urlPartToSign . '&signature=' . $encodedSignature;

        return $url;
    }

    /**
     * @param string $resourcePath path to method endpoint
     * @param string $method method to call
     * @param array $queryParams parameters to be place in query URL
     * @param array $postData parameters to be placed in POST body
     * @param array $headerParams parameters to be place in request header
     * @return mixed
     */
    public function callAPI($resourcePath, $method, $queryParams, $postData, $headerParams) {

        $headers = array();
        if ($headerParams != null) {
            foreach ($headerParams as $key => $val) {
                $headers[] = "$key: $val";
            }
        }

        if (is_object($postData) or is_array($postData)) {
            $postData = json_encode(self::sanitizeForSerialization($postData));
        }

        $resourcePath = str_replace("{appSid}", urlencode($this->appSid), $resourcePath);
        $url = rtrim($this->apiServer, "/") . $resourcePath;

        if (! empty($queryParams)) {
            $url = ($url . '&' . http_build_query($queryParams));
        }

        // Sign URL
        $url = $this->signURL($url, $queryParams);
        print_r($url);
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_TIMEOUT, 180);
        // return the result on success, rather than just TRUE
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);

        if ($method == self::$POST) {
            if (file_exists($postData)) {

                $fp = fopen($postData, "r");

                curl_setopt($curl, CURLOPT_VERBOSE, 1);
                curl_setopt($curl, CURLOPT_USERPWD, 'user:password');
                curl_setopt($curl, CURLOPT_URL, $url);
                curl_setopt($curl, CURLOPT_UPLOAD, true);
                curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'POST');
                curl_setopt($curl, CURLOPT_HTTPHEADER, array("Content-Type: application/json"));
                curl_setopt($curl, CURLOPT_INFILE, $fp);
                curl_setopt($curl, CURLOPT_INFILESIZE, filesize($postData));
            } else {
                curl_setopt($curl, CURLOPT_POST, true);
                curl_setopt($curl, CURLOPT_POSTFIELDS, $postData);
            }
        } else if ($method == self::$PUT) {
            if (file_exists($postData)) {

                $fp = fopen($postData, "r");

                curl_setopt($curl, CURLOPT_VERBOSE, 1);
                curl_setopt($curl, CURLOPT_USERPWD, 'user:password');
                curl_setopt($curl, CURLOPT_URL, $url);
                curl_setopt($curl, CURLOPT_PUT, 1);
                curl_setopt($curl, CURLOPT_HTTPHEADER, array("Content-Type: application/json"));
                curl_setopt($curl, CURLOPT_INFILE, $fp);
                curl_setopt($curl, CURLOPT_INFILESIZE, filesize($postData));
            } else {
                $json_data = json_encode($postData);
                curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
                curl_setopt($curl, CURLOPT_POSTFIELDS, $postData);
            }
        } else if ($method == self::$DELETE) {
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "DELETE");
            curl_setopt($curl, CURLOPT_POSTFIELDS, $postData);
        } else if ($method != self::$GET) {
            throw new Exception('Method ' . $method . ' is not recognized.');
        }

        curl_setopt($curl, CURLOPT_URL, $url);

        // Make the request
        $response = curl_exec($curl);

        $response_info = curl_getinfo($curl);

        // Handle the response
        if ($response_info['http_code'] == 0) {
            throw new Exception("TIMEOUT: api call to " . $url .
            " took more than 180s to return");
        } else if ($response_info['http_code'] == 200) {
            //$data = json_decode($response);
            $data = $response;
        } else if ($response_info['http_code'] == 401) {
            throw new Exception("Unauthorized API request to " . $url .
            ": " . json_decode($response)->message);
        } else if ($response_info['http_code'] == 404) {
            $data = null;
        } else {
            /* throw new Exception("Can't connect to the api: " . $url .
              " response code: " .
              $response_info['http_code']); */
            echo "response code: " . $response_info['http_code'];
        }

        return $data;
    }

    public function callMultipartAPI($resourcePath, $queryParams, $boundary, $fields, $files) {

        $resourcePath = str_replace("{appSid}", urlencode($this->appSid), $resourcePath);
        $url = rtrim($this->apiServer, "/") . $resourcePath;

        // Sign URL
        $url = $this->signURL($url, $queryParams);

        $curl = curl_init($url);

        $delimiter = '-------------' . $boundary;
        $data = '';

        foreach ($fields as $name => $field) {
            $data .= "--" . $delimiter . "\r\n";
            $data .= 'Content-Type: ' . $field['type'] . "\r\n";
            // this endline must be here to indicate end of headers
            $data .= "\r\n";
            // the file itself (note: UTF8 Encoding)
            $data .= utf8_encode($field['content']) . "\r\n";
        }
        
        foreach ($files as $name => $file) {
            $data .= "--" . $delimiter . "\r\n";
            // "filename" attribute is not essential; server-side scripts may use it
            $data .= 'Content-Disposition: form-data; name="' . $name . '";' .
                 ' filename="' . $name . '"' . "\r\n";
            // this is, again, informative only; good practice to include though
            $data .= 'Content-Type: ' . $file['type'] . "\r\n";
            // this endline must be here to indicate end of headers
            $data .= "\r\n";
            // the file itself (note: there's no encoding of any kind)
            $data .= $file['content'] . "\r\n";
        }

        $data .= "--" . $delimiter . "--\r\n";

        curl_setopt_array($curl, [
            CURLOPT_POST => true,
            CURLOPT_HTTPHEADER => [
                'Content-Type: multipart/form-data; boundary=' . $delimiter,
                'Content-Length: ' . strlen($data)
            ],
            CURLOPT_POSTFIELDS => $data
        ]);

        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        return curl_exec($curl);
    }

    /**
     * Build a JSON POST object
     */
    protected function sanitizeForSerialization($data) {
        if (is_scalar($data) || null === $data) {
            $sanitized = $data;
        } else if ($data instanceof \DateTime) {
            $sanitized = $data->format(\DateTime::ISO8601);
        } else if (is_array($data)) {
            foreach ($data as $property => $value) {
                $data[$property] = $this->sanitizeForSerialization($value);
            }
            $sanitized = $data;
        } else if (is_object($data)) {
            $values = array();
            foreach (array_keys($data::$swaggerTypes) as $property) {
                $values[$property] = $this->sanitizeForSerialization($data->$property);
            }
            $sanitized = $values;
        } else {
            $sanitized = (string) $data;
        }

        return $sanitized;
    }

    /**
     * Take value and turn it into a string suitable for inclusion in
     * the path, by url-encoding.
     * @param string $value a string which will be part of the path
     * @return string the serialized object
     */
    public static function toPathValue($value) {
        return rawurlencode($value);
    }

    /**
     * Take value and turn it into a string suitable for inclusion in
     * the query, by imploding comma-separated if it's an object.
     * If it's a string, pass through unchanged. It will be url-encoded
     * later.
     * @param object $object an object to be serialized to a string
     * @return string the serialized object
     */
    public static function toQueryValue($object) {
        if (is_array($object)) {
            return implode(',', $object);
        } else {
            return $object;
        }
    }

    /**
     * Just pass through the header value for now. Placeholder in case we
     * find out we need to do something with header values.
     * @param string $value a string which will be part of the header
     * @return string the header string
     */
    public static function toHeaderValue($value) {
        return $value;
    }

    /**
     * Deserialize a JSON string into an object
     *
     * @param object $object object or primitive to be deserialized
     * @param string $class class name is passed as a string
     * @return object an instance of $class
     */
    public static function deserialize($object, $class) {
        if (self::isJson($object)) {
            $object = json_decode($object);
        } else {
            return $object;
        }

        if (gettype($object) == "NULL") {
            return $object;
        }
        if (substr($class, 0, 6) == 'array[') {
            $sub_class = substr($class, 6, -1);
            $sub_objects = array();
            foreach ($object as $sub_object) {
                $sub_objects[] = self::deserialize($sub_object, $sub_class);
            }
            return $sub_objects;
        } elseif ($class == 'DateTime') {
            return new DateTime($object);
        } elseif (in_array($class, array('string', 'int', 'float', 'bool'))) {
            settype($object, $class);
            return $object;
        } else {
            $class = "Aspose\Slides\Models\\$class";
            $instance = new $class(); // this instantiates class named $class
            $classVars = get_class_vars($class);
        }

        foreach ($object as $property => $value) {
            // Need to handle possible pluralization differences
            $true_property = $property;
            if (!property_exists($class, $true_property)) {
                if (substr($property, -1) == 's') {
                    $true_property = substr($property, 0, -1);
                }
            }
            if (array_key_exists($true_property, $classVars['swaggerTypes'])) {
                $type = $classVars['swaggerTypes'][$true_property];
            } else {
                $type = 'string';
            }
            if (in_array($type, array('string', 'int', 'float', 'bool'))) {
                //settype($value, $type);
                $instance->{$true_property} = $value;
            } elseif (preg_match("/array<(.*)>/", $type, $matches)) {
                $sub_class = $matches[1];
                $instance->{$true_property} = array();
                foreach ($value as $sub_property => $sub_value) {
                    $instance->{$true_property}[] = self::deserialize($sub_value, $sub_class);
                }
            } else {
                $instance->{$true_property} = self::deserialize($value, $type);
            }
        }
        return $instance;
    }

    public static function isJson($string) {
        return is_string($string) && is_object(json_decode($string)) && (json_last_error() == JSON_ERROR_NONE) ? true : false;
    }

    /**
     * Return the header 'Accept' based on an array of Accept provided
     *
     * @param string[] $accept Array of header
     *
     * @return string Accept (e.g. application/json)
     */
    public static function selectHeaderAccept($accept)
    {
        if (count($accept) === 0 or (count($accept) === 1 and $accept[0] === '')) {
            return null;
        } elseif (preg_grep("/application\/json/i", $accept)) {
            return 'application/json';
        } else {
            return implode(',', $accept);
        }
    }
  
    /**
     * Return the content type based on an array of content-type provided
     *
     * @param string[] $content_type Array fo content-type
     *
     * @return string Content-Type (e.g. application/json)
     */
    public static function selectHeaderContentType($content_type)
    {
        if (count($content_type) === 0 or (count($content_type) === 1 and $content_type[0] === '')) {
            return 'application/json';
        } elseif (preg_grep("/application\/json/i", $content_type)) {
            return 'application/json';
        } else {
            return implode(',', $content_type);
        }
    }

}
