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

  def ordered_presentation_merge
  	file_name = "sample.pptx"
  	upload_file(file_name)
  	merge_file_name_1 = "welcome.pptx"
  	upload_file(merge_file_name_1)
  	merge_file_name_2 = "demo.pptx"
  	upload_file(merge_file_name_2)
  
  	ordered_merge_request = OrderedMergeRequest.new

    presentation_to_merge_1 = PresentationToMerge.new
    presentation_to_merge_1.path = merge_file_name_1  
    presentation_to_merge_1.slides = 1

    presentation_to_merge_2 = PresentationToMerge.new
    presentation_to_merge_2.path = merge_file_name_2
    presentation_to_merge_2.slides = 1

    ordered_merge_request.presentations = [presentation_to_merge_1, presentation_to_merge_2]

  	response = @slides_api.put_presentation_merge(file_name, ordered_merge_request)
  end

end

document = Document.new()
puts document.ordered_presentation_merge
#ExEnd: