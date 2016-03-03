# Aspose.Slides Cloud SDK For Ruby
This SDK lets you use [Aspose Cloud Slides APIs](http://www.aspose.com/cloud/powerpoint-api.aspx) in your web apps.

## Installing
You can simply install Aspose Slides Cloud SDK with gem:

`gem install aspose_slides_cloud`

## Usage
APIs of this SDK can be called as follows:

```ruby
require 'aspose_slides_cloud'

class SlidesUsage
  
  include AsposeSlidesCloud
  include AsposeStorageCloud
	
  def initialize
    #Get App key and App SID from https://cloud.aspose.com
    AsposeApp.app_key_and_sid("APP_KEY", "APP_SID")
    @slides_api = SlidesApi.new  
  end
  
  def put_slides_convert
    #Convert presentation from request content to format specified.
    file_name = "sample.pptx"
    convert_to_format = "pdf"
    response = @slides_api.put_slides_convert(File.open("data/" << file_name,"r") { |io| io.read }, {format: convert_to_format})
  end
  
end
```
## Unit Tests
Aspose Slides SDK includes a suite of unit tests within the [test](https://github.com/asposeslides/Aspose_Slides_Cloud/blob/master/SDKs/Aspose.Slides_Cloud_SDK_For_Ruby/test/slides_tests.rb) subdirectory. These Unit Tests also serves as examples of how to use the Aspose Slides SDK.

## Contact
Your feedback is very important to us. Please email us all your queries and feedback at marketplace@aspose.com.

## License
Aspose Slides SDK is available under the MIT license. See the [LICENSE](https://github.com/asposeslides/Aspose_Slides_Cloud/blob/master/SDKs/Aspose.Slides_Cloud_SDK_For_Ruby/LICENSE) file for more info.
