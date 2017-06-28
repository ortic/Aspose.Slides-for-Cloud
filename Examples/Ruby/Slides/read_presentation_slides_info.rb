#ExStart:
require 'aspose_slides_cloud'

class Slides

  include AsposeSlidesCloud
  include AsposeStorageCloud

  def initialize
    #Get App key and App SID from https://cloud.aspose.com
    AsposeApp.app_key_and_sid("APP_KEY", "APP_SID")
    @slides_api = SlidesApi.new
  end

  def upload_file(file_name)
    @storage_api = StorageApi.new 
    response = @storage_api.put_create(file_name, File.open("../../../data/" << file_name,"r") { |io| io.read } )
  end

  # Read presentation slides info.
  def read_presentation_slides_info
  	file_name = "sample.pptx"
  	upload_file(file_name)
  
  	response = @slides_api.get_slides_slides_list(file_name)
  end

end

slides = Slides.new()
puts slides.read_presentation_slides_info
#ExEnd:
