package com.aspose.slides.cloud.examples.slides;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.SlideListResponse;
import com.aspose.storage.api.StorageApi;

public class DeleteAllSlidesfromaPresentationUsingThirdPartyStorage {

	public static void main(String[] args) {
		//ExStart: 1
		// For complete examples and data files, please go to https://github.com/aspose-slides/Aspose.Slides-for-Cloud
	
		String fileName = "sample-input.pptx";
		String folder = "";
		String storage = "dropboxstorage";
		Path inputFile = Utils.getPath(DeleteAllSlidesfromaPresentationUsingThirdPartyStorage.class, fileName);

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to detect all slides using third party storage
		    SlideListResponse apiResponse = slidesApi.DeleteSlidesCleanSlidesList(fileName, folder, storage);

		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {                    
		        System.out.println("Delete All Slides from a Presentation Using Third Party Storage, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}	
	
		//ExEnd: 1

	}

}
