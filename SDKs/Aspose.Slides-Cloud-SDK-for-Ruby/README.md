# Aspose.Slides Cloud SDK For Ruby
This SDK lets you use [Aspose Cloud Slides APIs](http://www.aspose.com/cloud/powerpoint-api.aspx) in your web apps.

##How to Use the SDK?
The complete source code is available in this repository folder, you can either directly use it in your project or use RubyGems. For more details, please visit our [documentation website](http://www.aspose.com/docs/display/slidescloud/Available+SDKs).


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

##Contact Us
Your feedback is very important to us. Please feel free to contact us using our [Support Forums](https://www.aspose.com/community/forums/).
