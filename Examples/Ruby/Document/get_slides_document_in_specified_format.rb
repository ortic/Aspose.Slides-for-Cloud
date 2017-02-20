#ExStart:
require 'aspose_slides_cloud'

class Document

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

  # Get slides document in specified format
  def get_slides_document_in_specified_format
  	file_name = "sample.pptx"
  	upload_file(file_name)
  	format = "tiff"
  	response = @slides_api.get_slides_document_with_format(file_name, format)
  end

end

document = Document.new()
puts document.get_slides_document_in_specified_format
#ExEnd: