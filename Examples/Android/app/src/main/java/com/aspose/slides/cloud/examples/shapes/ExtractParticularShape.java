package com.aspose.slides.cloud.examples.shapes;

import android.content.Context;
import java.io.File;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.ShapeResponse;
import com.aspose.storage.api.StorageApi;

public class ExtractParticularShape {
	
	public static void execute(Context context)  throws Exception{
		//ExStart: 1
		String fileName = "sampleinput.pptx";
		int slideIndex = 2;
		String shapePath = "2";
		String folder = "";
		String storage = "";

		File inputFile = Utils.stream2file("sample-input","pptx", context.getResources().openRawResource(R.raw.sample));
		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID); 
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",inputFile);

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
