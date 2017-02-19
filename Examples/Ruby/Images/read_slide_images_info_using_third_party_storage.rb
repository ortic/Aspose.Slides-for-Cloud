require 'aspose_slides_cloud'

class Images

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

  def read_slide_images_info_using_third_party_storage
  	file_name = "sample.pptx"
  	upload_file(file_name)
  	slide_index = 1
    folder = ""
    storage = "MyDropboxStorage"

  	response = @slides_api.get_slides_slide_images(file_name, slide_index, {storage: storage, folder: folder})
  end

end

images = Images.new()
puts images.read_slide_images_info_using_third_party_storage