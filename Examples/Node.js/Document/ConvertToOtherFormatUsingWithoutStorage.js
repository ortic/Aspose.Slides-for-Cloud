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
var filename = "sample";
var name = filename + ".pptx";
var format = "pdf";

try {

	// Invoke Aspose.Slides Cloud SDK API to save a presentation to different other formats using input stream
	slidesApi.PutSlidesConvert(null, format, null, data_path+name, function(responseMessage) {
			assert.equal(responseMessage.status, 'OK');
			
			// Save converted format file from response
			var outfilename = filename + "." + format;
			var writeStream = fs.createWriteStream(data_path + outfilename);
			writeStream.write(responseMessage.body);

			});

}catch (e) {
  console.log("exception in example");
  console.log(e);
}
//ExEnd:1