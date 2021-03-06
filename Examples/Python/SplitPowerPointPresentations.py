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
ffrom = 2
to = 3
format = "png"


try:
    #upload file to aspose cloud storage
    response = storageApi.PutCreate(name, data_folder + name)

    #invoke Aspose.Slides Cloud SDK API to split all or specific slides of a presentation file to specify format
    response = slidesApi.PostSlidesSplit(name, ffrom=ffrom, to=to, format=format)

    if response.Status == "OK":
        for slideUri in response.SplitResult.Slides:
            urlString = slideUri.Href
            slidName = urlString.split('/')[-1]
            #download presentation from cloud storage
            response = storageApi.GetDownload(Path=slidName)
            outfilename = "c:/temp/" + slidName
            with open(outfilename, 'wb') as f:
                        for chunk in response.InputStream:
                            f.write(chunk)
except ApiException as ex:
            print "ApiException:"
            print "Code:" + str(ex.code)
            print "Message:" + ex.message
