package com.aspose.slides.cloud.examples.text;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.TextItemsResponse;
import com.aspose.storage.api.StorageApi;

public class GetAllTextFromDocument {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		boolean withEmpty = false;
		String folder = "";
		String storage = "";

		Path inputFile = Utils.getPath(GetAllTextFromDocument.class, fileName);

		try {
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

			// Upload source file to aspose cloud storage
			storageApi.PutCreate(fileName, "", "", inputFile.toFile());

			// Invoke Aspose.Slides Cloud SDK API to get all text items from a
			// presentation
			TextItemsResponse apiResponse = slidesApi.GetSlidesPresentationTextItems(fileName, withEmpty, folder,
					storage);

			if (apiResponse != null && apiResponse.getStatus().equals("OK")) {
				System.out.println("Get All Text Items from a Presentation, Done!");
			}
		} catch (Exception ex) {
			ex.printStackTrace();

		}
		//ExEnd: 1
	}

}
