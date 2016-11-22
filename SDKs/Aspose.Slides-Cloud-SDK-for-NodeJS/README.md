# Aspose.Slides Cloud SDK for Node.js

This repository contains Aspose.Slides Cloud SDK for Node.js source code. This SDK allows you to work with Aspose.Slides Cloud REST APIs in your Node.js applications quickly and easily. 

##How to Use the SDK?
The complete source code is available in this repository folder, you can either directly use it in your project or use Maven. For more details, please visit our [documentation website](http://www.aspose.com/docs/display/slidescloud/Available+SDKs).

## Quick SDK Tutorial
```javascript
var fs = require('fs');
var assert = require('assert');
var StorageApi =require("asposestoragecloud")
var SlidesApi = require("asposeslidescloud");

var AppSID = 'XXX'; //sepcify App SID
var AppKey = 'XXX'; //sepcify App Key
var config = {'appSid':AppSID,'apiKey':AppKey};
var data_path = '../data/';

try {
//Instantiate Aspose.Storage API SDK
var storageApi = new StorageApi(config);

//Instantiate Aspose.Slides API SDK
var slidesApi = new SlidesApi(config);

//set input file name
var filename = "sample";
var name = filename + ".pptx";
var format = "pdf";
var jpegQuality = 50;
var versionId = null;
var storage = null;
var folder = null;

//upload file to aspose cloud storage
storageApi.PutCreate(name, versionId, storage, data_path + name , function(responseMessage) {
	assert.equal(responseMessage.status, 'OK');
	//invoke Aspose.Slides Cloud SDK API to save a presentation to different other formats with additional settings
	slidesApi.GetSlidesDocumentWithFormat(name, format, jpegQuality, null, storage, folder, null, function(responseMessage) {
			assert.equal(responseMessage.status, 'OK');		
			//download output document from response
			var outfilename = filename + '.' + format;
			var writeStream = fs.createWriteStream('c:/temp/' + outfilename);
			writeStream.write(responseMessage.body);
			});
	});

}catch (e) {
  console.log("exception in example");
  console.log(e);
}
```

##Contact Us
Your feedback is very important to us. Please feel free to contact us using our [Support Forums](https://www.aspose.com/community/forums/).
