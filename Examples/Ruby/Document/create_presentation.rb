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

  # Create presentation
  def create_presentation
  	file_name = "newPresentation.pptx"
  	response = @slides_api.put_new_presentation(file_name, File.open("../../../data/sample.pptx","r") { |io| io.read })
  end

end

document = Document.new()
puts document.create_presentation