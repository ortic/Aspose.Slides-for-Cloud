package com.aspose.storage.api;

import com.aspose.storage.client.ApiException;
import com.aspose.storage.client.ApiInvoker;
import com.aspose.storage.client.ApiInvokerResponse;
import com.aspose.storage.model.DiscUsageResponse;
import com.aspose.storage.model.ResponseMessage;
import com.aspose.storage.model.RemoveFolderResponse;
import com.aspose.storage.model.FileExistResponse;
import com.aspose.storage.model.MoveFolderResponse;
import com.aspose.storage.model.StorageExistResponse;
import com.aspose.storage.model.RemoveFileResponse;
import com.aspose.storage.model.FileVersionsResponse;
import com.aspose.storage.model.MoveFileResponse;
import com.sun.jersey.multipart.FormDataMultiPart;

import javax.ws.rs.core.MediaType;

import java.io.File;
import java.util.*;

public class StorageApi {
  String basePath = "http://api.aspose.cloud/v1.1";
  ApiInvoker apiInvoker = ApiInvoker.getInstance();
  ApiInvokerResponse response = null;

  public StorageApi(String basePath, String apiKey, String appSid) {
    this.basePath = basePath;
    apiInvoker.addDefaultHeader(apiInvoker.API_KEY, apiKey);
    apiInvoker.addDefaultHeader(apiInvoker.APP_SID, appSid);
  }

  public StorageApi(String basePath, String apiKey, String appSid, boolean isDebug) {
          this.basePath = basePath;
          apiInvoker.addDefaultHeader(apiInvoker.API_KEY, apiKey);
          apiInvoker.addDefaultHeader(apiInvoker.APP_SID, appSid);
          if(isDebug)
                  apiInvoker.enableDebug();
        }
  
  public StorageApi(String apiKey, String appSid) {
    apiInvoker.addDefaultHeader(apiInvoker.API_KEY, apiKey);
    apiInvoker.addDefaultHeader(apiInvoker.APP_SID, appSid);
  }

  public StorageApi(String apiKey, String appSid, boolean isDebug) {
          apiInvoker.addDefaultHeader(apiInvoker.API_KEY, apiKey);
          apiInvoker.addDefaultHeader(apiInvoker.APP_SID, appSid);
          if(isDebug)
                  apiInvoker.enableDebug();
        }

  public ApiInvoker getInvoker() {
    return apiInvoker;
  }
  
  public void setBasePath(String basePath) {
    this.basePath = basePath;
  }
  
  public String getBasePath() {
    return basePath;
  }

  /**
	* DeleteFile
	* Remove a specific file. Parameters: path - file path e.g. /file.ext, versionID - file's version, storage - user's storage name.
	* @param Path	String	
	* @param versionId	String	
	* @param storage	String	
	* @return RemoveFileResponse
	*/

  public RemoveFileResponse DeleteFile (String Path, String versionId, String storage) {
    Object postBody = null;
    // verify required params are set
    if(Path == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/file/{Path}/?appSid={appSid}&amp;versionId={versionId}&amp;storage={storage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(Path!=null)
	  resourcePath = resourcePath.replace("{" + "Path" + "}" , apiInvoker.toPathValue(Path));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]Path.*?(?=&|\\?|$)", "");
    if(versionId!=null)
	  resourcePath = resourcePath.replace("{" + "versionId" + "}" , apiInvoker.toPathValue(versionId));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]versionId.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "DELETE", queryParams, postBody, headerParams, formParams, contentType);
		return (RemoveFileResponse) ApiInvoker.deserialize(response, "", RemoveFileResponse.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* GetDiscUsage
	* Check the disk usage of the current account. Parameters: storage - user's storage name.
	* @param storage	String	
	* @return DiscUsageResponse
	*/

  public DiscUsageResponse GetDiscUsage (String storage) {
    Object postBody = null;
    // create path and map variables
    String resourcePath = "/storage/disc/?appSid={appSid}&amp;storage={storage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "GET", queryParams, postBody, headerParams, formParams, contentType);
		return (DiscUsageResponse) ApiInvoker.deserialize(response, "", DiscUsageResponse.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* GetDownload
	* Download a specific file. Parameters: path - file path e.g. /file.ext, versionID - file's version, storage - user's storage name.
	* @param Path	String	
	* @param versionId	String	
	* @param storage	String	
	* @return ResponseMessage
	*/

  public ResponseMessage GetDownload (String Path, String versionId, String storage) {
    Object postBody = null;
    // verify required params are set
    if(Path == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/file/{Path}/?appSid={appSid}&amp;versionId={versionId}&amp;storage={storage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(Path!=null)
	  resourcePath = resourcePath.replace("{" + "Path" + "}" , apiInvoker.toPathValue(Path));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]Path.*?(?=&|\\?|$)", "");
    if(versionId!=null)
	  resourcePath = resourcePath.replace("{" + "versionId" + "}" , apiInvoker.toPathValue(versionId));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]versionId.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "GET", queryParams, postBody, headerParams, formParams, contentType);
		return (ResponseMessage) ApiInvoker.deserialize(response, "", ResponseMessage.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* GetIsExist
	* Check if a specific file or folder exists. Parameters: path - file or folder path e.g. /file.ext or /Folder1, versionID - file's version, storage - user's storage name.
	* @param Path	String	
	* @param versionId	String	
	* @param storage	String	
	* @return FileExistResponse
	*/

  public FileExistResponse GetIsExist (String Path, String versionId, String storage) {
    Object postBody = null;
    // verify required params are set
    if(Path == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/exist/{Path}/?appSid={appSid}&amp;versionId={versionId}&amp;storage={storage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(Path!=null)
	  resourcePath = resourcePath.replace("{" + "Path" + "}" , apiInvoker.toPathValue(Path));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]Path.*?(?=&|\\?|$)", "");
    if(versionId!=null)
	  resourcePath = resourcePath.replace("{" + "versionId" + "}" , apiInvoker.toPathValue(versionId));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]versionId.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "GET", queryParams, postBody, headerParams, formParams, contentType);
		return (FileExistResponse) ApiInvoker.deserialize(response, "", FileExistResponse.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* GetListFileVersions
	* Get the file's versions list. Parameters: path - file path e.g. /file.ext or /Folder1/file.ext, storage - user's storage name.
	* @param Path	String	
	* @param storage	String	
	* @return FileVersionsResponse
	*/

  public FileVersionsResponse GetListFileVersions (String Path, String storage) {
    Object postBody = null;
    // verify required params are set
    if(Path == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/version/{Path}/?appSid={appSid}&amp;storage={storage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(Path!=null)
	  resourcePath = resourcePath.replace("{" + "Path" + "}" , apiInvoker.toPathValue(Path));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]Path.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "GET", queryParams, postBody, headerParams, formParams, contentType);
		return (FileVersionsResponse) ApiInvoker.deserialize(response, "", FileVersionsResponse.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* PostMoveFile
	* Move a specific file.
	* @param src	String	source file path e.g. /file.ext
	* @param dest	String	
	* @param versionId	String	source file's version,
	* @param storage	String	user's source storage name
	* @param destStorage	String	user's destination storage name
	* @return MoveFileResponse
	*/

  public MoveFileResponse PostMoveFile (String src, String dest, String versionId, String storage, String destStorage) {
    Object postBody = null;
    // verify required params are set
    if(src == null || dest == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/file/{src}/?dest={dest}&amp;appSid={appSid}&amp;versionId={versionId}&amp;storage={storage}&amp;destStorage={destStorage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(src!=null)
	  resourcePath = resourcePath.replace("{" + "src" + "}" , apiInvoker.toPathValue(src));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]src.*?(?=&|\\?|$)", "");
    if(dest!=null)
	  resourcePath = resourcePath.replace("{" + "dest" + "}" , apiInvoker.toPathValue(dest));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]dest.*?(?=&|\\?|$)", "");
    if(versionId!=null)
	  resourcePath = resourcePath.replace("{" + "versionId" + "}" , apiInvoker.toPathValue(versionId));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]versionId.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    if(destStorage!=null)
	  resourcePath = resourcePath.replace("{" + "destStorage" + "}" , apiInvoker.toPathValue(destStorage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]destStorage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "POST", queryParams, postBody, headerParams, formParams, contentType);
		return (MoveFileResponse) ApiInvoker.deserialize(response, "", MoveFileResponse.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* PutCopy
	* Copy a specific file. Parameters: path - source file path e.g. /file.ext, versionID - source file's version, storage - user's source storage name, newdest - destination file path, destStorage - user's destination storage name.
	* @param Path	String	
	* @param newdest	String	
	* @param versionId	String	
	* @param storage	String	
	* @param destStorage	String	
	* @param file	File	
	* @return ResponseMessage
	*/

  public ResponseMessage PutCopy (String Path, String newdest, String versionId, String storage, String destStorage, File file) {
    Object postBody = null;
    // verify required params are set
    if(Path == null || newdest == null || file == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/file/{Path}/?appSid={appSid}&amp;newdest={newdest}&amp;versionId={versionId}&amp;storage={storage}&amp;destStorage={destStorage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(Path!=null)
	  resourcePath = resourcePath.replace("{" + "Path" + "}" , apiInvoker.toPathValue(Path));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]Path.*?(?=&|\\?|$)", "");
    if(newdest!=null)
	  resourcePath = resourcePath.replace("{" + "newdest" + "}" , apiInvoker.toPathValue(newdest));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]newdest.*?(?=&|\\?|$)", "");
    if(versionId!=null)
	  resourcePath = resourcePath.replace("{" + "versionId" + "}" , apiInvoker.toPathValue(versionId));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]versionId.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    if(destStorage!=null)
	  resourcePath = resourcePath.replace("{" + "destStorage" + "}" , apiInvoker.toPathValue(destStorage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]destStorage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "multipart/form-data"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

if(contentType.startsWith("multipart/form-data")) {
      FormDataMultiPart mp = new FormDataMultiPart();
      mp.field("file", file, MediaType.MULTIPART_FORM_DATA_TYPE);
        postBody = mp;
    }
try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "PUT", queryParams, postBody, headerParams, formParams, contentType);
		return (ResponseMessage) ApiInvoker.deserialize(response, "", ResponseMessage.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* PutCreate
	* Upload a specific file. Parameters: path - source file path e.g. /file.ext, versionID - source file's version, storage - user's source storage name, newdest - destination file path, destStorage - user's destination storage name.
	* @param Path	String	
	* @param versionId	String	
	* @param storage	String	
	* @param file	File	
	* @return ResponseMessage
	*/

  public ResponseMessage PutCreate (String Path, String versionId, String storage, File file) {
    Object postBody = null;
    // verify required params are set
    if(Path == null || file == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/file/{Path}/?appSid={appSid}&amp;versionId={versionId}&amp;storage={storage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(Path!=null)
	  resourcePath = resourcePath.replace("{" + "Path" + "}" , apiInvoker.toPathValue(Path));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]Path.*?(?=&|\\?|$)", "");
    if(versionId!=null)
	  resourcePath = resourcePath.replace("{" + "versionId" + "}" , apiInvoker.toPathValue(versionId));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]versionId.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "multipart/form-data"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

if(contentType.startsWith("multipart/form-data")) {
      FormDataMultiPart mp = new FormDataMultiPart();
      mp.field("file", file, MediaType.MULTIPART_FORM_DATA_TYPE);
        postBody = mp;
    }
try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "PUT", queryParams, postBody, headerParams, formParams, contentType);
		return (ResponseMessage) ApiInvoker.deserialize(response, "", ResponseMessage.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* DeleteFolder
	* Remove a specific folder. Parameters: path - folder path e.g. /Folder1, storage - user's storage name, recursive - is subfolders and files must be deleted for specified path.
	* @param Path	String	
	* @param storage	String	
	* @param recursive	Boolean	
	* @return RemoveFolderResponse
	*/

  public RemoveFolderResponse DeleteFolder (String Path, String storage, Boolean recursive) {
    Object postBody = null;
    // verify required params are set
    if(Path == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/folder/{Path}/?appSid={appSid}&amp;storage={storage}&amp;recursive={recursive}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(Path!=null)
	  resourcePath = resourcePath.replace("{" + "Path" + "}" , apiInvoker.toPathValue(Path));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]Path.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    if(recursive!=null)
	  resourcePath = resourcePath.replace("{" + "recursive" + "}" , apiInvoker.toPathValue(recursive));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]recursive.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "DELETE", queryParams, postBody, headerParams, formParams, contentType);
		return (RemoveFolderResponse) ApiInvoker.deserialize(response, "", RemoveFolderResponse.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* GetListFiles
	* Get the file listing of a specific folder. Parametres: path - start with name of storage e.g. root folder '/'or some folder '/folder1/..', storage - user's storage name.
	* @param Path	String	
	* @param storage	String	
	* @return ResponseMessage
	*/

  public ResponseMessage GetListFiles (String Path, String storage) {
    Object postBody = null;
    // create path and map variables
    String resourcePath = "/storage/folder/{Path}/?appSid={appSid}&amp;storage={storage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(Path!=null)
	  resourcePath = resourcePath.replace("{" + "Path" + "}" , apiInvoker.toPathValue(Path));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]Path.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "GET", queryParams, postBody, headerParams, formParams, contentType);
		return (ResponseMessage) ApiInvoker.deserialize(response, "", ResponseMessage.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* PostMoveFolder
	* Move a specific folder. Parameters: src - source folder path e.g. /Folder1, storage - user's source storage name, dest - destination folder path e.g. /Folder2, destStorage - user's destination storage name.
	* @param src	String	
	* @param dest	String	
	* @param storage	String	
	* @param destStorage	String	
	* @return MoveFolderResponse
	*/

  public MoveFolderResponse PostMoveFolder (String src, String dest, String storage, String destStorage) {
    Object postBody = null;
    // verify required params are set
    if(src == null || dest == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/folder/{src}/?dest={dest}&amp;appSid={appSid}&amp;storage={storage}&amp;destStorage={destStorage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(src!=null)
	  resourcePath = resourcePath.replace("{" + "src" + "}" , apiInvoker.toPathValue(src));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]src.*?(?=&|\\?|$)", "");
    if(dest!=null)
	  resourcePath = resourcePath.replace("{" + "dest" + "}" , apiInvoker.toPathValue(dest));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]dest.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    if(destStorage!=null)
	  resourcePath = resourcePath.replace("{" + "destStorage" + "}" , apiInvoker.toPathValue(destStorage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]destStorage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "POST", queryParams, postBody, headerParams, formParams, contentType);
		return (MoveFolderResponse) ApiInvoker.deserialize(response, "", MoveFolderResponse.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* PutCopyFolder
	* Copy a folder. Parameters: path - source folder path e.g. /Folder1, storage - user's source storage name, newdest - destination folder path e.g. /Folder2, destStorage - user's destination storage name.
	* @param Path	String	
	* @param newdest	String	
	* @param storage	String	
	* @param destStorage	String	
	* @return ResponseMessage
	*/

  public ResponseMessage PutCopyFolder (String Path, String newdest, String storage, String destStorage) {
    Object postBody = null;
    // verify required params are set
    if(Path == null || newdest == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/folder/{Path}/?appSid={appSid}&amp;newdest={newdest}&amp;storage={storage}&amp;destStorage={destStorage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(Path!=null)
	  resourcePath = resourcePath.replace("{" + "Path" + "}" , apiInvoker.toPathValue(Path));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]Path.*?(?=&|\\?|$)", "");
    if(newdest!=null)
	  resourcePath = resourcePath.replace("{" + "newdest" + "}" , apiInvoker.toPathValue(newdest));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]newdest.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    if(destStorage!=null)
	  resourcePath = resourcePath.replace("{" + "destStorage" + "}" , apiInvoker.toPathValue(destStorage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]destStorage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "PUT", queryParams, postBody, headerParams, formParams, contentType);
		return (ResponseMessage) ApiInvoker.deserialize(response, "", ResponseMessage.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* PutCreateFolder
	* Create the folder. Parameters: path - source folder path e.g. /Folder1, storage - user's source storage name, newdest - destination folder path e.g. /Folder2, destStorage - user's destination storage name.
	* @param Path	String	
	* @param storage	String	
	* @param destStorage	String	
	* @return ResponseMessage
	*/

  public ResponseMessage PutCreateFolder (String Path, String storage, String destStorage) {
    Object postBody = null;
    // verify required params are set
    if(Path == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/folder/{Path}/?appSid={appSid}&amp;storage={storage}&amp;destStorage={destStorage}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(Path!=null)
	  resourcePath = resourcePath.replace("{" + "Path" + "}" , apiInvoker.toPathValue(Path));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]Path.*?(?=&|\\?|$)", "");
    if(storage!=null)
	  resourcePath = resourcePath.replace("{" + "storage" + "}" , apiInvoker.toPathValue(storage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]storage.*?(?=&|\\?|$)", "");
    if(destStorage!=null)
	  resourcePath = resourcePath.replace("{" + "destStorage" + "}" , apiInvoker.toPathValue(destStorage));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]destStorage.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "PUT", queryParams, postBody, headerParams, formParams, contentType);
		return (ResponseMessage) ApiInvoker.deserialize(response, "", ResponseMessage.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  /**
	* GetIsStorageExist
	* Check if a specific storage exists.
	* @param name	String	Storage name
	* @return StorageExistResponse
	*/

  public StorageExistResponse GetIsStorageExist (String name) {
    Object postBody = null;
    // verify required params are set
    if(name == null ) {
       throw new ApiException(400, "missing required params");
    }
    // create path and map variables
    String resourcePath = "/storage/{name}/exist/?appSid={appSid}";
	resourcePath = resourcePath.replaceAll("\\*", "").replace("&amp;", "&").replace("/?", "?").replace("toFormat={toFormat}", "format={format}");
    // query params
    Map<String, String> queryParams = new HashMap<String, String>();
    Map<String, String> headerParams = new HashMap<String, String>();
    Map<String, String> formParams = new HashMap<String, String>();

    if(name!=null)
	  resourcePath = resourcePath.replace("{" + "name" + "}" , apiInvoker.toPathValue(name));
	  else
	  resourcePath = resourcePath.replaceAll("[&?]name.*?(?=&|\\?|$)", "");
    String[] contentTypes = {
      "application/json"};

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";

try {
		response = apiInvoker.invokeAPI(basePath, resourcePath, "GET", queryParams, postBody, headerParams, formParams, contentType);
		return (StorageExistResponse) ApiInvoker.deserialize(response, "", StorageExistResponse.class);
    } catch (ApiException ex) {
      if(ex.getCode() == 404) {
      	throw new ApiException(404, "");
      }
      else {
        throw ex;
      }
    }
  }
  }

