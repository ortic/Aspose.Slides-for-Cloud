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

  # Delete presentation slides.
  def delete_presentation_slides_using_third_party_storage
  	file_name = "sample.pptx"
  	upload_file(file_name)
    folder = ""
    storage = "MyDropboxStorage"

  	response = @slides_api.delete_slides_clean_slides_list(file_name, {storage: storage, folder: folder})
  end

end

slides = Slides.new()
puts slides.delete_presentation_slides_using_third_party_storage