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
    response = @storage_api.put_create(file_name, File.open("../../../data/" << file_name,"r") { |io| io.read } )
  end

  # Get slide in specified format
  def get_slide_in_specified_format
  	file_name = "sample.pptx"
  	upload_file(file_name)
 
  	slide_index = 1 
  	format = "pdf"
  	response = @slides_api.get_slide_with_format(file_name, slide_index, format)
  end

end

slides = Slides.new()
puts slides.get_slide_in_specified_format