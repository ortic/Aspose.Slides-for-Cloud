// ExStart:1
var fs = require('fs');
var assert = require('assert');
var SlidesApi = require('asposeslidescloud');
var StorageApi = require('asposestoragecloud');
var configProps = require('../Config/config.json');
var data_path = '../../../Data/';

var AppSID = configProps.app_sid;
var AppKey = configProps.api_key;
var outFolder = configProps.out_folder;
var config = {'appSid':AppSID,'apiKey':AppKey , 'debug' : true};

// Instantiate Aspose Storage API SDK
var storageApi = new StorageApi(config);
// Instantiate Aspose.Slides API SDK
var slidesApi = new SlidesApi(config);

// Set input file name
var name = "sample" + Math.floor((Math.random() * 1000) + 1) + ".pptx";
var templatePath = "sample.pptx";

var storage = null;
var folder = null;

try {

	// Invoke Aspose.Slides Cloud SDK API to create a new empty presentation
	slidesApi.PutNewPresentation(name, null, storage, folder, data_path + "sample.pptx", function(responseMessage) {
			assert.equal(responseMessage.status, 'Created');
			
			// Download presentation from cloud storage
			storageApi.GetDownload(name, null, null, function(responseMessage) {
				assert.equal(responseMessage.status, 'OK');
				var writeStream = fs.createWriteStream(data_path + name);
				writeStream.write(responseMessage.body);
				});

	});

}catch (e) {
  console.log("exception in example");
  console.log(e);
}
//ExEnd:1