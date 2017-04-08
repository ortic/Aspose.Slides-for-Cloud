import asposeslidescloud
from asposeslidescloud.SlidesApi import SlidesApi
from asposeslidescloud.SlidesApi import ApiException
from asposeslidescloud.models import DocumentProperty

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
propertyName = "Author"

body = DocumentProperty.DocumentProperty()
body.Name = "Author"
body.Value = "Farooq Sheikh"
body.BuiltIn = True

try:
    #upload file to aspose cloud storage
    response = storageApi.PutCreate(name, data_folder + name)

    #Aspose.Slides Cloud SDK API to set a single document property
    response = slidesApi.PutSlidesSetDocumentProperty(name, propertyName, body)

    if response.Status == "OK":
        docProperty = response.DocumentProperty
        print docProperty.Name + " :: " +  docProperty.Value

except ApiException as ex:
            print "ApiException:"
            print "Code:" + str(ex.code)
            print "Message:" + ex.message
