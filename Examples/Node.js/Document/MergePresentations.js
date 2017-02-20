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
var name = "sample.pptx";
var mergeFile1 = "welcome.pptx";
var mergeFile2 = "demo.pptx";
var orderedMergeRequestBody = {
		'PresentationPaths' : [mergeFile1, mergeFile2]
};

try {

// Upload files to aspose cloud storage
storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	assert.equal(responseMessage.status, 'OK');

	storageApi.PutCreate(mergeFile1, null, null, data_path + mergeFile1 , function(responseMessage) {
		assert.equal(responseMessage.status, 'OK');

		storageApi.PutCreate(mergeFile2, null, null, data_path + mergeFile2 , function(responseMessage) {
			assert.equal(responseMessage.status, 'OK');

			// Invoke Aspose.Slides Cloud SDK API to merge multiple presentation files
			slidesApi.PostPresentationMerge(name, null, null, orderedMergeRequestBody, function(responseMessage) {
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