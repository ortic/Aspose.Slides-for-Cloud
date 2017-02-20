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

  # Merge presentations.
  def merge_presentations
  	file_name = "sample.pptx"
  	upload_file(file_name)
  	merge_file_name_1 = "welcome.pptx"
  	upload_file(merge_file_name_1)
  	merge_file_name_2 = "demo.pptx"
  	upload_file(merge_file_name_2)

  	merge_request = PresentationsMergeRequest.new
	  merge_request.presentation_paths = [merge_file_name_1, merge_file_name_2]

  	response = @slides_api.post_presentation_merge(file_name, merge_request)
  end

end

document = Document.new()
puts document.merge_presentations
#ExEnd: