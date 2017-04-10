package com.aspose.slides.cloud.examples.slides;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.Placeholder;
import com.aspose.slides.model.PlaceholderResponse;
import com.aspose.storage.api.StorageApi;

public class GetPlaceholderFromSlide {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		int slideIndex = 1;
		int placeholderIndex = 0;
		String folder = "";
		String storage = "";
		Path inputFile = Utils.getPath(GetPlaceholderFromSlide.class, fileName);

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",inputFile.toFile());
		    // Invoke Aspose.Slides Cloud SDK API to get placeholder from a slide
		    PlaceholderResponse apiResponse = slidesApi.GetSlidesPlaceholder(fileName, slideIndex, placeholderIndex, folder, storage);
		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {
		        Placeholder placeholder = apiResponse.getPlaceholder();
		        System.out.println("Get Placeholder from a PowerPoint Slide, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}
		//ExEnd: 1
	}
}
