require 'aspose_slides_cloud'

class Slides

  include AsposeSlidesCloud
  include AsposeStorageCloud

  def initialize
    #Get App key and App SID from https://cloud.aspose.com
    AsposeApp.app_key_and_sid("da77c9f5da014d91faf2961ecec2de66", "B01A15E5-1B83-4B9A-8EB3-0F2BFA6AC766")
    @slides_api = SlidesApi.new
  end

  def upload_file(file_name)
    @storage_api = StorageApi.new 
    response = @storage_api.put_create(file_name, File.open("../data/" << file_name,"r") { |io| io.read } )
  end

  def get_slides_placeholder
  	file_name = "sample-input.pptx"
  	upload_file(file_name)
  	slide_index = 1 
  	placeholder_index = 0
  	response = @slides_api.get_slides_placeholder(file_name, slide_index, placeholder_index)
  end

end

slides = Slides.new()
puts slides.get_slides_placeholder