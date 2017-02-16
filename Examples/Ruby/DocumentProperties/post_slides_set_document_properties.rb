require 'aspose_slides_cloud'

class DocumentProperties

  include AsposeSlidesCloud
  include AsposeStorageCloud

  def initialize
    #Get App key and App SID from https://cloud.aspose.com
    AsposeApp.app_key_and_sid("da77c9f5da014d91faf2961ecec2de66", "B01A15E5-1B83-4B9A-8EB3-0F2BFA6AC766")
    @slides_api = SlidesApi.new
  end

  def upload_file(file_name)
    @storage_api = StorageApi.new 
    response = @storage_api.put_create(file_name, File.open("../data/" << file_name,"r") { |io| io.read } )
  end

  def post_slides_set_document_properties
  	file_name = "sample-input.pptx"
  	upload_file(file_name)
  	
document_properties = DocumentProperties.new
document_property = DocumentProperty.new
document_property.name = "Author"
document_property.value = "Elon Musk"

document_properties.list = [document_property]

  	response = @slides_api.post_slides_set_document_properties(file_name, document_properties)
  end

end

documentProperties = DocumentProperties.new()
puts documentProperties.post_slides_set_document_properties