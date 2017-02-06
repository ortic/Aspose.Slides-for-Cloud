// ExStart:1
var fs = require('fs');
var assert = require('assert');
var SlidesApi = require('asposeslidescloud');
var StorageApi = require('asposestoragecloud');
var configProps = require('../Data/config.json');
var data_path = '../Data/';

var AppSID = configProps.app_sid;
var AppKey = configProps.api_key;
var outFolder = configProps.out_folder;
var config = {'appSid':AppSID,'apiKey':AppKey , 'debug' : true};

// Instantiate Aspose Storage API SDK
var storageApi = new StorageApi(config);
// Instantiate Aspose.Slides API SDK
var slidesApi = new SlidesApi(config);

// Set input file name
var name = "sample-input.pptx";
var from = 2;
var to = 3;
var format = "png";

var versionId = null;
var storage = null;
var folder = null;

try {
// Upload source file to aspose cloud storage
storageApi.PutCreate(name, versionId, storage, data_path + name , function(responseMessage) {

	assert.equal(responseMessage.status, 'OK');

	// Invoke Aspose.Slides Cloud SDK API to split all or specific slides of a presentation file to specify format
	slidesApi.PostSlidesSplit(name, null, null, to, from, null, format, storage, folder, function(responseMessage) {
			assert.equal(responseMessage.status, 'OK');

			responseMessage.body.SplitResult.Slides.forEach(function(splitDoc) {
				var urlString = splitDoc.Href;
				var splittedFileName = urlString.split('/').pop();
				
				// Download file from storage server
				storageApi.GetDownload(splittedFileName, null, null, function(responseMessage) {
					assert.equal(responseMessage.status, 'OK');
					var writeStream = fs.createWriteStream(data_path + splittedFileName);
					writeStream.write(responseMessage.body);
					});
				});

			});
	});

}catch (e) {
  console.log("exception in example");
  console.log(e);
}
//ExEnd:1