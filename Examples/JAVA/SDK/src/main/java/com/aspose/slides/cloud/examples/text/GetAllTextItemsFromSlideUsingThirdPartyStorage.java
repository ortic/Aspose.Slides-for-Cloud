package com.aspose.slides.cloud.examples.text;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.TextItem;
import com.aspose.slides.model.TextItemsResponse;
import com.aspose.storage.api.StorageApi;

public class GetAllTextItemsFromSlideUsingThirdPartyStorage {

	public static void main(String[] args) {
		//ExStart: 1
		SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
		StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		String fileName = "sample-input.pptx";
		int slideIndex = 1;
		Boolean withEmpty = false;
		String folder = "";
		String storage = "dropboxstorage";

		Path inputFile = Utils.getPath(GetAllTextItemsFromSlideUsingThirdPartyStorage.class, fileName);

		try
		{
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",inputFile.toFile());

		    // Invoke Aspose.PDF Cloud SDK API to get all text items from a slide using third party storage
		    TextItemsResponse apiResponse = slidesApi.GetSlidesSlideTextItems(fileName, slideIndex, withEmpty, folder, storage);

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
