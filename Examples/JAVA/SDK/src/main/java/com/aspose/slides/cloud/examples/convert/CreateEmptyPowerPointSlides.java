package com.aspose.slides.cloud.examples.convert;

import java.nio.file.Path;
import java.util.UUID;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.DocumentResponse;
import com.aspose.storage.api.StorageApi;

public class CreateEmptyPowerPointSlides {
	public static void main(String[] args) {
		//ExStart: 1
		// For complete examples and data files, please go to
		// https://github.com/aspose-slides/Aspose.Slides-for-Cloud
		SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
		StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		String fileName = "sample_empty_" + UUID.randomUUID() + ".pptx";
		String password = "";
		String storage = "";
		String folder = "";
		Path p1 = Utils.getPath(CreateEmptyPowerPointSlides.class, "sample.pptx");

		try {
			// Invoke Aspose.Slides Cloud SDK API to create empty presentation
			DocumentResponse apiResponse = slidesApi.PutNewPresentation(fileName, password, storage, folder,
					p1.toFile());

			if (apiResponse != null) {
				// Download document from storage server
				System.out.println("Create Empty PowerPoint Presentation, Done!");
			}
		} catch (Exception ex) {
			ex.printStackTrace();

		}
		//ExEnd: 1
	}
}
