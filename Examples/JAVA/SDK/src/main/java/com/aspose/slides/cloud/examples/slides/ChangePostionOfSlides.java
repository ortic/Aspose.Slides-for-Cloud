package com.aspose.slides.cloud.examples.slides;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.SlideListResponse;
import com.aspose.storage.api.StorageApi;

public class ChangePostionOfSlides {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		int oldPosition = 3;
		int newPosition = 2;
		String folder = "";
		String storage = "";
		Path inputFile = Utils.getPath(ChangePostionOfSlides.class, fileName);

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to change position of slide in presentation
		    SlideListResponse apiResponse = slidesApi.PostSlidesReorderPosition(fileName, oldPosition, newPosition, folder, storage);

		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {                    
		    	System.out.println("Change Position of Slides in a PowerPoint Presentation, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}
		//ExEnd: 1

	}

}
