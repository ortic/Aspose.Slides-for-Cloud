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
var name = "sample.pptx";
var mergeFile1 = "welcome.pptx";
var mergeFile2 = "demo.pptx";

var presentationToMerge1 = {
		'Path' : mergeFile1,
		'Slides' : [2]
};

var presentationToMerge2 = {
		'Path' : mergeFile2,
		'Slides' : [1]
};

var orderedMergeRequestBody = {
		'Presentations' : [presentationToMerge1, presentationToMerge2]
};

try {

// Upload files to aspose cloud storage
storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	assert.equal(responseMessage.status, 'OK');

	storageApi.PutCreate(mergeFile1, null, null, data_path + mergeFile1 , function(responseMessage) {
		assert.equal(responseMessage.status, 'OK');

		storageApi.PutCreate(mergeFile2, null, null, data_path + mergeFile2 , function(responseMessage) {
			assert.equal(responseMessage.status, 'OK');

			// Invoke Aspose.Slides Cloud SDK API to take selected slides from multiple presentation files and then merge
			slidesApi.PutPresentationMerge(name, null, null, orderedMergeRequestBody, function(responseMessage) {
					assert.equal(responseMessage.status, 'OK');

					// Download presentation from cloud storage
					storageApi.GetDownload(name, null, null, function(responseMessage) {
						assert.equal(responseMessage.status, 'OK');
						var writeStream = fs.createWriteStream(data_path + name);
						writeStream.write(responseMessage.body);
						});
				});
			});
		});
	});

}catch (e) {
  console.log("exception in example");
  console.log(e);
}
//ExEnd:1