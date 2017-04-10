package com.aspose.slides.cloud.examples.slides;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.SlideListResponse;
import com.aspose.storage.api.StorageApi;

public class GetSlideCountFromPresentation {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		String folder = "";
		String storage = "";
		Path inputFile = Utils.getPath(GetSlideCountFromPresentation.class, fileName);

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile.toFile());
		    // Invoke Aspose.Slides Cloud SDK API to get slide count
		    SlideListResponse apiResponse = slidesApi.GetSlidesSlidesList(fileName, folder, storage);
		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {
		        int count = apiResponse.getSlides().getSlideList().size();
		        System.out.println("Total Slides :: " + count);
		        System.out.println("Get PowerPoint Slide Count, Done!");
		    }
		}
		catch (Exception ex)
		{
		   ex.printStackTrace();
		}
		//ExEnd: 1
	}
}
