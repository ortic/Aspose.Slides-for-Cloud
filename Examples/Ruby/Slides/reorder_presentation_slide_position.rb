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

  # Reorder presentation slide position
  def reorder_presentation_slide_position
  	file_name = "sample-input.pptx"
  	upload_file(file_name)
  
  	old_position = 1 
  	new_position = 2
  	response = @slides_api.post_slides_reorder_position(file_name, old_position, new_position)
  end

end

slides = Slides.new()
puts slides.reorder_presentation_slide_position