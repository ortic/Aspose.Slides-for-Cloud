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
var storage = null;
var folder = null;

try {
// Upload source file to aspose cloud storage
storageApi.PutCreate(name, versionId, storage, data_path + name , function(responseMessage) {

	assert.equal(responseMessage.status, 'OK');

	// Invoke Aspose.Slides Cloud SDK API to get comments of a particular slide
	slidesApi.GetSlidesSlideComments(name, slideIndex, folder, storage, function(responseMessage) {
			assert.equal(responseMessage.status, 'OK');
			if(config.debug){console.log('body:', responseMessage.body);}
			responseMessage.body.SlideComments.List.forEach(function(slideComment) {
				console.log("Author :: " + slideComment.Author);
				console.log("Text :: " + slideComment.Text);
				});
			});
	});

}catch (e) {
  console.log("exception in example");
  console.log(e);
}
//ExEnd:1