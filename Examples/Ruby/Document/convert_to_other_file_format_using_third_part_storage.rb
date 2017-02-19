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

  # Get slides document in specified format
  def convert_to_other_file_format_using_third_part_storage
  	file_name = "sample.pptx"
  	upload_file(file_name)
  	format = "tiff"
    storage = "MyDropboxStorage";
    folder = "";

  	response = @slides_api.get_slides_document_with_format(file_name, format, {storage: storage, folder: folder})
  end

end

document = Document.new()
puts document.convert_to_other_file_format_using_third_part_storage