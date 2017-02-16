require 'aspose_slides_cloud'

class Text

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

  def post_slides_slide_replace_text
  	file_name = "sample.pptx"
  	upload_file(file_name)
   
  	slide_index = 1
  	old_value = "aspose"
  	new_value = "Aspose File Format APIs"
  	response = @slides_api.post_slides_slide_replace_text(file_name, slide_index, old_value, new_value)
  end

end

text = Text.new()
puts text.post_slides_slide_replace_text