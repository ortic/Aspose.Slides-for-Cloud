package com.aspose.slides.cloud.examples.slides;

import android.content.Context;

import java.io.Console;
import java.io.File;
import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.ResponseMessage;
import com.aspose.storage.api.StorageApi;

public class SavePowerPointSlideSpecifiedImage {

	public static void execute(Context context)  throws Exception   {
		//ExStart: 1
		String name = "sample-input";
		String fileName = name + ".pptx";
		int slideIndex = 3;
		String format = "jpeg";
		int width = 200;
		int height = 300;
		String folder = "";
		String storage = "";
		File inputFile = Utils.stream2file("sample-input","pptx", context.getResources().openRawResource(R.raw.sampleinput));
		File target = Utils.createTempFile("sample-input","jpeg");

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);


		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile);

		    // Invoke Aspose.Slides Cloud SDK API to save slide as image with specified size
		    ResponseMessage apiResponse = slidesApi.GetSlideWithFormat(fileName, slideIndex, format, width, height, folder, storage);

		    if (apiResponse != null)
		    {
				Utils.copyInputStreamToFile(apiResponse.getInputStream(),target);
				System.out.println("Save a PowerPoint Slide as Image with Specified Size, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}
		//ExEnd: 1

	}

}
