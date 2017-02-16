require 'aspose_slides_cloud'

class Document

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

  def convert_to_other_file_formats_with_additional_settings
  	file_name = "sample.pptx"
  	upload_file(file_name)
  	format = "pdf"
    jpeg_quality = "50"
  	response = @slides_api.get_slides_document_with_format(file_name, format, {jpeg_quality: jpeg_quality})
  end

end

document = Document.new()
puts document.convert_to_other_file_formats_with_additional_settings