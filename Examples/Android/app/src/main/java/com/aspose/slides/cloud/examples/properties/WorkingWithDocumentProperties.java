package com.aspose.slides.cloud.examples.properties;

import android.content.Context;

import java.io.Console;
import java.io.File;
import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.cloud.examples.shapes.ExtractParticularShape;
import com.aspose.slides.model.DocumentPropertiesResponse;
import com.aspose.slides.model.DocumentProperty;
import com.aspose.storage.api.StorageApi;


public class WorkingWithDocumentProperties {

	public static void execute(Context context)  throws Exception{
		//ExStart: 1
		String fileName = "sampleinput.pptx";
		String folder = "";
		String storage = "";
		File inputFile = Utils.stream2file("sample","pptx", context.getResources().openRawResource(R.raw.sample));

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID); 
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile);

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
