var fs = require('fs');
var StorageApi = require('asposestoragecloud');
var SlidesApi = require('../lib/SlidesApi');
var assert = require('assert');

var AppSID = 'XXX'; //sepcify App SID
var AppKey = 'XXX'; //sepcify App Key
var config = {'appSid':AppSID,'apiKey':AppKey , 'debug' : true};
var data_path = './data/';

var storageApi = new StorageApi(config); 
var slidesApi = new SlidesApi(config);
var nodeunit = require('nodeunit');

exports.testPutSlidesConvert = function(test){
	
	test.expect(2);	
	var filename = "sample";
	var name = filename + ".pptx";
	var format = "pdf";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PutSlidesConvert(null, format, null, data_path+name, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				test.equal(responseMessage.status, 'OK', '');
				var writeStream = fs.createWriteStream('c:/temp/' + filename + '.' +  format);
				writeStream.write(responseMessage.body);
				test.done();
			});
		});
};

exports.testGetSlidesDocument = function(test){
	
	test.expect(3);
	var name = "sample-input.pptx";

	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesDocument(name, null, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Document !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPutNewPresentation = function(test){

	test.expect(2);
	var name = "sample" + Math.floor((Math.random() * 1000) + 1) + ".pptx";
	var templatePath = "sample.pptx";
	
	slidesApi.PutNewPresentation(name, null, null, null, data_path + templatePath, function(responseMessage) {
			if(config.debug){console.log('status:', responseMessage.status);}
			if(config.debug){console.log('body:', responseMessage.body);}
			test.equal(responseMessage.status, 'Created', '');
			test.ok(responseMessage.body !== null && typeof responseMessage.body.Document !== 'undefined', "response body assertion should pass");
			test.done();
		});
	
};

exports.testPostSlidesDocument = function(test){

	test.expect(3);	
	var name = "sample" + Math.floor((Math.random() * 1000) + 1) + ".pptx";
	var templatePath = "sample.pptx";
	
	storageApi.PutCreate(templatePath, null, null, data_path + templatePath , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostSlidesDocument(name, templatePath, null, false, null, null, null, data_path+"Test.html", function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'Created', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Document !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPutNewPresentationFromStoredTemplate = function(test){

	test.expect(3);	
	var name = "sample" + Math.floor((Math.random() * 1000) + 1) + ".pptx";
	var templatePath = "sample.pptx";
	
	storageApi.PutCreate(templatePath, null, null, data_path + templatePath , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PutNewPresentationFromStoredTemplate(name, templatePath, null, null, null, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'Created', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Document !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};
	
exports.testGetSlidesDocumentWithFormat = function(test){
	
	test.expect(2);
	var name = "sample.pptx";
	var format = "tiff";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesDocumentWithFormat(name, format, null, null, null, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}				
				test.equal(responseMessage.status, 'OK', '');				
				test.done();
			});
		});
};

exports.testGetSlidesDocumentProperties = function(test){
	
	test.expect(3);
	var name = "sample-input.pptx";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesDocumentProperties(name, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.DocumentProperties !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPostSlidesSetDocumentProperties = function(test){
	
	test.expect(3);	
	var name = "sample-input.pptx";
	var body = {
			'List' : [{
			'Name' : 'Author',
			'Value' :'Farooq Sheikh'
			          }]
	};
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostSlidesSetDocumentProperties(name, null, null, body, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.DocumentProperties !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testDeleteSlidesDocumentProperties = function(test){
	
	test.expect(3);	
	var name = "sample-input.pptx";
		
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.DeleteSlidesDocumentProperties(name, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.DocumentProperties !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPutSlidesSetDocumentProperty = function(test){
	
	test.expect(3);
	var name = "sample-input.pptx";
	var propertyName = "Author";
	
	var docProBody = {
			'Name' : 'Author',
			'Value' :'Farooq Sheikh'
	}; 
        	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PutSlidesSetDocumentProperty(name, propertyName, null, null, docProBody, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.DocumentProperty !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testDeleteSlidesDocumentProperty = function(test){
	
	test.expect(3);
	var name = "sample-input.pptx";
    var propertyName = "AsposeAuthor";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.DeleteSlidesDocumentProperty(name, propertyName, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Code !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPutSlidesDocumentFromHtml = function(test){
	
	test.expect(2);	
	var name = "sample" + Math.floor((Math.random() * 1000) + 1) + ".pptx";
	
	slidesApi.PutSlidesDocumentFromHtml(name, null, null, null, data_path + "ReadMe.html", function(responseMessage) {
			if(config.debug){console.log('status:', responseMessage.status);}
			if(config.debug){console.log('body:', responseMessage.body);}
			test.equal(responseMessage.status, 'Created', '');
			test.ok(responseMessage.body !== null && typeof responseMessage.body.Document !== 'undefined', "response body assertion should pass");
			test.done();
		});
	
};

exports.testGetSlidesImages = function(test){
	
	test.expect(3);	
	var name = "sample-input.pptx";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesImages(name, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Images !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPutPresentationMerge = function(test){
	
	test.expect(5);	
	var name = "sample.pptx";
	var mergeFile1 = "welcome.pptx";
	var mergeFile2 = "demo.pptx";
	var orderedMergeRequestBody = {
			'Presentations' : [mergeFile1, mergeFile2]
	};
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
		test.equal(responseMessage.status, 'OK', '');
		
		storageApi.PutCreate(mergeFile1, null, null, data_path + mergeFile1 , function(responseMessage) {
			test.equal(responseMessage.status, 'OK', '');		
			
			storageApi.PutCreate(mergeFile2, null, null, data_path + mergeFile2 , function(responseMessage) {
				test.equal(responseMessage.status, 'OK', '');
				
				slidesApi.PutPresentationMerge(name, null, null, orderedMergeRequestBody, function(responseMessage) {
						if(config.debug){console.log('status:', responseMessage.status);}
						if(config.debug){console.log('body:', responseMessage.body);}
						test.equal(responseMessage.status, 'OK', '');
						test.ok(responseMessage.body !== null && typeof responseMessage.body.Document !== 'undefined', "response body assertion should pass");
						test.done();
					});
				});
			});
		});
};

exports.testPostPresentationMerge = function(test){
	
	test.expect(5);	
	var name = "sample.pptx";
	var mergeFile1 = "welcome.pptx";
	var mergeFile2 = "demo.pptx";
	var orderedMergeRequestBody = {
			'PresentationPaths' : [mergeFile1, mergeFile2]
	};
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
		test.equal(responseMessage.status, 'OK', '');
		
		storageApi.PutCreate(mergeFile1, null, null, data_path + mergeFile1 , function(responseMessage) {
			test.equal(responseMessage.status, 'OK', '');		
			
			storageApi.PutCreate(mergeFile2, null, null, data_path + mergeFile2 , function(responseMessage) {
				test.equal(responseMessage.status, 'OK', '');
				
				slidesApi.PostPresentationMerge(name, null, null, orderedMergeRequestBody, function(responseMessage) {
						if(config.debug){console.log('status:', responseMessage.status);}
						if(config.debug){console.log('body:', responseMessage.body);}
						test.equal(responseMessage.status, 'OK', '');
						test.ok(responseMessage.body !== null && typeof responseMessage.body.Document !== 'undefined', "response body assertion should pass");
						test.done();
					});
				});
			});
		});
};

exports.testPostSlidesPresentationReplaceText = function(test){
	
	test.expect(3);
	var name = "sample.pptx";
	var oldValue = "aspose";
	var newValue = "aspose2";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostSlidesPresentationReplaceText(name, oldValue, newValue, null, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Matches !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesSlidesList = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesSlidesList(name, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Slides !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPostAddEmptySlide = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostAddEmptySlide(name, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Slides !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testDeleteSlidesCleanSlidesList = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.DeleteSlidesCleanSlidesList(name, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Slides !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPostSlidesReorderPosition = function(test){
	
	test.expect(3);	
	var name = "sample-input.pptx";
	var oldPosition = 1;
	var newPosition = 2;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostSlidesReorderPosition(name, oldPosition, newPosition, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Slides !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPostAddEmptySlideAtPosition = function(test){
	
	test.expect(3);	
	var filename = "sample";
	var name = filename + ".pptx";
	var position = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostAddEmptySlideAtPosition(name, position, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Slides !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPostClonePresentationSlide = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var position = 1;
	var slideToClone = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostClonePresentationSlide(name, position, slideToClone, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Slides !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPostAddSlideCopy = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideToClone = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostAddSlideCopy(name, slideToClone, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Slides !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPostCopySlideFromSourcePresentation = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideToCopy = 1;
	var source = "sample-input.pptx";
	var position = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostCopySlideFromSourcePresentation(name, slideToCopy, source, position, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Slides !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesSlide = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesSlide(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Slide !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testDeleteSlideByIndex = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.DeleteSlideByIndex(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Slides !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlideWithFormat = function(test){
	
	test.expect(2);	
	var name = "sample.pptx";
	var slideIndex = 1;
	var format = "pdf";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlideWithFormat(name, slideIndex, format, null, null, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}				
				test.equal(responseMessage.status, 'OK', '');
				test.done();
			});
		});
};

exports.testGetSlidesSlideBackground = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesSlideBackground(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Background !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPutSlidesSlideBackground = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	var body = "#FFFF0000";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PutSlidesSlideBackground(name, slideIndex, null, null, body, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Background !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testDeleteSlidesSlideBackground = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.DeleteSlidesSlideBackground(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Background !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesSlideComments = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesSlideComments(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.SlideComments !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesSlideImages = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesSlideImages(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Images !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesPlaceholders = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesPlaceholders(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Placeholders !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesPlaceholder = function(test){
	
	test.expect(3);	
	var name = "sample-input.pptx";
	var slideIndex = 1;
	var placeholderIndex = 0;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesPlaceholder(name, slideIndex, placeholderIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Placeholder !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPostSlidesSlideReplaceText = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	var oldValue = "aspose";
	var newValue = "aspose2";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostSlidesSlideReplaceText(name, slideIndex, oldValue, newValue, null, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Slide !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesSlideShapes = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesSlideShapes(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.ShapeList !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlideShapeParagraphs = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	var shapeIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlideShapeParagraphs(name, slideIndex, shapeIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Paragraphs !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetShapeParagraph = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	var shapeIndex = 1;
	var paragraphIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetShapeParagraph(name, slideIndex, shapeIndex, paragraphIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Paragraph !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetParagraphPortion = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	var shapeIndex = 1;
	var paragraphIndex = 1;
	var portionIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetParagraphPortion(name, slideIndex, shapeIndex, paragraphIndex, portionIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Portion !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPutSetParagraphPortionProperties = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	var shapeIndex = 1;
	var paragraphIndex = 1;
	var portionIndex = 1;

	var portionBody = {
			'Text' :  'Aspose.Slides for Node.js',
			'FontColor' : '#FFFF0000'
			
	};
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PutSetParagraphPortionProperties(name, slideIndex, shapeIndex, paragraphIndex, portionIndex, null, null, portionBody, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Portion !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesSlideShapesParent = function(test){
	
	test.expect(3);	
	var name = "sample-input.pptx";
	var slideIndex = 1;
    var shapePath = "1";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesSlideShapesParent(name, slideIndex, shapePath, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Shape !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPutSlideShapeInfo = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	var shapePath = 1;
	var shapeBody = {
			'AlternativeText' : 'Aspose'
	};
        
    storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PutSlideShapeInfo(name, slideIndex, shapePath, null, null, shapeBody, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Shape !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesSlideTextItems = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesSlideTextItems(name, slideIndex, null, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.TextItems !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesTheme = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesTheme(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Theme !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesThemeColorScheme = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesThemeColorScheme(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.ColorScheme !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesThemeFontScheme = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesThemeFontScheme(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.FontScheme !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesThemeFormatScheme = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var slideIndex = 1;
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesThemeFormatScheme(name, slideIndex, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.FormatScheme !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPostSlidesSplit = function(test){
	
	test.expect(3);	
	var name = "sample-input.pptx";
	var from = 2;
	var to = 3;
	var format = "png";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostSlidesSplit(name, null, null, to, from, null, format, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.SplitResult !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesPresentationTextItems = function(test){
	
	test.expect(3);	
	var name = "sample-input.pptx";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesPresentationTextItems(name, null, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.TextItems !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetSlidesDocumentProperty = function(test){
	
	test.expect(3);	
	var name = "sample.pptx";
	var propertyName = "Author";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetSlidesDocumentProperty(name, propertyName, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.DocumentProperty !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testPostSlidesSaveAsHtml = function(test){
	
	test.expect(2);	
	var name = "sample.pptx";
	var body = {
			'SaveAsZip' : true
	};
        
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostSlidesSaveAsHtml(name, null, null, null, null, body, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				test.equal(responseMessage.status, 'OK', '');
				test.done();
			});
		});
};

exports.testPostSlidesSaveAsPdf = function(test){
	
	test.expect(2);	
	var name = "sample.pptx";
	var body = {
			'JpegQuality' : 50
	};
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostSlidesSaveAsPdf(name, null, null, null, null, body, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				test.equal(responseMessage.status, 'OK', '');
				test.done();
			});
		});
};

exports.testPostSlidesSaveAsTiff = function(test){
	
	test.expect(2);	
	var name = "sample.pptx";
	var body = {
			'ExportFormat' : 'tiff'
	};
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostSlidesSaveAsTiff(name, null, null, null, null, body, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				test.equal(responseMessage.status, 'OK', '');
				test.done();
			});
		});
};

exports.testPostAddNewShape = function(test){
	
	test.expect(3);	
	var name = "sample-input.pptx";
	var slideIndex = 1;
	var body = {
			'Name': 'Aspose',
			'Type' : 'Shape',			
			'AlternativeText' : 'Aspose',
			'ShapeType' : 'Line'
	};
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.PostAddNewShape(name, slideIndex, null, null, body, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				if(config.debug){console.log('body:', responseMessage.body);}
				test.equal(responseMessage.status, 'OK', '');
				test.ok(responseMessage.body !== null && typeof responseMessage.body.Shape !== 'undefined', "response body assertion should pass");
				test.done();
			});
		});
};

exports.testGetShapeWithFormat = function(test){
	
	test.expect(2);	
	var name = "sample.pptx";
	var slideIndex = 1;
	var shapeIndex = 1;
	var format = "png";
	
	storageApi.PutCreate(name, null, null, data_path + name , function(responseMessage) {
	
		test.equal(responseMessage.status, 'OK', '');		
		slidesApi.GetShapeWithFormat(name, slideIndex, shapeIndex, format, null, null, null, null, null, function(responseMessage) {
				if(config.debug){console.log('status:', responseMessage.status);}
				test.equal(responseMessage.status, 'OK', '');				
				test.done();
			});
		});
};
