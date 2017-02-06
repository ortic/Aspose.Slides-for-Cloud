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
var name =  "sample-input.pptx";
var slideIndex = 1;

var versionId = null;
var storage = "AsposeDropboxStorage";
var folder = null;

try {
// Upload file to 3rd party cloud storage
storageApi.PutCreate(name, versionId, storage, data_path + name , function(responseMessage) {

	assert.equal(responseMessage.status, 'OK');

	// Invoke Aspose.Slides Cloud SDK API to get PowerPoint document slide list
	slidesApi.GetSlidesSlidesList(name, folder, storage, function(responseMessage) {
			assert.equal(responseMessage.status, 'OK');
			var count = responseMessage.body.Slides.SlideList.length;
			console.log("Total Slides :: " + count);
			});
	});

}catch (e) {
  console.log("exception in example");
  console.log(e);
}
//ExEnd:1