package com.aspose.slides.cloud.examples.images;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.ImagesResponse;
import com.aspose.storage.api.StorageApi;

public class GetNumberImagesSlidesThirdPartyStorage {

	public static void main(String[] args) {
		//ExStart: 1
		// For complete examples and data files, please go to https://github.com/aspose-slides/Aspose.Slides-for-Cloud
		SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
		StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		String fileName = "sample-input.pptx";
		int slideIndex = 3;
		String folder = "";
		String storage = "dropboxstorage";
		Path inputFile = Utils.getPath(GetNumberImagesSlidesThirdPartyStorage.class, fileName);

		try
		{
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to get number of images in a slide using third party storage
		    ImagesResponse apiResponse = slidesApi.GetSlidesSlideImages(fileName, slideIndex, folder, storage);

		    if (apiResponse != null)
		    {
		    	int count = apiResponse.getImages().getList().size();
				System.out.println("Total Images Found :: " + count);
				System.out.println("Get Number of Images in a Presentation, Done!");
		    }
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		//ExEnd: 1

	}

}
