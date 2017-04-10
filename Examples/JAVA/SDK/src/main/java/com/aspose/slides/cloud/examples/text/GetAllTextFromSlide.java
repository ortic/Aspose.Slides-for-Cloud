package com.aspose.slides.cloud.examples.text;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.TextItemsResponse;
import com.aspose.storage.api.StorageApi;

public class GetAllTextFromSlide {
	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		int slideIndex = 1;
		Boolean withEmpty = false;
		String folder = "";
		String storage = "";
		Path inputFile = Utils.getPath(GetAllTextFromSlide.class, fileName);

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to append word document
		    TextItemsResponse apiResponse = slidesApi.GetSlidesSlideTextItems(fileName, slideIndex, withEmpty, folder, storage);

		    if (apiResponse != null)
		    {
		        System.out.println("Get All Text Items from a Slide, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();

		}
		//ExEnd: 1
	}
}

