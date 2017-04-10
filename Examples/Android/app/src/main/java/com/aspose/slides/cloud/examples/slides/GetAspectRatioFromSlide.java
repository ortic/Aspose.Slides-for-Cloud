package com.aspose.slides.cloud.examples.slides;

import android.content.Context;

import java.io.File;
import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.SlideResponse;
import com.aspose.storage.api.StorageApi;

public class GetAspectRatioFromSlide {

	public static void execute(Context context)  throws Exception {
		//ExStart: 1
		String fileName = "demo.pptx";
		int slideIndex = 1;
		String folder = "";
		String storage = "";
		File inputFile = Utils.stream2file("demo","pptx", context.getResources().openRawResource(R.raw.demo));

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile);

		    // Invoke Aspose.Slides Cloud SDK API to get aspect ratio of a power point slide
		    SlideResponse apiResponse = slidesApi.GetSlidesSlide(fileName, slideIndex, folder, storage);

		    if (apiResponse != null)
		    {
		    	System.out.println("Height is " + apiResponse.getSlide().getHeight() 
		    			+ " and width is " +apiResponse.getSlide().getWidth());
		    	System.out.println("Get Aspect Ratio of a PowerPoint Slide, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();

		}
		//ExEnd: 1
	}

}
