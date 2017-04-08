package com.aspose.slides.cloud.examples.slides;


import android.content.Context;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.SlideListResponse;
import com.aspose.storage.api.StorageApi;

import java.io.File;

public class DeleteSpecificSlide {

	public static void execute(Context context)  throws Exception {
		//ExStart: 1
		String fileName = "sampleinput.pptx";
		String folder = "";
		String storage = "";
		File inputFile = Utils.stream2file("sample-input","pptx", context.getResources().openRawResource(R.raw.sampleinput));

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile);
		    // Invoke Aspose.Slides Cloud SDK API to detect all slides from a presentation
		    SlideListResponse apiResponse = slidesApi.DeleteSlidesCleanSlidesList(fileName, folder, storage);

		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {                    
		    	System.out.println("Delete All Slides from a PowerPoint Presentation, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}
		//ExEnd: 1
	}
}
