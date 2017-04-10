package com.aspose.slides.cloud.examples.text;

import android.content.Context;

import java.io.File;
import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.TextItemsResponse;
import com.aspose.storage.api.StorageApi;

public class GetAllTextFromSlide {
	public static void  execute(Context context)  throws Exception  {
		//ExStart: 1
		String fileName = "sampleinput.pptx";
		int slideIndex = 1;
		Boolean withEmpty = false;
		String folder = "";
		String storage = "";
		File inputFile = Utils.stream2file("sample-input","pptx", context.getResources().openRawResource(R.raw.sampleinput));

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",inputFile);

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

