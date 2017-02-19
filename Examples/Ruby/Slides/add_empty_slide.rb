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

  def add_empty_slide
  	file_name = "sample.pptx"
  	upload_file(file_name)
  
  	response = @slides_api.post_add_empty_slide(file_name)
  end

end

slides = Slides.new()
puts slides.add_empty_slide