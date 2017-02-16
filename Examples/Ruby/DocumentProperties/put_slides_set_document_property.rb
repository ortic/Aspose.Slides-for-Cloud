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

  def put_slides_set_document_property
  	file_name = "sample-input.pptx"
  	upload_file(file_name)

  	property_name = "Author"
  	document_property = DocumentProperty.new
document_property.name = property_name
document_property.value = "Elon Musk"
  	response = @slides_api.put_slides_set_document_property(file_name, property_name, document_property)
  end

end

documentProperties = DocumentProperties.new()
puts documentProperties.put_slides_set_document_property