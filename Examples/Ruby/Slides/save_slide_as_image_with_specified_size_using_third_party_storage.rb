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

  def save_slide_as_image_with_specified_size_using_third_party_storage
  	file_name = "sample.pptx"
  	upload_file(file_name)
  	slide_index = 1 
  	format = "pdf"
    width = 200
    height = 300
    folder = ""
    storage = "MyDropboxStorage"

  	response = @slides_api.get_slide_with_format(file_name, slide_index, format, {width: width, height: height, storage: storage, folder: folder})
  end

end

slides = Slides.new()
puts slides.save_slide_as_image_with_specified_size_using_third_party_storage