package com.aspose.slides.cloud.examples.text;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.PresentationStringReplaceResponse;
import com.aspose.storage.api.StorageApi;

public class ReplaceAllInstancesInPresentation {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		String oldValue = "aspose";
		String newValue = "aspose2";
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

		    // Invoke Aspose.Slides Cloud SDK API to get all text instances from presentation
		    PresentationStringReplaceResponse apiResponse = slidesApi.PostSlidesPresentationReplaceText(fileName, oldValue, newValue, ignoreCase, folder, storage);

		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {
		       
		        System.out.println("Replace All Text Instances in a Presentation, Done!");
		
		    }
		}
		catch (Exception ex)
		{
		   ex.printStackTrace();

		}
		//ExEnd: 1

	}

}
