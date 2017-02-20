#ExStart:
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
    response = @storage_api.put_create(file_name, File.open("../../../data/" << file_name,"r") { |io| io.read } )
  end

  # Extract presentation text items.
  def get_presentation_text_items_using_third_party_storage
  	file_name = "sample.pptx"
    upload_file(file_name)
    folder = ""
    storage = "MyDropboxStorage"
  
  	response = @slides_api.get_slides_presentation_text_items(file_name, {storage: storage, folder: folder})
  end

end

text = Text.new()
puts text.get_presentation_text_items_using_third_party_storage
#ExEnd: