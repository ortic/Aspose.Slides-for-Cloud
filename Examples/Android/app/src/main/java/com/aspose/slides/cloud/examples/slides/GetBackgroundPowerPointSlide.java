package com.aspose.slides.cloud.examples.slides;

import android.content.Context;

import java.io.Console;
import java.io.File;
import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.SlideBackground;
import com.aspose.slides.model.SlideBackgroundResponse;
import com.aspose.storage.api.StorageApi;

public class GetBackgroundPowerPointSlide {

	public static void execute(Context context)  throws Exception {
		//ExStart: 1
		String fileName = "demo.pptx";
		int slideIndex = 1;
		String folder = "";
		String storage = "";
		File inputFile = Utils.stream2file("sample-input","pptx", context.getResources().openRawResource(R.raw.sampleinput));

		try {
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
			// Upload source file to aspose cloud storage
			storageApi.PutCreate(fileName, "", "", inputFile);

			// Invoke Aspose.Slides Cloud SDK API to get slide background
			SlideBackgroundResponse apiResponse = slidesApi.GetSlidesSlideBackground(fileName, slideIndex, folder,
					storage);

			if (apiResponse != null && apiResponse.getStatus().equals("OK")) {
				SlideBackground slideBackground = apiResponse.getBackground();
				System.out.println("SlideBackground Type :: " + slideBackground.getType());
				System.out.println("Get Background of a PowerPoint Slide, Done!");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		//ExEnd: 1
	}
}
