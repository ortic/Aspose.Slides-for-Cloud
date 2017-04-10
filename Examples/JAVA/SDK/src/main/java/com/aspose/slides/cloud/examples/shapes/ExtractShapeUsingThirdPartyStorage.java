package com.aspose.slides.cloud.examples.shapes;

import java.io.Console;
import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.ShapeListResponse;
import com.aspose.storage.api.StorageApi;

public class ExtractShapeUsingThirdPartyStorage {

	public static void main(String[] args) {
		//ExStart: 1
		// For complete examples and data files, please go to https://github.com/aspose-slides/Aspose.Slides-for-Cloud
		SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID); 
		StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		String fileName = "sample-input.pptx";
		int slideIndex = 1;
		String folder = "";
		String storage = "dropboxstorage";
		Path inputFile = Utils.getPath(ExtractShapeUsingThirdPartyStorage.class, fileName);

		try
		{
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to extract shape from a slide using third party storage
		    ShapeListResponse apiResponse = slidesApi.GetSlidesSlideShapes(fileName, slideIndex, folder, storage);

		    if (apiResponse != null)
		    {
		    	System.out.println("Extract Shapes from a Slide Using Third Party Storage, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}
		//ExEnd: 1

	}

}
