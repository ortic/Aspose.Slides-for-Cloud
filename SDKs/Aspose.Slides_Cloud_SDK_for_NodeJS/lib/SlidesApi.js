var path = require('path');
var fs = require('fs');
var apiClient = require('./api-client');


function SlidesApi(config) {
	var self = this;
	
	apiClient = new apiClient(config);
	this.config = apiClient.config;
}


/**
* PutSlidesConvert
* Convert presentation from request content to format specified.
*
* @param  (String) password  -  The document password. (optional) 
* @param  (String) format  -  The format. (optional) 
* @param  (String) outPath  -  Path to save result (optional) 
* @param  (File) file  -   (required) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.PutSlidesConvert = function(password, format, outPath, file, callback) {

    var self = this;
	   	
	
	if( typeof file === 'undefined' || file === null && file === ''){
		throw new Error('missing required file.');
    }	
	var resourcePath = '/slides/convert/?appSid={appSid}&amp;password={password}&amp;toFormat={toFormat}&amp;outPath={outPath}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof password !== 'undefined' &&  password !== null && password!== ''){            
			resourcePath = resourcePath.replace("{" + "password" + "}" , password);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]password.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof format !== 'undefined' &&  format !== null && format!== ''){            
			resourcePath = resourcePath.replace("{" + "format" + "}" , format);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]format.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof outPath !== 'undefined' &&  outPath !== null && outPath!== ''){            
			resourcePath = resourcePath.replace("{" + "outPath" + "}" , outPath);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]outPath.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'PUT'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	if(file !== 'undefined' && file !== null && file !== ''){
		postData = fs.readFileSync(file)
	}
	
	headerParams['Accept'] = 'application/xml,application/octet-stream'
    headerParams['Content-Type'] = 'multipart/form-data'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesDocument
* Read presentation info.
*
* @param  (String) name  -  The document name. (required) 
* @param  (String) password  -  The document password. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @param  (String) folder  -  Document&#39;s folder. (optional) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.GetSlidesDocument = function(name, password, storage, folder, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }    	
		
	var resourcePath = '/slides/{name}/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof password !== 'undefined' &&  password !== null && password!== ''){            
			resourcePath = resourcePath.replace("{" + "password" + "}" , password);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]password.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PutNewPresentation
* Create presentation
*
* @param  (String) name  -  The document name. (required) 
* @param  (String) password  -  The document password. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @param  (String) folder  -  Document&#39;s folder. (optional) 
* @param  (File) file  -   (required) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.PutNewPresentation = function(name, password, storage, folder, file, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }    	
	
	if( typeof file === 'undefined' || file === null && file === ''){
		throw new Error('missing required file.');
    }	
	var resourcePath = '/slides/{name}/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof password !== 'undefined' &&  password !== null && password!== ''){            
			resourcePath = resourcePath.replace("{" + "password" + "}" , password);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]password.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'PUT'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	if(file !== 'undefined' && file !== null && file !== ''){
		postData = fs.readFileSync(file)
	}
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'multipart/form-data'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostSlidesDocument
* Create presentation
*
* @param  (String) name  -  The document name. (required) 
* @param  (String) templatePath  -  Template file path. (required) 
* @param  (String) templateStorage  -  Template storage name. (optional) 
* @param  (Boolean) isImageDataEmbeeded  -  Is Image Data Embeeded (optional) 
* @param  (String) password  -  The document password. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @param  (String) folder  -  Document&#39;s folder. (optional) 
* @param  (File) file  -   (required) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.PostSlidesDocument = function(name, templatePath, templateStorage, isImageDataEmbeeded, password, storage, folder, file, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof templatePath === 'undefined' || templatePath === null && templatePath === ''){
		throw new Error('missing required parameters.');
    }      	
	
	if( typeof file === 'undefined' || file === null && file === ''){
		throw new Error('missing required file.');
    }	
	var resourcePath = '/slides/{name}/?appSid={appSid}&amp;templatePath={templatePath}&amp;templateStorage={templateStorage}&amp;isImageDataEmbeeded={isImageDataEmbeeded}&amp;password={password}&amp;storage={storage}&amp;folder={folder}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof templatePath !== 'undefined' &&  templatePath !== null && templatePath!== ''){            
			resourcePath = resourcePath.replace("{" + "templatePath" + "}" , templatePath);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]templatePath.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof templateStorage !== 'undefined' &&  templateStorage !== null && templateStorage!== ''){            
			resourcePath = resourcePath.replace("{" + "templateStorage" + "}" , templateStorage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]templateStorage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof isImageDataEmbeeded !== 'undefined' &&  isImageDataEmbeeded !== null && isImageDataEmbeeded!== ''){            
			resourcePath = resourcePath.replace("{" + "isImageDataEmbeeded" + "}" , isImageDataEmbeeded);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]isImageDataEmbeeded.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof password !== 'undefined' &&  password !== null && password!== ''){            
			resourcePath = resourcePath.replace("{" + "password" + "}" , password);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]password.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	if(file !== 'undefined' && file !== null && file !== ''){
		postData = fs.readFileSync(file)
	}
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'multipart/form-data'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PutNewPresentationFromStoredTemplate
* Create presentation from stored template
*
* @param  (String) name  -  The document name. (required) 
* @param  (String) templatePath  -  Template file path. (required) 
* @param  (String) templateStorage  -  Template storage name. (optional) 
* @param  (String) password  -  The document password. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @param  (String) folder  -  Document&#39;s folder. (optional) 
* @param  (File) file  -   (required) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.PutNewPresentationFromStoredTemplate = function(name, templatePath, templateStorage, password, storage, folder, file, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof templatePath === 'undefined' || templatePath === null && templatePath === ''){
		throw new Error('missing required parameters.');
    }     	
	
	var resourcePath = '/slides/{name}/?appSid={appSid}&amp;templatePath={templatePath}&amp;templateStorage={templateStorage}&amp;password={password}&amp;storage={storage}&amp;folder={folder}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof templatePath !== 'undefined' &&  templatePath !== null && templatePath!== ''){            
			resourcePath = resourcePath.replace("{" + "templatePath" + "}" , templatePath);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]templatePath.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof templateStorage !== 'undefined' &&  templateStorage !== null && templateStorage!== ''){            
			resourcePath = resourcePath.replace("{" + "templateStorage" + "}" , templateStorage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]templateStorage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof password !== 'undefined' &&  password !== null && password!== ''){            
			resourcePath = resourcePath.replace("{" + "password" + "}" , password);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]password.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'PUT'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	if(file !== 'undefined' && file !== null && file !== ''){
		postData = fs.readFileSync(file)
	}
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'multipart/form-data'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesDocumentWithFormat
* Export presentation to some format.
*
* @param  (String) name  -  The document name. (required) 
* @param  (String) format  -  The conversion format. (required) 
* @param  (String) jpegQuality  -  Quality of the JPEG images inside PDF document. (optional) 
* @param  (String) password  -  The document password. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @param  (String) folder  -  Document&#39;s folder. (optional) 
* @param  (String) outPath  -  Path to save result (optional) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.GetSlidesDocumentWithFormat = function(name, format, jpegQuality, password, storage, folder, outPath, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof format === 'undefined' || format === null && format === ''){
		throw new Error('missing required parameters.');
    }      	
		
	var resourcePath = '/slides/{name}/?appSid={appSid}&amp;toFormat={toFormat}&amp;jpegQuality={jpegQuality}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof format !== 'undefined' &&  format !== null && format!== ''){            
			resourcePath = resourcePath.replace("{" + "format" + "}" , format);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]format.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof jpegQuality !== 'undefined' &&  jpegQuality !== null && jpegQuality!== ''){            
			resourcePath = resourcePath.replace("{" + "jpegQuality" + "}" , jpegQuality);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]jpegQuality.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof password !== 'undefined' &&  password !== null && password!== ''){            
			resourcePath = resourcePath.replace("{" + "password" + "}" , password);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]password.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof outPath !== 'undefined' &&  outPath !== null && outPath!== ''){            
			resourcePath = resourcePath.replace("{" + "outPath" + "}" , outPath);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]outPath.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/octet-stream'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesDocumentProperties
* Read presentation document properties.
*
* @param  (String) name  -  The document name. (required) 
* @param  (String) folder  -  Document&#39;s folder. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @returns DocumentPropertiesResponse (Map)
*/
SlidesApi.prototype.GetSlidesDocumentProperties = function(name, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/documentproperties/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostSlidesSetDocumentProperties
* Set document properties.
*
* @param  (String) name  -  The document name. (required) 
* @param  (String) folder  -  Document&#39;s folder. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @param  (DocumentProperties) body  -  New properties. (required) 
* @returns DocumentPropertiesResponse (Map)
*/
SlidesApi.prototype.PostSlidesSetDocumentProperties = function(name, folder, storage, body, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/documentproperties/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = JSON.stringify(body);
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* DeleteSlidesDocumentProperties
* Clean document properties.
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @returns DocumentPropertiesResponse (Map)
*/
SlidesApi.prototype.DeleteSlidesDocumentProperties = function(name, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/documentproperties/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'DELETE'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PutSlidesSetDocumentProperty
* Set document property.
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) propertyName  -  The property name. (required) 
* @param  (String) folder  -  Document&#39;s folder. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @param  (DocumentProperty) body  -  Property with the value. (required) 
* @returns DocumentPropertyResponse (Map)
*/
SlidesApi.prototype.PutSlidesSetDocumentProperty = function(name, propertyName, folder, storage, body, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof propertyName === 'undefined' || propertyName === null && propertyName === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/documentproperties/{propertyName}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof propertyName !== 'undefined' &&  propertyName !== null && propertyName!== ''){            
			resourcePath = resourcePath.replace("{" + "propertyName" + "}" , propertyName);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]propertyName.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'PUT'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = JSON.stringify(body);
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* DeleteSlidesDocumentProperty
* Delete document property.
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) propertyName  -  The property name. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @returns CommonResponse (Map)
*/
SlidesApi.prototype.DeleteSlidesDocumentProperty = function(name, propertyName, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof propertyName === 'undefined' || propertyName === null && propertyName === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/documentproperties/{propertyName}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof propertyName !== 'undefined' &&  propertyName !== null && propertyName!== ''){            
			resourcePath = resourcePath.replace("{" + "propertyName" + "}" , propertyName);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]propertyName.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'DELETE'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PutSlidesDocumentFromHtml
* Create presentation document from html
*
* @param  (String) name  -  The document name. (required) 
* @param  (String) password  -  The document password. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @param  (String) folder  -  Document&#39;s folder. (optional) 
* @param  (File) file  -   (required) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.PutSlidesDocumentFromHtml = function(name, password, storage, folder, file, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }    	
	
	if( typeof file === 'undefined' || file === null && file === ''){
		throw new Error('missing required file.');
    }	
	var resourcePath = '/slides/{name}/fromHtml/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof password !== 'undefined' &&  password !== null && password!== ''){            
			resourcePath = resourcePath.replace("{" + "password" + "}" , password);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]password.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'PUT'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	if(file !== 'undefined' && file !== null && file !== ''){
		postData = fs.readFileSync(file)
	}
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'multipart/form-data'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesImages
* Read presentation images info.
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @returns ImagesResponse (Map)
*/
SlidesApi.prototype.GetSlidesImages = function(name, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/images/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PutPresentationMerge
* Merge presentations.
*
* @param  (String) name  -  Original presentation name. (required) 
* @param  (String) storage  -  The storage. (optional) 
* @param  (String) folder  -  The folder. (optional) 
* @param  (OrderedMergeRequest) body  -  with a list of presentations to merge. (required) 
* @returns DocumentResponse (Map)
*/
SlidesApi.prototype.PutPresentationMerge = function(name, storage, folder, body, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/merge/?appSid={appSid}&amp;storage={storage}&amp;folder={folder}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'PUT'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = JSON.stringify(body);
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostPresentationMerge
* Merge presentations.
*
* @param  (String) name  -  Original presentation name. (required) 
* @param  (String) storage  -  The storage. (optional) 
* @param  (String) folder  -  The folder. (optional) 
* @param  (PresentationsMergeRequest) body  -  with a list of presentations to merge. (required) 
* @returns DocumentResponse (Map)
*/
SlidesApi.prototype.PostPresentationMerge = function(name, storage, folder, body, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/merge/?appSid={appSid}&amp;storage={storage}&amp;folder={folder}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = JSON.stringify(body);
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostSlidesPresentationReplaceText
* Replace text by a new value.
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) oldValue  -  Text value to replace. (required) 
* @param  (String) newValue  -  The new text value. (required) 
* @param  (Boolean) ignoreCase  -  Is case must be ignored. (optional) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns PresentationStringReplaceResponse (Map)
*/
SlidesApi.prototype.PostSlidesPresentationReplaceText = function(name, oldValue, newValue, ignoreCase, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof oldValue === 'undefined' || oldValue === null && oldValue === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof newValue === 'undefined' || newValue === null && newValue === ''){
		throw new Error('missing required parameters.');
    }    	
		
	var resourcePath = '/slides/{name}/replaceText/?oldValue={oldValue}&amp;newValue={newValue}&amp;appSid={appSid}&amp;ignoreCase={ignoreCase}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof oldValue !== 'undefined' &&  oldValue !== null && oldValue!== ''){            
			resourcePath = resourcePath.replace("{" + "oldValue" + "}" , oldValue);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]oldValue.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof newValue !== 'undefined' &&  newValue !== null && newValue!== ''){            
			resourcePath = resourcePath.replace("{" + "newValue" + "}" , newValue);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]newValue.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof ignoreCase !== 'undefined' &&  ignoreCase !== null && ignoreCase!== ''){            
			resourcePath = resourcePath.replace("{" + "ignoreCase" + "}" , ignoreCase);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]ignoreCase.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesSlidesList
* Read presentation slides info.
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns SlideListResponse (Map)
*/
SlidesApi.prototype.GetSlidesSlidesList = function(name, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostAddEmptySlide
* Add empty slide to the end of presentation
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  The presentation storage. (optional) 
* @returns SlideListResponse (Map)
*/
SlidesApi.prototype.PostAddEmptySlide = function(name, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* DeleteSlidesCleanSlidesList
* Delete presentation slides.
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns SlideListResponse (Map)
*/
SlidesApi.prototype.DeleteSlidesCleanSlidesList = function(name, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'DELETE'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostSlidesReorderPosition
* Reorder presentation slide position
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) oldPosition  -  The new presentation slide position. (required) 
* @param  (String) newPosition  -  The new presentation slide position. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  The presentation storage. (optional) 
* @returns SlideListResponse (Map)
*/
SlidesApi.prototype.PostSlidesReorderPosition = function(name, oldPosition, newPosition, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof oldPosition === 'undefined' || oldPosition === null && oldPosition === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof newPosition === 'undefined' || newPosition === null && newPosition === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/?appSid={appSid}&amp;oldPosition={oldPosition}&amp;newPosition={newPosition}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof oldPosition !== 'undefined' &&  oldPosition !== null && oldPosition!== ''){            
			resourcePath = resourcePath.replace("{" + "oldPosition" + "}" , oldPosition);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]oldPosition.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof newPosition !== 'undefined' &&  newPosition !== null && newPosition!== ''){            
			resourcePath = resourcePath.replace("{" + "newPosition" + "}" , newPosition);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]newPosition.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostAddEmptySlideAtPosition
* Add empty presentation slide to the end of presentation
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) position  -  The presentation slide position. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  The presentation storage. (optional) 
* @returns SlideListResponse (Map)
*/
SlidesApi.prototype.PostAddEmptySlideAtPosition = function(name, position, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof position === 'undefined' || position === null && position === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/?appSid={appSid}&amp;position={position}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof position !== 'undefined' &&  position !== null && position!== ''){            
			resourcePath = resourcePath.replace("{" + "position" + "}" , position);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]position.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostClonePresentationSlide
* Clone presentation slide
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) position  -  The presentation slide position. (required) 
* @param  (String) slideToClone  -  The presentation slide to clone. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  The presentation storage. (optional) 
* @returns SlideListResponse (Map)
*/
SlidesApi.prototype.PostClonePresentationSlide = function(name, position, slideToClone, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof position === 'undefined' || position === null && position === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideToClone === 'undefined' || slideToClone === null && slideToClone === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/?appSid={appSid}&amp;position={position}&amp;slideToClone={slideToClone}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof position !== 'undefined' &&  position !== null && position!== ''){            
			resourcePath = resourcePath.replace("{" + "position" + "}" , position);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]position.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideToClone !== 'undefined' &&  slideToClone !== null && slideToClone!== ''){            
			resourcePath = resourcePath.replace("{" + "slideToClone" + "}" , slideToClone);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideToClone.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostAddSlideCopy
* Add a copy of slide to the end of presentation
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) slideToClone  -  The presentation slide to clone. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  The presentation storage. (optional) 
* @returns SlideListResponse (Map)
*/
SlidesApi.prototype.PostAddSlideCopy = function(name, slideToClone, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideToClone === 'undefined' || slideToClone === null && slideToClone === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/?appSid={appSid}&amp;slideToClone={slideToClone}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideToClone !== 'undefined' &&  slideToClone !== null && slideToClone!== ''){            
			resourcePath = resourcePath.replace("{" + "slideToClone" + "}" , slideToClone);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideToClone.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostCopySlideFromSourcePresentation
* Copy slide from source presentation
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) slideToCopy  -  The presentation slide to copy. (required) 
* @param  (String) source  -  The source presentation. (required) 
* @param  (String) position  -  The presentation slide position. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  The presentation storage. (optional) 
* @returns SlideListResponse (Map)
*/
SlidesApi.prototype.PostCopySlideFromSourcePresentation = function(name, slideToCopy, source, position, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideToCopy === 'undefined' || slideToCopy === null && slideToCopy === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof source === 'undefined' || source === null && source === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof position === 'undefined' || position === null && position === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/?appSid={appSid}&amp;slideToCopy={slideToCopy}&amp;source={source}&amp;position={position}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideToCopy !== 'undefined' &&  slideToCopy !== null && slideToCopy!== ''){            
			resourcePath = resourcePath.replace("{" + "slideToCopy" + "}" , slideToCopy);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideToCopy.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof source !== 'undefined' &&  source !== null && source!== ''){            
			resourcePath = resourcePath.replace("{" + "source" + "}" , source);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]source.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof position !== 'undefined' &&  position !== null && position!== ''){            
			resourcePath = resourcePath.replace("{" + "position" + "}" , position);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]position.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesSlide
* Read slide info.
*
* @param  (String) name  -   (required) 
* @param  (String) slideIndex  -   (required) 
* @param  (String) folder  -   (optional) 
* @param  (String) storage  -   (optional) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.GetSlidesSlide = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* DeleteSlideByIndex
* Delete presentation slide by its index.
*
* @param  (String) name  -  The presentation name. (required) 
* @param  (String) slideIndex  -  The slide index. (required) 
* @param  (String) folder  -  The presentation folder. (optional) 
* @param  (String) storage  -  The presentation storage. (optional) 
* @returns SlideListResponse (Map)
*/
SlidesApi.prototype.DeleteSlideByIndex = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'DELETE'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlideWithFormat
* Convert slide to some format.
*
* @param  (String) name  -   (required) 
* @param  (String) slideIndex  -   (required) 
* @param  (String) format  -   (required) 
* @param  (String) width  -   (optional) 
* @param  (String) height  -   (optional) 
* @param  (String) folder  -   (optional) 
* @param  (String) storage  -   (optional) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.GetSlideWithFormat = function(name, slideIndex, format, width, height, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof format === 'undefined' || format === null && format === ''){
		throw new Error('missing required parameters.');
    }     	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/?appSid={appSid}&amp;toFormat={toFormat}&amp;width={width}&amp;height={height}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof format !== 'undefined' &&  format !== null && format!== ''){            
			resourcePath = resourcePath.replace("{" + "format" + "}" , format);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]format.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof width !== 'undefined' &&  width !== null && width!== ''){            
			resourcePath = resourcePath.replace("{" + "width" + "}" , width);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]width.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof height !== 'undefined' &&  height !== null && height!== ''){            
			resourcePath = resourcePath.replace("{" + "height" + "}" , height);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]height.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/octet-stream'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesSlideBackground
* Read presentation slide background color type.
*
* @param  (String) name  -   (required) 
* @param  (String) slideIndex  -   (required) 
* @param  (String) folder  -   (optional) 
* @param  (String) storage  -   (optional) 
* @returns SlideBackgroundResponse (Map)
*/
SlidesApi.prototype.GetSlidesSlideBackground = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/background/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PutSlidesSlideBackground
* Set presentation slide background color.
*
* @param  (String) name  -   (required) 
* @param  (String) slideIndex  -   (required) 
* @param  (String) folder  -   (optional) 
* @param  (String) storage  -   (optional) 
* @param  () body  -   (required) 
* @returns SlideBackgroundResponse (Map)
*/
SlidesApi.prototype.PutSlidesSlideBackground = function(name, slideIndex, folder, storage, body, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/background/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'PUT'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = JSON.stringify(body);
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* DeleteSlidesSlideBackground
* Remove presentation slide background color.
*
* @param  (String) name  -   (required) 
* @param  (String) slideIndex  -   (required) 
* @param  (String) folder  -   (optional) 
* @param  (String) storage  -   (optional) 
* @returns SlideBackgroundResponse (Map)
*/
SlidesApi.prototype.DeleteSlidesSlideBackground = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/background/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'DELETE'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesSlideComments
* Read presentation slide comments.
*
* @param  (String) name  -   (required) 
* @param  (String) slideIndex  -   (required) 
* @param  (String) folder  -   (optional) 
* @param  (String) storage  -   (optional) 
* @returns SlideCommentsResponse (Map)
*/
SlidesApi.prototype.GetSlidesSlideComments = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/comments/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesSlideImages
* Read slide images info.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  The slide index. (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @returns ImagesResponse (Map)
*/
SlidesApi.prototype.GetSlidesSlideImages = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/images/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesPlaceholders
* Read slide placeholders info.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Slide index. (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @returns PlaceholdersResponse (Map)
*/
SlidesApi.prototype.GetSlidesPlaceholders = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/placeholders/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesPlaceholder
* Read slide placeholder info.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Slide index. (required) 
* @param  (String) placeholderIndex  -  Pleceholder index. (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @returns PlaceholderResponse (Map)
*/
SlidesApi.prototype.GetSlidesPlaceholder = function(name, slideIndex, placeholderIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof placeholderIndex === 'undefined' || placeholderIndex === null && placeholderIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/placeholders/{placeholderIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof placeholderIndex !== 'undefined' &&  placeholderIndex !== null && placeholderIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "placeholderIndex" + "}" , placeholderIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]placeholderIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostSlidesSlideReplaceText
* Replace text by a new value.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Slide&#39;s index. (required) 
* @param  (String) oldValue  -  Text to replace. (required) 
* @param  (String) newValue  -  New text value. (required) 
* @param  (Boolean) ignoreCase  -  Is case must be ignored. (optional) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns SlideStringReplaceResponse (Map)
*/
SlidesApi.prototype.PostSlidesSlideReplaceText = function(name, slideIndex, oldValue, newValue, ignoreCase, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof oldValue === 'undefined' || oldValue === null && oldValue === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof newValue === 'undefined' || newValue === null && newValue === ''){
		throw new Error('missing required parameters.');
    }    	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/replaceText/?oldValue={oldValue}&amp;newValue={newValue}&amp;appSid={appSid}&amp;ignoreCase={ignoreCase}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof oldValue !== 'undefined' &&  oldValue !== null && oldValue!== ''){            
			resourcePath = resourcePath.replace("{" + "oldValue" + "}" , oldValue);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]oldValue.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof newValue !== 'undefined' &&  newValue !== null && newValue!== ''){            
			resourcePath = resourcePath.replace("{" + "newValue" + "}" , newValue);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]newValue.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof ignoreCase !== 'undefined' &&  ignoreCase !== null && ignoreCase!== ''){            
			resourcePath = resourcePath.replace("{" + "ignoreCase" + "}" , ignoreCase);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]ignoreCase.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesSlideShapes
* Read slides shapes info.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Slide index. (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns ShapeListResponse (Map)
*/
SlidesApi.prototype.GetSlidesSlideShapes = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/shapes/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlideShapeParagraphs
* Reads a list of paragraphs in shape&#39;s textBody.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Index of slide starting from 1 (required) 
* @param  (String) shapeIndex  -  Index of shape starting from 1 (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.GetSlideShapeParagraphs = function(name, slideIndex, shapeIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof shapeIndex === 'undefined' || shapeIndex === null && shapeIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof shapeIndex !== 'undefined' &&  shapeIndex !== null && shapeIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "shapeIndex" + "}" , shapeIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]shapeIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetShapeParagraph
* Reads paragraph in shape&#39;s textBody.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Index of slide starting from 1 (required) 
* @param  (String) shapeIndex  -  Index of shape starting from 1 (required) 
* @param  (String) paragraphIndex  -  Index of paragraph starting from 1 (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.GetShapeParagraph = function(name, slideIndex, shapeIndex, paragraphIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof shapeIndex === 'undefined' || shapeIndex === null && shapeIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof paragraphIndex === 'undefined' || paragraphIndex === null && paragraphIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof shapeIndex !== 'undefined' &&  shapeIndex !== null && shapeIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "shapeIndex" + "}" , shapeIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]shapeIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof paragraphIndex !== 'undefined' &&  paragraphIndex !== null && paragraphIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "paragraphIndex" + "}" , paragraphIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]paragraphIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetParagraphPortion
* Reads paragraph portion in shape&#39;s textBody.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Index of slide starting from 1 (required) 
* @param  (String) shapeIndex  -  Index of shape starting from 1 (required) 
* @param  (String) paragraphIndex  -  Index of paragraph starting from 1 (required) 
* @param  (String) portionIndex  -  Index of portion starting from 1 (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Document&#39;s storage. (optional) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.GetParagraphPortion = function(name, slideIndex, shapeIndex, paragraphIndex, portionIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof shapeIndex === 'undefined' || shapeIndex === null && shapeIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof paragraphIndex === 'undefined' || paragraphIndex === null && paragraphIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof portionIndex === 'undefined' || portionIndex === null && portionIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}/portions/{portionIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof shapeIndex !== 'undefined' &&  shapeIndex !== null && shapeIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "shapeIndex" + "}" , shapeIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]shapeIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof paragraphIndex !== 'undefined' &&  paragraphIndex !== null && paragraphIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "paragraphIndex" + "}" , paragraphIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]paragraphIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof portionIndex !== 'undefined' &&  portionIndex !== null && portionIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "portionIndex" + "}" , portionIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]portionIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PutSetParagraphPortionProperties
* Updates paragraph portion properties.
*
* @param  (String) name  -   (required) 
* @param  (String) slideIndex  -   (required) 
* @param  (String) shapeIndex  -   (required) 
* @param  (String) paragraphIndex  -   (required) 
* @param  (String) portionIndex  -   (required) 
* @param  (String) folder  -   (optional) 
* @param  (String) storage  -   (optional) 
* @param  (Portion) body  -   (required) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.PutSetParagraphPortionProperties = function(name, slideIndex, shapeIndex, paragraphIndex, portionIndex, folder, storage, body, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof shapeIndex === 'undefined' || shapeIndex === null && shapeIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof paragraphIndex === 'undefined' || paragraphIndex === null && paragraphIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof portionIndex === 'undefined' || portionIndex === null && portionIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}/portions/{portionIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof shapeIndex !== 'undefined' &&  shapeIndex !== null && shapeIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "shapeIndex" + "}" , shapeIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]shapeIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof paragraphIndex !== 'undefined' &&  paragraphIndex !== null && paragraphIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "paragraphIndex" + "}" , paragraphIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]paragraphIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof portionIndex !== 'undefined' &&  portionIndex !== null && portionIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "portionIndex" + "}" , portionIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]portionIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'PUT'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = JSON.stringify(body);
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesSlideShapesParent
* Read slide shapes or shape info.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Slide index. (required) 
* @param  (String) shapePath  -  Shape path. (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.GetSlidesSlideShapesParent = function(name, slideIndex, shapePath, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof shapePath === 'undefined' || shapePath === null && shapePath === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/shapes/{shapePath}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof shapePath !== 'undefined' &&  shapePath !== null && shapePath!== ''){            
			resourcePath = resourcePath.replace("{" + "shapePath" + "}" , shapePath);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]shapePath.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PutSlideShapeInfo
* Updates shape properties.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Slide index. (required) 
* @param  (String) shapePath  -  Shape path. (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @param  (Shape) body  -  Shape dto. (required) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.PutSlideShapeInfo = function(name, slideIndex, shapePath, folder, storage, body, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof shapePath === 'undefined' || shapePath === null && shapePath === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/shapes/{shapePath}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof shapePath !== 'undefined' &&  shapePath !== null && shapePath!== ''){            
			resourcePath = resourcePath.replace("{" + "shapePath" + "}" , shapePath);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]shapePath.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'PUT'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = JSON.stringify(body);
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesSlideTextItems
* Extract slide text items.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Slide&#39;s index. (required) 
* @param  (Boolean) withEmpty  -  Include empty items. (optional) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns TextItemsResponse (Map)
*/
SlidesApi.prototype.GetSlidesSlideTextItems = function(name, slideIndex, withEmpty, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }    	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/textItems/?appSid={appSid}&amp;withEmpty={withEmpty}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof withEmpty !== 'undefined' &&  withEmpty !== null && withEmpty!== ''){            
			resourcePath = resourcePath.replace("{" + "withEmpty" + "}" , withEmpty);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]withEmpty.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesTheme
* Read slide theme info.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Slide&#39;s index. (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns ThemeResponse (Map)
*/
SlidesApi.prototype.GetSlidesTheme = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/theme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesThemeColorScheme
* Read slide theme color scheme info.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Slide&#39;s index. (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns ColorSchemeResponse (Map)
*/
SlidesApi.prototype.GetSlidesThemeColorScheme = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/theme/colorScheme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesThemeFontScheme
* Read slide theme font scheme info.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Slide&#39;s index. (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns FontSchemeResponse (Map)
*/
SlidesApi.prototype.GetSlidesThemeFontScheme = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/theme/fontScheme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesThemeFormatScheme
* Read slide theme color scheme info.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (String) slideIndex  -  Slide&#39;s index. (required) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns FormatSchemeResponse (Map)
*/
SlidesApi.prototype.GetSlidesThemeFormatScheme = function(name, slideIndex, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/theme/formatScheme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostSlidesSplit
* Splitting presentations. Create one image per slide.
*
* @param  (String) name  -  The document name. (required) 
* @param  (String) width  -  The width of created images. (optional) 
* @param  (String) height  -  The height of created images. (optional) 
* @param  (String) to  -  The last slide number for splitting, if is not specified splitting ends at the last slide of the document. (optional) 
* @param  (String) from  -  The start slide number for splitting, if is not specified splitting starts from the first slide of the presentation. (optional) 
* @param  (String) destFolder  -  Folder on storage where images are going to be uploaded. If not specified then images are uploaded to same folder as presentation. (optional) 
* @param  (String) format  -  The format. Default value is jpeg. (optional) 
* @param  (String) storage  -  The document storage. (optional) 
* @param  (String) folder  -  The document folder. (optional) 
* @returns SplitDocumentResponse (Map)
*/
SlidesApi.prototype.PostSlidesSplit = function(name, width, height, to, from, destFolder, format, storage, folder, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }         	
		
	var resourcePath = '/slides/{name}/split/?appSid={appSid}&amp;width={width}&amp;height={height}&amp;to={to}&amp;from={from}&amp;destFolder={destFolder}&amp;toFormat={toFormat}&amp;storage={storage}&amp;folder={folder}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof width !== 'undefined' &&  width !== null && width!== ''){            
			resourcePath = resourcePath.replace("{" + "width" + "}" , width);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]width.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof height !== 'undefined' &&  height !== null && height!== ''){            
			resourcePath = resourcePath.replace("{" + "height" + "}" , height);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]height.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof to !== 'undefined' &&  to !== null && to!== ''){            
			resourcePath = resourcePath.replace("{" + "to" + "}" , to);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]to.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof from !== 'undefined' &&  from !== null && from!== ''){            
			resourcePath = resourcePath.replace("{" + "from" + "}" , from);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]from.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof destFolder !== 'undefined' &&  destFolder !== null && destFolder!== ''){            
			resourcePath = resourcePath.replace("{" + "destFolder" + "}" , destFolder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]destFolder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof format !== 'undefined' &&  format !== null && format!== ''){            
			resourcePath = resourcePath.replace("{" + "format" + "}" , format);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]format.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetSlidesPresentationTextItems
* Extract presentation text items.
*
* @param  (String) name  -  Presentation name. (required) 
* @param  (Boolean) withEmpty  -  Incude empty items. (optional) 
* @param  (String) folder  -  Presentation folder. (optional) 
* @param  (String) storage  -  Presentation storage. (optional) 
* @returns TextItemsResponse (Map)
*/
SlidesApi.prototype.GetSlidesPresentationTextItems = function(name, withEmpty, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }    	
		
	var resourcePath = '/slides/{name}/textItems/?appSid={appSid}&amp;withEmpty={withEmpty}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof withEmpty !== 'undefined' &&  withEmpty !== null && withEmpty!== ''){            
			resourcePath = resourcePath.replace("{" + "withEmpty" + "}" , withEmpty);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]withEmpty.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }

/**
* GetSlidesDocumentProperty
* 
*
* @param  (String) name  -   (required) 
* @param  (String) propertyName  -   (required) 
* @param  (String) folder  -   (optional) 
* @param  (String) storage  -   (optional) 
* @returns DocumentPropertyResponse (Map)
*/
SlidesApi.prototype.GetSlidesDocumentProperty = function(name, propertyName, folder, storage, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof propertyName === 'undefined' || propertyName === null && propertyName === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/documentproperties/{propertyName}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof propertyName !== 'undefined' &&  propertyName !== null && propertyName!== ''){            
			resourcePath = resourcePath.replace("{" + "propertyName" + "}" , propertyName);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]propertyName.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }

  /**
* PostSlidesSaveAsHtml
* 
*
* @param  (String) name  -   (required) 
* @param  (String) password  -   (optional) 
* @param  (String) storage  -   (optional) 
* @param  (String) folder  -   (optional) 
* @param  (String) outPath  -   (optional) 
* @param  (HtmlExportOptions) body  -   (required) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.PostSlidesSaveAsHtml = function(name, password, storage, folder, outPath, body, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }     	
		
	var resourcePath = '/slides/{name}/saveAs/html/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof password !== 'undefined' &&  password !== null && password!== ''){            
			resourcePath = resourcePath.replace("{" + "password" + "}" , password);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]password.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof outPath !== 'undefined' &&  outPath !== null && outPath!== ''){            
			resourcePath = resourcePath.replace("{" + "outPath" + "}" , outPath);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]outPath.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = JSON.stringify(body);
    
	
	headerParams['Accept'] = 'application/xml,application/octet-stream'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }

/**
* PostSlidesSaveAsPdf
* 
*
* @param  (String) name  -   (required) 
* @param  (String) password  -   (optional) 
* @param  (String) storage  -   (optional) 
* @param  (String) folder  -   (optional) 
* @param  (String) outPath  -   (optional) 
* @param  (PdfExportOptions) body  -   (required) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.PostSlidesSaveAsPdf = function(name, password, storage, folder, outPath, body, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }     	
		
	var resourcePath = '/slides/{name}/saveAs/pdf/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof password !== 'undefined' &&  password !== null && password!== ''){            
			resourcePath = resourcePath.replace("{" + "password" + "}" , password);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]password.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof outPath !== 'undefined' &&  outPath !== null && outPath!== ''){            
			resourcePath = resourcePath.replace("{" + "outPath" + "}" , outPath);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]outPath.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = JSON.stringify(body);
    
	
	headerParams['Accept'] = 'application/xml,application/octet-stream'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* PostSlidesSaveAsTiff
* 
*
* @param  (String) name  -   (required) 
* @param  (String) password  -   (optional) 
* @param  (String) storage  -   (optional) 
* @param  (String) folder  -   (optional) 
* @param  (String) outPath  -   (optional) 
* @param  (TiffExportOptions) body  -   (required) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.PostSlidesSaveAsTiff = function(name, password, storage, folder, outPath, body, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    }     	
		
	var resourcePath = '/slides/{name}/saveAs/tiff/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof password !== 'undefined' &&  password !== null && password!== ''){            
			resourcePath = resourcePath.replace("{" + "password" + "}" , password);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]password.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof outPath !== 'undefined' &&  outPath !== null && outPath!== ''){            
			resourcePath = resourcePath.replace("{" + "outPath" + "}" , outPath);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]outPath.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = JSON.stringify(body);
    
	
	headerParams['Accept'] = 'application/xml,application/octet-stream'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }

/**
* PostAddNewShape
* 
*
* @param  (String) name  -   (required) 
* @param  (String) slideIndex  -   (required) 
* @param  (String) folder  -   (optional) 
* @param  (String) storage  -   (optional) 
* @param  (Shape) body  -   (required) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.PostAddNewShape = function(name, slideIndex, folder, storage, body, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    }   	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/shapes/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'POST'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = JSON.stringify(body);
    
	
	headerParams['Accept'] = 'application/json'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    
/**
* GetShapeWithFormat
* 
*
* @param  (String) name  -   (required) 
* @param  (String) slideIndex  -   (required) 
* @param  (String) shapeIndex  -   (required) 
* @param  (String) format  -   (required) 
* @param  (String) folder  -   (optional) 
* @param  (String) storage  -   (optional) 
* @param  (String) scaleX  -   (optional) 
* @param  (String) scaleY  -   (optional) 
* @param  (String) bounds  -   (optional) 
* @returns ResponseMessage (Map)
*/
SlidesApi.prototype.GetShapeWithFormat = function(name, slideIndex, shapeIndex, format, folder, storage, scaleX, scaleY, bounds, callback) {

    var self = this;
	
	if( typeof name === 'undefined' || name === null && name === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof slideIndex === 'undefined' || slideIndex === null && slideIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof shapeIndex === 'undefined' || shapeIndex === null && shapeIndex === ''){
		throw new Error('missing required parameters.');
    } 
	if( typeof format === 'undefined' || format === null && format === ''){
		throw new Error('missing required parameters.');
    }      	
		
	var resourcePath = '/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/?toFormat={toFormat}&amp;appSid={appSid}&amp;folder={folder}&amp;storage={storage}&amp;scaleX={scaleX}&amp;scaleY={scaleY}&amp;bounds={bounds}';
	
	resourcePath = resourcePath.replace(new RegExp('\\*', 'g'), "");
	resourcePath = resourcePath.replace(new RegExp('&amp;', 'g'), '&');
	resourcePath = resourcePath.replace('&amp;','&').replace("/?","?").replace("toFormat={toFormat}","format={format}").replace("{path}","{Path}");
	
	
	if(typeof name !== 'undefined' &&  name !== null && name!== ''){            
			resourcePath = resourcePath.replace("{" + "name" + "}" , name);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]name.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof slideIndex !== 'undefined' &&  slideIndex !== null && slideIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "slideIndex" + "}" , slideIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]slideIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof shapeIndex !== 'undefined' &&  shapeIndex !== null && shapeIndex!== ''){            
			resourcePath = resourcePath.replace("{" + "shapeIndex" + "}" , shapeIndex);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]shapeIndex.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof format !== 'undefined' &&  format !== null && format!== ''){            
			resourcePath = resourcePath.replace("{" + "format" + "}" , format);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]format.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof folder !== 'undefined' &&  folder !== null && folder!== ''){            
			resourcePath = resourcePath.replace("{" + "folder" + "}" , folder);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]folder.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof storage !== 'undefined' &&  storage !== null && storage!== ''){            
			resourcePath = resourcePath.replace("{" + "storage" + "}" , storage);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]storage.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof scaleX !== 'undefined' &&  scaleX !== null && scaleX!== ''){            
			resourcePath = resourcePath.replace("{" + "scaleX" + "}" , scaleX);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]scaleX.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof scaleY !== 'undefined' &&  scaleY !== null && scaleY!== ''){            
			resourcePath = resourcePath.replace("{" + "scaleY" + "}" , scaleY);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]scaleY.*?(?=&|\\?|$)', 'g'), "");
		}
	
	if(typeof bounds !== 'undefined' &&  bounds !== null && bounds!== ''){            
			resourcePath = resourcePath.replace("{" + "bounds" + "}" , bounds);
	}else{
		resourcePath = resourcePath.replace(new RegExp('[&?]bounds.*?(?=&|\\?|$)', 'g'), "");
		}
	
	
	if(this.config.debug){console.log('resourcePath :: ' + resourcePath);}
	
    method = 'GET'
    queryParams = {}
    headerParams = {}
    formParams = {}
    files = {}
	postData = null;
    
	
	headerParams['Accept'] = 'application/xml,application/octet-stream'
    headerParams['Content-Type'] = 'application/json'

	return apiClient.InvokeAPI(resourcePath, method, queryParams, postData, headerParams, files, callback);
  }
    

module.exports = SlidesApi


