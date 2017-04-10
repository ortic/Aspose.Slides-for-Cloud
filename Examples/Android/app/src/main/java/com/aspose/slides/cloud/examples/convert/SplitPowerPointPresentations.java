package com.aspose.slides.cloud.examples.convert;

import android.content.Context;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.SplitDocumentResponse;
import com.aspose.storage.api.StorageApi;

import java.io.File;

public class SplitPowerPointPresentations {

	public static void execute(Context context)  throws Exception {
		//ExStart: 1
		String fileName = "sampleinput.pptx";
		int width = 0;
		int height = 0;
		int from = 2;
		int to = 3;
		String destFolder = "";
		String format = "png";
		String storage = "";
		String folder = "";

		File inputFile = Utils.stream2file("sample","pptx", context.getResources().openRawResource(R.raw.sample));
		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID); 
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);


		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile);

		    // Invoke Aspose.Slides Cloud SDK API to split powerpoint presentations
		    SplitDocumentResponse apiResponse = slidesApi.
		    										PostSlidesSplit(fileName, width, height, to, from, destFolder, format, storage, folder);

		    if (apiResponse != null)
		    {
		       
		        System.out.println("Split PowerPoint Presentations, Done!");
		        
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}
		//ExEnd: 1
	}

}
