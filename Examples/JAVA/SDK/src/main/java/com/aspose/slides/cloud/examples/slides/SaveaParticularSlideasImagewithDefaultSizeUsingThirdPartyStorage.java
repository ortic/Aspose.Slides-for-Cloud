package com.aspose.slides.cloud.examples.slides;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.ResponseMessage;
import com.aspose.storage.api.StorageApi;

public class SaveaParticularSlideasImagewithDefaultSizeUsingThirdPartyStorage {

	public static void main(String[] args) {
		
		//ExStart: 1
		String name = "sample-input";
		String fileName = name + ".pptx";
		int slideIndex = 3;
		String format = "jpeg";
		int width = 0;
		int height = 0;
		String folder = "";
		String storage = "dropboxstorage";
		Path inputFile = Utils.getPath(SaveaParticularSlideasImagewithDefaultSizeUsingThirdPartyStorage.class, fileName);

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to save slide as image with default size using third party storage
		    ResponseMessage apiResponse = slidesApi.GetSlideWithFormat(fileName, slideIndex, format, width, height, folder, storage);

		    if (apiResponse != null)
		    {                    
		        System.out.println("Save a Particular Slide as Image with Default Size Using Third Party Storage, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}
		//ExEnd: 1
	}
}
