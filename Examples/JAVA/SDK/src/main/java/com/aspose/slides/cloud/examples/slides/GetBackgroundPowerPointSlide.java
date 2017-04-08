package com.aspose.slides.cloud.examples.slides;

import java.io.Console;
import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.SlideBackground;
import com.aspose.slides.model.SlideBackgroundResponse;
import com.aspose.storage.api.StorageApi;

public class GetBackgroundPowerPointSlide {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "demo.pptx";
		int slideIndex = 1;
		String folder = "";
		String storage = "";
		Path inputFile = Utils.getPath(SavePowerPointDefautImage.class, fileName);

		try {
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
			// Upload source file to aspose cloud storage
			storageApi.PutCreate(fileName, "", "", inputFile.toFile());

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
