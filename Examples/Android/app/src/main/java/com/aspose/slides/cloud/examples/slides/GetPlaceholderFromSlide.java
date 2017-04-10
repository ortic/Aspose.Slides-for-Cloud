package com.aspose.slides.cloud.examples.slides;

import android.content.Context;

import java.io.Console;
import java.io.File;
import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.Placeholder;
import com.aspose.slides.model.PlaceholderResponse;
import com.aspose.storage.api.StorageApi;

public class GetPlaceholderFromSlide {

	public static void  execute(Context context)  throws Exception {
		//ExStart: 1
		String fileName = "sampleinput.pptx";
		int slideIndex = 1;
		int placeholderIndex = 0;
		String folder = "";
		String storage = "";
		File inputFile = Utils.stream2file("sample-input","pptx", context.getResources().openRawResource(R.raw.sampleinput));

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",inputFile);
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
