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
    response = @storage_api.put_create(file_name, File.open("../data/" << file_name,"r") { |io| io.read } )
  end

  # Convert presentation from request content to format specified.
  def convert_presentation_from_request_content
  	file_name = "sample.pptx"
  	convert_to_format = "pdf"
  	response = @slides_api.put_slides_convert(File.open("../data/" << file_name,"r") { |io| io.read }, {format: convert_to_format})
  end

end

document = Document.new()
puts document.convert_presentation_from_request_content