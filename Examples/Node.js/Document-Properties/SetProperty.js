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
var propertyName = "Author";

var docProBody = {
		'Name' : 'Author',
		'Value' :'Naeem Akram'
};

var versionId = null;
var storage = null;
var folder = null;

try {
// Upload source file to aspose cloud storage
storageApi.PutCreate(name, versionId, storage, data_path + name , function(responseMessage) {

	assert.equal(responseMessage.status, 'OK');

	// Invoke Aspose.Slides Cloud SDK API to set a single document property
	slidesApi.PutSlidesSetDocumentProperty(name, propertyName, folder, storage, docProBody, function(responseMessage) {
			assert.equal(responseMessage.status, 'OK');
			var docProperty = responseMessage.body.DocumentProperty;
			console.log(docProperty.Name + " :: " +  docProperty.Value);
			});
	});

}catch (e) {
  console.log("exception in example");
  console.log(e);
}
//ExEnd:1