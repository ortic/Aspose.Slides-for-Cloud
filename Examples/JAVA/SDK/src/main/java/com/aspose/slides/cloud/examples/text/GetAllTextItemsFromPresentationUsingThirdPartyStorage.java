package com.aspose.slides.cloud.examples.text;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.TextItem;
import com.aspose.slides.model.TextItemsResponse;
import com.aspose.storage.api.StorageApi;

public class GetAllTextItemsFromPresentationUsingThirdPartyStorage {

	public static void main(String[] args) {
		//ExStart: 1
		// For complete examples and data files, please go to https://github.com/aspose-slides/Aspose.Slides-for-Cloud
		SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
		StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		String fileName = "sample-input.pptx";
		boolean withEmpty = false;
		String folder = "";
		String storage = "dropboxstorage";

		Path inputFile = Utils.getPath(GetAllTextFromSlide.class, fileName);

		try
		{
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to get all text items from presentation using third party storage
		    TextItemsResponse apiResponse = slidesApi.GetSlidesPresentationTextItems(fileName, withEmpty, folder, storage);

		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {
		        for (TextItem textItem : apiResponse.getTextItems().getItems())
		        {
		        	 System.out.println("Text :: " + textItem.getText());
		        }
		        System.out.println("Get All Text Items from a Presentation Using Third Party Storage, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();

		}
		//ExEnd: 1
	}

}
