package com.aspose.slides.cloud.examples.text;

import java.io.Console;
import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.SlideStringReplaceResponse;
import com.aspose.storage.api.StorageApi;

public class ReplaceAllInstancesInSlide {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		int slideIndex = 1;
		String oldValue = "aspose";
		String newValue = "apose2";
		boolean ignoreCase = true;
		String folder = "";
		String storage = "";

		Path inputFile = Utils.getPath(ReplaceAllInstancesInPresentation.class, fileName);

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to replace all text instances in a slide
		    SlideStringReplaceResponse apiResponse = slidesApi.PostSlidesSlideReplaceText(fileName, slideIndex, oldValue, newValue, ignoreCase, folder, storage);

		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {
		        // Download updated presentation from cloud storage
		        System.out.println("Replace All Text Instances in a Slide, Done!");

		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}
		//ExEnd: 1

	}

}
