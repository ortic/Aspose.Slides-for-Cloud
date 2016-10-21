  using System;
  using System.Collections.Generic;
  using System.Text.RegularExpressions;
  using Com.Aspose.Slides;
  using Com.Aspose.Slides.Model;
  namespace Com.Aspose.Slides.Api {
    public class SlidesApi {
      string basePath;
      private readonly ApiInvoker apiInvoker = ApiInvoker.GetInstance();

      public SlidesApi(String apiKey, String appSid, String basePath )
      {
	apiInvoker.apiKey = apiKey;
        apiInvoker.appSid = appSid;
        this.basePath = basePath;
      }

      public ApiInvoker getInvoker() {
        return apiInvoker;
      }

      // Sets the endpoint base url for the services being accessed
      public void setBasePath(string basePath) {
        this.basePath = basePath;
      }

      // Gets the endpoint base url for the services being accessed
      public String getBasePath() {
        return basePath;
      }

      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="password"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <returns></returns>
      public ResponseMessage GetSlidesDocument (string name, string password, string storage, string folder) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (password == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])password=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "password" + "}", apiInvoker.ToPathValue(password)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="format"></param>
      /// <param name="jpegQuality"></param>
      /// <param name="password"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <param name="outPath"></param>
      /// <returns></returns>
      public ResponseMessage GetSlidesDocumentWithFormat (string name, string format, string jpegQuality, string password, string storage, string folder, string outPath) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/?appSid={appSid}&amp;toFormat={toFormat}&amp;jpegQuality={jpegQuality}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || format == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (format == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])format=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "format" + "}", apiInvoker.ToPathValue(format)); 
		}
        if (jpegQuality == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])jpegQuality=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "jpegQuality" + "}", apiInvoker.ToPathValue(jpegQuality)); 
		}
        if (password == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])password=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "password" + "}", apiInvoker.ToPathValue(password)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (outPath == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])outPath=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "outPath" + "}", apiInvoker.ToPathValue(outPath)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="templatePath"></param>
      /// <param name="templateStorage"></param>
      /// <param name="isImageDataEmbeeded"></param>
      /// <param name="password"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <param name="file"></param>
      /// <returns></returns>
      public ResponseMessage PostSlidesDocument (string name, string templatePath, string templateStorage, bool? isImageDataEmbeeded, string password, string storage, string folder, byte[] file) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/?appSid={appSid}&amp;templatePath={templatePath}&amp;templateStorage={templateStorage}&amp;isImageDataEmbeeded={isImageDataEmbeeded}&amp;password={password}&amp;storage={storage}&amp;folder={folder}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || templatePath == null || file == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (templatePath == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])templatePath=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "templatePath" + "}", apiInvoker.ToPathValue(templatePath)); 
		}
        if (templateStorage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])templateStorage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "templateStorage" + "}", apiInvoker.ToPathValue(templateStorage)); 
		}
        if (isImageDataEmbeeded == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])isImageDataEmbeeded=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "isImageDataEmbeeded" + "}", apiInvoker.ToPathValue(isImageDataEmbeeded)); 
		}
        if (password == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])password=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "password" + "}", apiInvoker.ToPathValue(password)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (file != null){
         if(file is byte[]) {
		 
			 var docFile = new FileInfo();
             docFile.file = file;
             docFile.MimeType = "application/octet-stream";
             formParams.Add("file", docFile);
         } else {
           //string paramStr = (file is DateTime) ? ((DateTime)(object)file).ToString("u") : Convert.ToString(file);
		    string paramStr = Convert.ToString(file);
           formParams.Add("file", paramStr);
         }
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="width"></param>
      /// <param name="height"></param>
      /// <param name="to"></param>
      /// <param name="from"></param>
      /// <param name="destFolder"></param>
      /// <param name="format"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <returns></returns>
      public SplitDocumentResponse PostSlidesSplit (string name, int? width, int? height, int? to, int? from, string destFolder, string format, string storage, string folder) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/split/?appSid={appSid}&amp;width={width}&amp;height={height}&amp;to={to}&amp;from={from}&amp;destFolder={destFolder}&amp;toFormat={toFormat}&amp;storage={storage}&amp;folder={folder}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (width == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])width=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "width" + "}", apiInvoker.ToPathValue(width)); 
		}
        if (height == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])height=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "height" + "}", apiInvoker.ToPathValue(height)); 
		}
        if (to == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])to=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "to" + "}", apiInvoker.ToPathValue(to)); 
		}
        if (from == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])from=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "from" + "}", apiInvoker.ToPathValue(from)); 
		}
        if (destFolder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])destFolder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "destFolder" + "}", apiInvoker.ToPathValue(destFolder)); 
		}
        if (format == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])format=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "format" + "}", apiInvoker.ToPathValue(format)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        try {
          if (typeof(SplitDocumentResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (SplitDocumentResponse) ApiInvoker.deserialize(response, typeof(SplitDocumentResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SplitDocumentResponse) ApiInvoker.deserialize(response, typeof(SplitDocumentResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="password"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <param name="file"></param>
      /// <returns></returns>
      public ResponseMessage PutNewPresentation (string name, string password, string storage, string folder, byte[] file) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || file == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (password == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])password=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "password" + "}", apiInvoker.ToPathValue(password)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (file != null){
         if(file is byte[]) {
		 
			 var docFile = new FileInfo();
             docFile.file = file;
             docFile.MimeType = "application/octet-stream";
             formParams.Add("file", docFile);
         } else {
           //string paramStr = (file is DateTime) ? ((DateTime)(object)file).ToString("u") : Convert.ToString(file);
		    string paramStr = Convert.ToString(file);
           formParams.Add("file", paramStr);
         }
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            System.Diagnostics.Debug.WriteLine("response:"+response);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="templatePath"></param>
      /// <param name="templateStorage"></param>
      /// <param name="password"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <param name="file"></param>
      /// <returns></returns>
      public ResponseMessage PutNewPresentationFromStoredTemplate (string name, string templatePath, string templateStorage, string password, string storage, string folder, byte[] file) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/?appSid={appSid}&amp;templatePath={templatePath}&amp;templateStorage={templateStorage}&amp;password={password}&amp;storage={storage}&amp;folder={folder}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || templatePath == null || file == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (templatePath == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])templatePath=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "templatePath" + "}", apiInvoker.ToPathValue(templatePath)); 
		}
        if (templateStorage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])templateStorage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "templateStorage" + "}", apiInvoker.ToPathValue(templateStorage)); 
		}
        if (password == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])password=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "password" + "}", apiInvoker.ToPathValue(password)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (file != null){
         if(file is byte[]) {
		 
			 var docFile = new FileInfo();
             docFile.file = file;
             docFile.MimeType = "application/octet-stream";
             formParams.Add("file", docFile);
         } else {
           //string paramStr = (file is DateTime) ? ((DateTime)(object)file).ToString("u") : Convert.ToString(file);
		    string paramStr = Convert.ToString(file);
           formParams.Add("file", paramStr);
         }
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="password"></param>
      /// <param name="format"></param>
      /// <param name="outPath"></param>
      /// <param name="file"></param>
      /// <returns></returns>
      public ResponseMessage PutSlidesConvert (string password, string format, string outPath, byte[] file) {
        // create path and map variables
        var ResourcePath = "/slides/convert/?appSid={appSid}&amp;password={password}&amp;toFormat={toFormat}&amp;outPath={outPath}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (file == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (password == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])password=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "password" + "}", apiInvoker.ToPathValue(password)); 
		}
        if (format == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])format=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "format" + "}", apiInvoker.ToPathValue(format)); 
		}
        if (outPath == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])outPath=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "outPath" + "}", apiInvoker.ToPathValue(outPath)); 
		}
        if (file != null){
         if(file is byte[]) {
		 
			 var docFile = new FileInfo();
             docFile.file = file;
             docFile.MimeType = "application/octet-stream";
             formParams.Add("file", docFile);
         } else {
           //string paramStr = (file is DateTime) ? ((DateTime)(object)file).ToString("u") : Convert.ToString(file);
		    string paramStr = Convert.ToString(file);
           formParams.Add("file", paramStr);
         }
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="password"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <param name="file"></param>
      /// <returns></returns>
      public ResponseMessage PutSlidesDocumentFromHtml (string name, string password, string storage, string folder, byte[] file) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/fromHtml/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || file == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (password == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])password=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "password" + "}", apiInvoker.ToPathValue(password)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (file != null){
         if(file is byte[]) {
		 
			 var docFile = new FileInfo();
             docFile.file = file;
             docFile.MimeType = "application/octet-stream";
             formParams.Add("file", docFile);
         } else {
           //string paramStr = (file is DateTime) ? ((DateTime)(object)file).ToString("u") : Convert.ToString(file);
		    string paramStr = Convert.ToString(file);
           formParams.Add("file", paramStr);
         }
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="password"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <param name="outPath"></param>
      /// <param name="body"></param>
      /// <returns></returns>
      public ResponseMessage PostSlidesSaveAsHtml (string name, string password, string storage, string folder, string outPath, HtmlExportOptions body) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/saveAs/html/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || body == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (password == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])password=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "password" + "}", apiInvoker.ToPathValue(password)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (outPath == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])outPath=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "outPath" + "}", apiInvoker.ToPathValue(outPath)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, body, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="password"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <param name="outPath"></param>
      /// <param name="body"></param>
      /// <returns></returns>
      public ResponseMessage PostSlidesSaveAsPdf (string name, string password, string storage, string folder, string outPath, PdfExportOptions body) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/saveAs/pdf/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || body == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (password == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])password=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "password" + "}", apiInvoker.ToPathValue(password)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (outPath == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])outPath=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "outPath" + "}", apiInvoker.ToPathValue(outPath)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, body, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="password"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <param name="outPath"></param>
      /// <param name="body"></param>
      /// <returns></returns>
      public ResponseMessage PostSlidesSaveAsTiff (string name, string password, string storage, string folder, string outPath, TiffExportOptions body) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/saveAs/tiff/?appSid={appSid}&amp;password={password}&amp;storage={storage}&amp;folder={folder}&amp;outPath={outPath}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || body == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (password == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])password=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "password" + "}", apiInvoker.ToPathValue(password)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (outPath == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])outPath=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "outPath" + "}", apiInvoker.ToPathValue(outPath)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, body, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public ImagesResponse GetSlidesImages (string name, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/images/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ImagesResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ImagesResponse) ApiInvoker.deserialize(response, typeof(ImagesResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ImagesResponse) ApiInvoker.deserialize(response, typeof(ImagesResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public ImagesResponse GetSlidesSlideImages (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/images/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ImagesResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ImagesResponse) ApiInvoker.deserialize(response, typeof(ImagesResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ImagesResponse) ApiInvoker.deserialize(response, typeof(ImagesResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <param name="body"></param>
      /// <returns></returns>
      public DocumentResponse PostPresentationMerge (string name, string storage, string folder, PresentationsMergeRequest body) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/merge/?appSid={appSid}&amp;storage={storage}&amp;folder={folder}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || body == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        try {
          if (typeof(DocumentResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (DocumentResponse) ApiInvoker.deserialize(response, typeof(DocumentResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, body, headerParams, formParams);
            if(response != null){
               return (DocumentResponse) ApiInvoker.deserialize(response, typeof(DocumentResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="storage"></param>
      /// <param name="folder"></param>
      /// <param name="body"></param>
      /// <returns></returns>
      public DocumentResponse PutPresentationMerge (string name, string storage, string folder, OrderedMergeRequest body) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/merge/?appSid={appSid}&amp;storage={storage}&amp;folder={folder}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || body == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        try {
          if (typeof(DocumentResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            return (DocumentResponse) ApiInvoker.deserialize(response, typeof(DocumentResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "PUT", queryParams, body, headerParams, formParams);
            if(response != null){
               return (DocumentResponse) ApiInvoker.deserialize(response, typeof(DocumentResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="placeholderIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public PlaceholderResponse GetSlidesPlaceholder (string name, int? slideIndex, int? placeholderIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/placeholders/{placeholderIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || placeholderIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (placeholderIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])placeholderIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "placeholderIndex" + "}", apiInvoker.ToPathValue(placeholderIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(PlaceholderResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (PlaceholderResponse) ApiInvoker.deserialize(response, typeof(PlaceholderResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (PlaceholderResponse) ApiInvoker.deserialize(response, typeof(PlaceholderResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public PlaceholdersResponse GetSlidesPlaceholders (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/placeholders/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(PlaceholdersResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (PlaceholdersResponse) ApiInvoker.deserialize(response, typeof(PlaceholdersResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (PlaceholdersResponse) ApiInvoker.deserialize(response, typeof(PlaceholdersResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public DocumentPropertiesResponse DeleteSlidesDocumentProperties (string name, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/documentproperties/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(DocumentPropertiesResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "DELETE", queryParams, null, headerParams, formParams);
            return (DocumentPropertiesResponse) ApiInvoker.deserialize(response, typeof(DocumentPropertiesResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "DELETE", queryParams, null, headerParams, formParams);
            if(response != null){
               return (DocumentPropertiesResponse) ApiInvoker.deserialize(response, typeof(DocumentPropertiesResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="propertyName"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public CommonResponse DeleteSlidesDocumentProperty (string name, string propertyName, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/documentproperties/{propertyName}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || propertyName == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (propertyName == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])propertyName=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "propertyName" + "}", apiInvoker.ToPathValue(propertyName)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(CommonResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "DELETE", queryParams, null, headerParams, formParams);
            return (CommonResponse) ApiInvoker.deserialize(response, typeof(CommonResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "DELETE", queryParams, null, headerParams, formParams);
            if(response != null){
               return (CommonResponse) ApiInvoker.deserialize(response, typeof(CommonResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public DocumentPropertiesResponse GetSlidesDocumentProperties (string name, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/documentproperties/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(DocumentPropertiesResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (DocumentPropertiesResponse) ApiInvoker.deserialize(response, typeof(DocumentPropertiesResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (DocumentPropertiesResponse) ApiInvoker.deserialize(response, typeof(DocumentPropertiesResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="propertyName"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public DocumentPropertyResponse GetSlidesDocumentProperty (string name, string propertyName, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/documentproperties/{propertyName}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || propertyName == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (propertyName == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])propertyName=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "propertyName" + "}", apiInvoker.ToPathValue(propertyName)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(DocumentPropertyResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (DocumentPropertyResponse) ApiInvoker.deserialize(response, typeof(DocumentPropertyResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (DocumentPropertyResponse) ApiInvoker.deserialize(response, typeof(DocumentPropertyResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <param name="body"></param>
      /// <returns></returns>
      public DocumentPropertiesResponse PostSlidesSetDocumentProperties (string name, string folder, string storage, DocumentProperties body) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/documentproperties/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || body == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(DocumentPropertiesResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (DocumentPropertiesResponse) ApiInvoker.deserialize(response, typeof(DocumentPropertiesResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, body, headerParams, formParams);
            if(response != null){
               return (DocumentPropertiesResponse) ApiInvoker.deserialize(response, typeof(DocumentPropertiesResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="propertyName"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <param name="body"></param>
      /// <returns></returns>
      public DocumentPropertyResponse PutSlidesSetDocumentProperty (string name, string propertyName, string folder, string storage, DocumentProperty body) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/documentproperties/{propertyName}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || propertyName == null || body == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (propertyName == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])propertyName=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "propertyName" + "}", apiInvoker.ToPathValue(propertyName)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(DocumentPropertyResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            return (DocumentPropertyResponse) ApiInvoker.deserialize(response, typeof(DocumentPropertyResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "PUT", queryParams, body, headerParams, formParams);
            if(response != null){
               return (DocumentPropertyResponse) ApiInvoker.deserialize(response, typeof(DocumentPropertyResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="shapeIndex"></param>
      /// <param name="paragraphIndex"></param>
      /// <param name="portionIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public ResponseMessage GetParagraphPortion (string name, int? slideIndex, int? shapeIndex, int? paragraphIndex, int? portionIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}/portions/{portionIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || shapeIndex == null || paragraphIndex == null || portionIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (shapeIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])shapeIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "shapeIndex" + "}", apiInvoker.ToPathValue(shapeIndex)); 
		}
        if (paragraphIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])paragraphIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "paragraphIndex" + "}", apiInvoker.ToPathValue(paragraphIndex)); 
		}
        if (portionIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])portionIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "portionIndex" + "}", apiInvoker.ToPathValue(portionIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="shapeIndex"></param>
      /// <param name="paragraphIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public ResponseMessage GetShapeParagraph (string name, int? slideIndex, int? shapeIndex, int? paragraphIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || shapeIndex == null || paragraphIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (shapeIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])shapeIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "shapeIndex" + "}", apiInvoker.ToPathValue(shapeIndex)); 
		}
        if (paragraphIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])paragraphIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "paragraphIndex" + "}", apiInvoker.ToPathValue(paragraphIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="shapeIndex"></param>
      /// <param name="format"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <param name="scaleX"></param>
      /// <param name="scaleY"></param>
      /// <param name="bounds"></param>
      /// <returns></returns>
      public ResponseMessage GetShapeWithFormat (string name, int? slideIndex, int? shapeIndex, string format, string folder, string storage, float? scaleX, float? scaleY, string bounds) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/?toFormat={toFormat}&amp;appSid={appSid}&amp;folder={folder}&amp;storage={storage}&amp;scaleX={scaleX}&amp;scaleY={scaleY}&amp;bounds={bounds}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || shapeIndex == null || format == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (shapeIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])shapeIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "shapeIndex" + "}", apiInvoker.ToPathValue(shapeIndex)); 
		}
        if (format == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])format=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "format" + "}", apiInvoker.ToPathValue(format)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        if (scaleX == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])scaleX=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "scaleX" + "}", apiInvoker.ToPathValue(scaleX)); 
		}
        if (scaleY == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])scaleY=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "scaleY" + "}", apiInvoker.ToPathValue(scaleY)); 
		}
        if (bounds == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])bounds=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "bounds" + "}", apiInvoker.ToPathValue(bounds)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="shapeIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public ResponseMessage GetSlideShapeParagraphs (string name, int? slideIndex, int? shapeIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || shapeIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (shapeIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])shapeIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "shapeIndex" + "}", apiInvoker.ToPathValue(shapeIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public ResponseMessage GetSlidesSlideShapes (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/shapes/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="shapePath"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public ResponseMessage GetSlidesSlideShapesParent (string name, int? slideIndex, string shapePath, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapePath}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || shapePath == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (shapePath == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])shapePath=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "shapePath" + "}", apiInvoker.ToPathValue(shapePath)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <param name="body"></param>
      /// <returns></returns>
      public ResponseMessage PostAddNewShape (string name, int? slideIndex, string folder, string storage, Shape body) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/shapes/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || body == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, body, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="shapeIndex"></param>
      /// <param name="paragraphIndex"></param>
      /// <param name="portionIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <param name="body"></param>
      /// <returns></returns>
      public ResponseMessage PutSetParagraphPortionProperties (string name, int? slideIndex, int? shapeIndex, int? paragraphIndex, int? portionIndex, string folder, string storage, Portion body) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}/portions/{portionIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || shapeIndex == null || paragraphIndex == null || portionIndex == null || body == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (shapeIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])shapeIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "shapeIndex" + "}", apiInvoker.ToPathValue(shapeIndex)); 
		}
        if (paragraphIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])paragraphIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "paragraphIndex" + "}", apiInvoker.ToPathValue(paragraphIndex)); 
		}
        if (portionIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])portionIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "portionIndex" + "}", apiInvoker.ToPathValue(portionIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "PUT", queryParams, body, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="shapePath"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <param name="body"></param>
      /// <returns></returns>
      public ResponseMessage PutSlideShapeInfo (string name, int? slideIndex, string shapePath, string folder, string storage, Shape body) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/shapes/{shapePath}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || shapePath == null || body == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (shapePath == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])shapePath=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "shapePath" + "}", apiInvoker.ToPathValue(shapePath)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "PUT", queryParams, body, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideListResponse DeleteSlideByIndex (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideListResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "DELETE", queryParams, null, headerParams, formParams);
            return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "DELETE", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideListResponse DeleteSlidesCleanSlidesList (string name, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideListResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "DELETE", queryParams, null, headerParams, formParams);
            return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "DELETE", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideBackgroundResponse DeleteSlidesSlideBackground (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/background/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideBackgroundResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "DELETE", queryParams, null, headerParams, formParams);
            return (SlideBackgroundResponse) ApiInvoker.deserialize(response, typeof(SlideBackgroundResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "DELETE", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideBackgroundResponse) ApiInvoker.deserialize(response, typeof(SlideBackgroundResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public ResponseMessage GetSlidesSlide (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideBackgroundResponse GetSlidesSlideBackground (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/background/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideBackgroundResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (SlideBackgroundResponse) ApiInvoker.deserialize(response, typeof(SlideBackgroundResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideBackgroundResponse) ApiInvoker.deserialize(response, typeof(SlideBackgroundResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideCommentsResponse GetSlidesSlideComments (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/comments/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideCommentsResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (SlideCommentsResponse) ApiInvoker.deserialize(response, typeof(SlideCommentsResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideCommentsResponse) ApiInvoker.deserialize(response, typeof(SlideCommentsResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideListResponse GetSlidesSlidesList (string name, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideListResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="format"></param>
      /// <param name="width"></param>
      /// <param name="height"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public ResponseMessage GetSlideWithFormat (string name, int? slideIndex, string format, int? width, int? height, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/?appSid={appSid}&amp;toFormat={toFormat}&amp;width={width}&amp;height={height}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || format == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (format == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])format=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "format" + "}", apiInvoker.ToPathValue(format)); 
		}
        if (width == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])width=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "width" + "}", apiInvoker.ToPathValue(width)); 
		}
        if (height == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])height=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "height" + "}", apiInvoker.ToPathValue(height)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ResponseMessage) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ResponseMessage) ApiInvoker.deserialize(response, typeof(ResponseMessage));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideListResponse PostAddEmptySlide (string name, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideListResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="position"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideListResponse PostAddEmptySlideAtPosition (string name, int? position, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;position={position}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || position == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (position == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])position=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "position" + "}", apiInvoker.ToPathValue(position)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideListResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideToClone"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideListResponse PostAddSlideCopy (string name, int? slideToClone, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;slideToClone={slideToClone}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideToClone == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideToClone == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideToClone=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideToClone" + "}", apiInvoker.ToPathValue(slideToClone)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideListResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="position"></param>
      /// <param name="slideToClone"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideListResponse PostClonePresentationSlide (string name, int? position, int? slideToClone, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;position={position}&amp;slideToClone={slideToClone}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || position == null || slideToClone == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (position == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])position=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "position" + "}", apiInvoker.ToPathValue(position)); 
		}
        if (slideToClone == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideToClone=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideToClone" + "}", apiInvoker.ToPathValue(slideToClone)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideListResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideToCopy"></param>
      /// <param name="source"></param>
      /// <param name="position"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideListResponse PostCopySlideFromSourcePresentation (string name, int? slideToCopy, string source, int? position, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;slideToCopy={slideToCopy}&amp;source={source}&amp;position={position}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideToCopy == null || source == null || position == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideToCopy == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideToCopy=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideToCopy" + "}", apiInvoker.ToPathValue(slideToCopy)); 
		}
        if (source == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])source=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "source" + "}", apiInvoker.ToPathValue(source)); 
		}
        if (position == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])position=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "position" + "}", apiInvoker.ToPathValue(position)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideListResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="oldPosition"></param>
      /// <param name="newPosition"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideListResponse PostSlidesReorderPosition (string name, int? oldPosition, int? newPosition, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/?appSid={appSid}&amp;oldPosition={oldPosition}&amp;newPosition={newPosition}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || oldPosition == null || newPosition == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (oldPosition == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])oldPosition=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "oldPosition" + "}", apiInvoker.ToPathValue(oldPosition)); 
		}
        if (newPosition == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])newPosition=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "newPosition" + "}", apiInvoker.ToPathValue(newPosition)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideListResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideListResponse) ApiInvoker.deserialize(response, typeof(SlideListResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <param name="body"></param>
      /// <returns></returns>
      public SlideBackgroundResponse PutSlidesSlideBackground (string name, int? slideIndex, string folder, string storage, string body) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/background/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || body == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideBackgroundResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "PUT", queryParams, null, headerParams, formParams);
            return (SlideBackgroundResponse) ApiInvoker.deserialize(response, typeof(SlideBackgroundResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "PUT", queryParams, body, headerParams, formParams);
            if(response != null){
               return (SlideBackgroundResponse) ApiInvoker.deserialize(response, typeof(SlideBackgroundResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="withEmpty"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public TextItemsResponse GetSlidesPresentationTextItems (string name, bool? withEmpty, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/textItems/?appSid={appSid}&amp;withEmpty={withEmpty}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (withEmpty == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])withEmpty=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "withEmpty" + "}", apiInvoker.ToPathValue(withEmpty)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(TextItemsResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (TextItemsResponse) ApiInvoker.deserialize(response, typeof(TextItemsResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (TextItemsResponse) ApiInvoker.deserialize(response, typeof(TextItemsResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="withEmpty"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public TextItemsResponse GetSlidesSlideTextItems (string name, int? slideIndex, bool? withEmpty, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/textItems/?appSid={appSid}&amp;withEmpty={withEmpty}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (withEmpty == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])withEmpty=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "withEmpty" + "}", apiInvoker.ToPathValue(withEmpty)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(TextItemsResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (TextItemsResponse) ApiInvoker.deserialize(response, typeof(TextItemsResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (TextItemsResponse) ApiInvoker.deserialize(response, typeof(TextItemsResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="oldValue"></param>
      /// <param name="newValue"></param>
      /// <param name="ignoreCase"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public PresentationStringReplaceResponse PostSlidesPresentationReplaceText (string name, string oldValue, string newValue, bool? ignoreCase, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/replaceText/?oldValue={oldValue}&amp;newValue={newValue}&amp;appSid={appSid}&amp;ignoreCase={ignoreCase}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || oldValue == null || newValue == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (oldValue == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])oldValue=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "oldValue" + "}", apiInvoker.ToPathValue(oldValue)); 
		}
        if (newValue == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])newValue=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "newValue" + "}", apiInvoker.ToPathValue(newValue)); 
		}
        if (ignoreCase == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])ignoreCase=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "ignoreCase" + "}", apiInvoker.ToPathValue(ignoreCase)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(PresentationStringReplaceResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (PresentationStringReplaceResponse) ApiInvoker.deserialize(response, typeof(PresentationStringReplaceResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            if(response != null){
               return (PresentationStringReplaceResponse) ApiInvoker.deserialize(response, typeof(PresentationStringReplaceResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="oldValue"></param>
      /// <param name="newValue"></param>
      /// <param name="ignoreCase"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public SlideStringReplaceResponse PostSlidesSlideReplaceText (string name, int? slideIndex, string oldValue, string newValue, bool? ignoreCase, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/replaceText/?oldValue={oldValue}&amp;newValue={newValue}&amp;appSid={appSid}&amp;ignoreCase={ignoreCase}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null || oldValue == null || newValue == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (oldValue == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])oldValue=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "oldValue" + "}", apiInvoker.ToPathValue(oldValue)); 
		}
        if (newValue == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])newValue=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "newValue" + "}", apiInvoker.ToPathValue(newValue)); 
		}
        if (ignoreCase == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])ignoreCase=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "ignoreCase" + "}", apiInvoker.ToPathValue(ignoreCase)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(SlideStringReplaceResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            return (SlideStringReplaceResponse) ApiInvoker.deserialize(response, typeof(SlideStringReplaceResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "POST", queryParams, null, headerParams, formParams);
            if(response != null){
               return (SlideStringReplaceResponse) ApiInvoker.deserialize(response, typeof(SlideStringReplaceResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public ThemeResponse GetSlidesTheme (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/theme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ThemeResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ThemeResponse) ApiInvoker.deserialize(response, typeof(ThemeResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ThemeResponse) ApiInvoker.deserialize(response, typeof(ThemeResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public ColorSchemeResponse GetSlidesThemeColorScheme (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/theme/colorScheme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(ColorSchemeResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (ColorSchemeResponse) ApiInvoker.deserialize(response, typeof(ColorSchemeResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (ColorSchemeResponse) ApiInvoker.deserialize(response, typeof(ColorSchemeResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public FontSchemeResponse GetSlidesThemeFontScheme (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/theme/fontScheme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(FontSchemeResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (FontSchemeResponse) ApiInvoker.deserialize(response, typeof(FontSchemeResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (FontSchemeResponse) ApiInvoker.deserialize(response, typeof(FontSchemeResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      /// <summary>
      ///  
      /// </summary>
      /// <param name="name"></param>
      /// <param name="slideIndex"></param>
      /// <param name="folder"></param>
      /// <param name="storage"></param>
      /// <returns></returns>
      public FormatSchemeResponse GetSlidesThemeFormatScheme (string name, int? slideIndex, string folder, string storage) {
        // create path and map variables
        var ResourcePath = "/slides/{name}/slides/{slideIndex}/theme/FormatScheme/?appSid={appSid}&amp;folder={folder}&amp;storage={storage}".Replace("{format}","json");
		ResourcePath = Regex.Replace(ResourcePath, "\\*", "").Replace("&amp;", "&").Replace("/?", "?").Replace("toFormat={toFormat}", "format={format}");

        // query params
        var queryParams = new Dictionary<String, String>();
        var headerParams = new Dictionary<String, String>();
        var formParams = new Dictionary<String, object>();

        // verify required params are set
        if (name == null || slideIndex == null ) {
           throw new ApiException(400, "missing required params");
        }
        if (name == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])name=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "name" + "}", apiInvoker.ToPathValue(name)); 
		}
        if (slideIndex == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])slideIndex=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "slideIndex" + "}", apiInvoker.ToPathValue(slideIndex)); 
		}
        if (folder == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])folder=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "folder" + "}", apiInvoker.ToPathValue(folder)); 
		}
        if (storage == null){
		  ResourcePath = Regex.Replace(ResourcePath, @"([&?])storage=", "");
		}else{
		  ResourcePath = ResourcePath.Replace("{" + "storage" + "}", apiInvoker.ToPathValue(storage)); 
		}
        try {
          if (typeof(FormatSchemeResponse) == typeof(ResponseMessage)) {
            var response = apiInvoker.invokeBinaryAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            return (FormatSchemeResponse) ApiInvoker.deserialize(response, typeof(FormatSchemeResponse));
          } else {
            var response = apiInvoker.invokeAPI(basePath, ResourcePath, "GET", queryParams, null, headerParams, formParams);
            if(response != null){
               return (FormatSchemeResponse) ApiInvoker.deserialize(response, typeof(FormatSchemeResponse));
            }
            else {
              return null;
            }
          }
        } catch (ApiException ex) {
          if(ex.ErrorCode == 404) {
          	return null;
          }
          else {
            throw ex;
          }
        }
      }
      }
    }
