require 'aspose_slides_cloud'

class Slides

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

  # Remove presentation slide background color.
  def remove_presentation_slide_background_color
  	file_name = "sample.pptx"
  	upload_file(file_name)
  
  	slide_index = 1
  	response = @slides_api.delete_slides_slide_background(file_name, slide_index)
  end

end

slides = Slides.new()
puts slides.remove_presentation_slide_background_color