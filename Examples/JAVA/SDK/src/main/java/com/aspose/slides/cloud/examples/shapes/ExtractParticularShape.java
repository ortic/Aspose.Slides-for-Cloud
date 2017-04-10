package com.aspose.slides.cloud.examples.shapes;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.ShapeResponse;
import com.aspose.storage.api.StorageApi;

public class ExtractParticularShape {
	
	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		int slideIndex = 2;
		String shapePath = "2";
		String folder = "";
		String storage = "";

		Path inputFile = Utils.getPath(ExtractParticularShape.class, fileName);

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID); 
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to get particular shape from slide
		    ShapeResponse apiResponse = slidesApi.GetSlidesSlideShapesParent(fileName, slideIndex, shapePath, folder, storage);

		    if (apiResponse != null)
		    {
		        System.out.println("Get a Particular Shape from the Slide, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();;

		}
		//ExEnd: 1
	}

}
