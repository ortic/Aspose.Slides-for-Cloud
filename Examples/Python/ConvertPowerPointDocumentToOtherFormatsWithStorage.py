import asposeslidescloud
from asposeslidescloud.SlidesApi import SlidesApi
from asposeslidescloud.SlidesApi import ApiException

import asposestoragecloud
from asposestoragecloud.StorageApi import StorageApi
from asposestoragecloud.StorageApi import ResponseMessage

apiKey = "XXXXX" #sepcify App Key
appSid = "XXXXX" #sepcify App SID
apiServer = "http://api.aspose.com/v1.1"
data_folder = "../../../data/"

#Instantiate Aspose Storage API SDK
storage_apiClient = asposestoragecloud.ApiClient.ApiClient(apiKey, appSid, True)
storageApi = StorageApi(storage_apiClient)
#Instantiate Aspose Slides API SDK
api_client = asposeslidescloud.ApiClient.ApiClient(apiKey, appSid, True)
slidesApi = SlidesApi(api_client);

#set input file name
fileName = "Sample"
name = fileName + ".pptx"
format = "tiff"
storage = "AsposeDropboxStorage"

try:
    #upload file to 3rd party cloud storage
    response = storageApi.PutCreate(name, data_folder + name, storage=storage)

    #invoke Aspose.Slides Cloud SDK API to save a presentation to different other formats
    response = slidesApi.GetSlidesDocumentWithFormat(name, format, storage=storage)

    if response.Status == "OK":
        #download presentation from api response
        outfilename = "c:/temp/" + fileName + "." + format
        with open(outfilename, 'wb') as f:
                    for chunk in response.InputStream:
                        f.write(chunk)

except ApiException as ex:
            print "ApiException:"
            print "Code:" + str(ex.code)
            print "Message:" + ex.message

