require 'aspose_slides_cloud'

class Shapes

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

  # Read slide shape info.
  def get_slide_shape
  	file_name = "sample-input.pptx"
  	upload_file(file_name)
  
  	slide_index = 1
  	shape_path = "1"
  	response = @slides_api.get_slides_slide_shapes_parent(file_name, slide_index, shape_path)
  end

end

shapes = Shapes.new()
puts shapes.get_slide_shape