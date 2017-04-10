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
fileName = "sample-input"
name =  fileName  + ".pptx"
slideIndex = 3
format = "jpeg"
width = 200
height = 300

try:
    #upload file to 3rd party cloud storage
    response = storageApi.PutCreate(name, data_folder + name, storage = "AsposeDropboxStorage")

    #invoke Aspose.Slides Cloud SDK API to save a particular slide as image with specified size
    response = slidesApi.GetSlideWithFormat(name, slideIndex, format, width=width, height=height, storage = "AsposeDropboxStorage")

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

