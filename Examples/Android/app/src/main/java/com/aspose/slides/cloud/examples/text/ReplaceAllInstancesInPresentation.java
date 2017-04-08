package com.aspose.slides.cloud.examples.text;

import android.content.Context;

import java.io.File;
import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.PresentationStringReplaceResponse;
import com.aspose.storage.api.StorageApi;

public class ReplaceAllInstancesInPresentation {

	public static void  execute(Context context)  throws Exception {
		//ExStart: 1
		String fileName = "sampleinput.pptx";
		String oldValue = "aspose";
		String newValue = "aspose2";
		boolean ignoreCase = true;
		String folder = "";
		String storage = "";
		File inputFile = Utils.stream2file("sample-input","pptx", context.getResources().openRawResource(R.raw.sampleinput));

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",inputFile);

		    // Invoke Aspose.Slides Cloud SDK API to get all text instances from presentation
		    PresentationStringReplaceResponse apiResponse = slidesApi.PostSlidesPresentationReplaceText(fileName, oldValue, newValue, ignoreCase, folder, storage);

		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {
		       
		        System.out.println("Replace All Text Instances in a Presentation, Done!");
		
		    }
		}
		catch (Exception ex)
		{
		   ex.printStackTrace();

		}

		//ExEnd: 1
	}

}
