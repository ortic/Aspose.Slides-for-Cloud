require 'aspose_slides_cloud'

class Text

  include AsposeSlidesCloud
  include AsposeStorageCloud

  def initialize
    #Get App key and App SID from https://cloud.aspose.com
    AsposeApp.app_key_and_sid("", "")
    @slides_api = SlidesApi.new
  end

  def upload_file(file_name)
    @storage_api = StorageApi.new 
    response = @storage_api.put_create(file_name, File.open("../data/" << file_name,"r") { |io| io.read } )
  end

  def post_slides_presentation_replace_text
  	file_name = "sample.pptx"
  	upload_file(file_name)
  
  	old_value = "aspose" 
  	new_value = "Aspose File Format APIs"
  	response = @slides_api.post_slides_presentation_replace_text(file_name, old_value, new_value)
  end

end

text = Text.new()
puts text.post_slides_presentation_replace_text