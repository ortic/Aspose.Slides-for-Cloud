package com.aspose.slides.cloud.examples.images;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.cloud.examples.shapes.ExtractParticularShape;
import com.aspose.slides.model.ImagesResponse;
import com.aspose.storage.api.StorageApi;

public class GetNumberOfImagesPresentation {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		String folder = "";
		String storage = "";

		Path inputFile = Utils.getPath(ExtractParticularShape.class, fileName);

		try {
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

			// Upload source file to aspose cloud storage
			storageApi.PutCreate(fileName, "", "", inputFile.toFile());

			// Invoke Aspose.Slides Cloud SDK API to get number of images in a
			// presentation
			ImagesResponse apiResponse = slidesApi.GetSlidesImages(fileName,folder, storage);

			if (apiResponse != null) {
				int count = apiResponse.getImages().getList().size();
				System.out.println("Total Images Found :: " + count);
				System.out.println("Get Number of Images in a Presentation, Done!");
			
			}
		} catch (Exception ex) {
			ex.printStackTrace();

		}
		//ExEnd: 1

	}

}
