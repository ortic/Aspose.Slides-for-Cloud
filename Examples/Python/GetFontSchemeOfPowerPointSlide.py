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
    response = slidesApi.GetSlidesThemeFontScheme(name, slideIndex)

    if response.Status == "OK":
        fontScheme = response.FontScheme
        print "Name: " + fontScheme.Name
        print "ComplexScript (heading part) : " + fontScheme.Major.ComplexScript
        print "EastAsian (heading part) : " + fontScheme.Major.EastAsian
        print "Latin (heading part) : " + fontScheme.Major.Latin
        print "ComplexScript (body part) : " + fontScheme.Minor.ComplexScript
        print "EastAsian (body part) : " + fontScheme.Minor.EastAsian
        print "Latin (body part) : " + fontScheme.Minor.Latin

except ApiException as ex:
            print "ApiException:"
            print "Code:" + str(ex.code)
            print "Message:" + ex.message
