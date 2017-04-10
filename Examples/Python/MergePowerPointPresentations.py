import asposeslidescloud
from asposeslidescloud.SlidesApi import SlidesApi
from asposeslidescloud.SlidesApi import ApiException
from asposeslidescloud.models import PresentationsMergeRequest

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
name =  "sample.pptx"
mergeFile1 = "welcome.pptx"
mergeFile2 = "demo.pptx"

body = PresentationsMergeRequest.PresentationsMergeRequest()
body.PresentationPaths = [mergeFile1, mergeFile2]

try:
    #upload file to aspose cloud storage
    response = storageApi.PutCreate(name, data_folder + name)
    response = storageApi.PutCreate(mergeFile1, data_folder + mergeFile1)
    response = storageApi.PutCreate(mergeFile2, data_folder + mergeFile2)

    #invoke Aspose.Slides Cloud SDK API to merge multiple presentation files
    response = slidesApi.PostPresentationMerge(name, body)

    if response.Status == "OK":
        #download presentation from cloud storage
        response = storageApi.GetDownload(Path=name)
        outfilename = "c:/temp/" + name
        with open(outfilename, 'wb') as f:
                    for chunk in response.InputStream:
                        f.write(chunk)

except ApiException as ex:
            print "ApiException:"
            print "Code:" + str(ex.code)
            print "Message:" + ex.message
