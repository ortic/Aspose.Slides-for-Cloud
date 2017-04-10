package com.aspose.slides.cloud.examples.shapes;

import java.io.Console;
import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.ShapeListResponse;
import com.aspose.storage.api.StorageApi;

public class ExtractShapeFromSlide {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		int slideIndex = 1;
		String folder = "";
		String storage = "";
		
		Path inputFile = Utils.getPath(ExtractShapeFromSlide.class, fileName);

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID); 
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		 
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", 	inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to extract shapes
		    ShapeListResponse apiResponse = slidesApi.GetSlidesSlideShapes(fileName, slideIndex, folder, storage);

		    if (apiResponse != null)
		    {
		        System.out.println("Extract Shapes from a Slide, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();

		}
		
		//ExEnd: 1
	}

}
