Pod::Spec.new do |s|
  s.name         = "AsposeSlidesCloud"
  s.version      = "1.0.0"
  s.summary      = "Aspose.Slides for Cloud"
  s.description  = <<-DESC
                   Aspose.Slides for Cloud is a REST API which allows you to process presentations. It allows you to create, modify, and convert presentations and provides a wide variety of features for working with presentations in the cloud. You can convert a presentation to TIFF, PDF, XPS, PPTX, ODP, PPSX, PPTM, PPSM, POTX, POTM, HTML and image formats. Aspose.Slides for Cloud allows you to extract different elements or a presentation including slide, text, color schemes, font schemes, shapes and images etc. Aspose.Slides for Cloud’s powerful API lets your apps process Microsoft PowerPoint presentations in the cloud, saving you the time it would take to develop your own API. 
                   DESC

  s.homepage     = "http://www.aspose.com/cloud/powerpoint-api.aspx"
  s.license = { :type => 'MIT', :file => 'LICENSE'}
  s.author = { "M. Sohail Ismail" => "muhammad.sohail@aspose.com" }
  s.social_media_url = "https://www.facebook.com/asposeplugins/"
  s.platform = :ios, "7.0"
  s.source       = { :git => "https://github.com/asposeslides/Aspose_Slides_Cloud.git", :tag => "1.0.0" }
  
  s.subspec 'model' do |ss|
      ss.source_files = 'SDKs/Aspose.Slides_Cloud_SDK_for_ObjectiveC/Aspose.Slides_Cloud_SDK_for_ObjectiveC/slides/model/*.{h,m}'
  end
  s.subspec 'api' do |ss|
      ss.dependency 'AsposeSlidesCloud/model'
      ss.source_files = 'SDKs/Aspose.Slides_Cloud_SDK_for_ObjectiveC/Aspose.Slides_Cloud_SDK_for_ObjectiveC/slides/api/*.{h,m}'
  end
  
  s.dependency "AFNetworking", "~> 2.0"
  s.dependency "JSONModel", "~> 1.1"
  s.dependency "ISO8601", "~> 0.3"
  s.dependency "AsposeStorageCloud"

  s.requires_arc = true

end