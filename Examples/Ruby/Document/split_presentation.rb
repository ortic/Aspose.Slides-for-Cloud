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

  # Splitting presentations. Create one image per slide.
  def split_presentation
  	file_name = "sample-input.pptx"
  	upload_file(file_name)
  
  	response = @slides_api.post_slides_split(file_name, {to: 3, from: 2, format: "png"})
  end

end

document = Document.new()
puts document.post_slides_split