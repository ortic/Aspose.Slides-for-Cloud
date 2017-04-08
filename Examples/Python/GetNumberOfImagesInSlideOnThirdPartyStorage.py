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
name =  "sample-input.pptx"
slideIndex = 3


try:
    #upload file to 3rd party cloud storage
    response = storageApi.PutCreate(name, data_folder + name, storage = "AsposeDropboxStorage")

    #invoke Aspose.Slides Cloud SDK API to get images in a slide
    response = slidesApi.GetSlidesSlideImages(name, slideIndex, storage = "AsposeDropboxStorage")

    if response.Status == "OK":
        count = len(response.Images.List)
        print "Total Images Found In Slide[3] :: "  + str(count)

except ApiException as ex:
            print "ApiException:"
            print "Code:" + str(ex.code)
            print "Message:" + ex.message

