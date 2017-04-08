package com.aspose.slides.cloud.examples.properties;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.cloud.examples.shapes.ExtractParticularShape;
import com.aspose.slides.model.DocumentPropertiesResponse;
import com.aspose.slides.model.DocumentProperty;
import com.aspose.storage.api.StorageApi;


public class WorkingWithDocumentProperties {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		String folder = "";
		String storage = "";
		Path inputFile = Utils.getPath(WorkingWithDocumentProperties.class, fileName);

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID); 
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to get document properties
		    DocumentPropertiesResponse apiResponse = slidesApi.GetSlidesDocumentProperties(fileName, folder, storage);

		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {
		        for (DocumentProperty docProperty : apiResponse.getDocumentProperties().getList())
		        {
		            System.out.println(docProperty.getName() + " :: " + docProperty.getValue());
		        }
		        System.out.println("Get Document Properties, Done!");
		    }
		}
		catch (Exception ex)
		{
		   ex.printStackTrace();

		}
		//ExEnd: 1

	}

}
