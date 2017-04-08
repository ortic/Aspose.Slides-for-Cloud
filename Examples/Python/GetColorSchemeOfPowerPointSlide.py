import asposeslidescloud
from asposeslidescloud.SlidesApi import SlidesApi
from asposeslidescloud.SlidesApi import ApiException

import asposestoragecloud
from asposestoragecloud.StorageApi import StorageApi
from asposestoragecloud.StorageApi import ResponseMessage

apiKey = "XXXXX" #sepcify App Key
appSid = "XXXXX" #sepcify App SID
apiServer = "http://api.aspose.com/v1.1"
data_folder = "../../data/"

#Instantiate Aspose Storage API SDK
storage_apiClient = asposestoragecloud.ApiClient.ApiClient(apiKey, appSid, True)
storageApi = StorageApi(storage_apiClient)
#Instantiate Aspose Slides API SDK
api_client = asposeslidescloud.ApiClient.ApiClient(apiKey, appSid, True)
slidesApi = SlidesApi(api_client);

#set input file name
name =  "sample-input.pptx"
slideIndex = 1

try:
    #upload file to aspose cloud storage
    response = storageApi.PutCreate(name, data_folder + name)

    #invoke Aspose.Slides Cloud SDK API to get font scheme of a particular slide
    response = slidesApi.GetSlidesThemeColorScheme(name, slideIndex)

    if response.Status == "OK":
        colorScheme = response.ColorScheme
        print "Accent1 : " + colorScheme.Accent1
        print "Accent3 : " + colorScheme.Accent2
        print "Dark1 : " + colorScheme.Dark1
        print "Dark2 : " + colorScheme.Dark2
        print "Light1 : " + colorScheme.Light1

except ApiException as ex:
            print "ApiException:"
            print "Code:" + str(ex.code)
            print "Message:" + ex.message

