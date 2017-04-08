package com.aspose.slides.cloud.examples.convert;

import android.content.Context;
import java.io.File;
import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.ResponseMessage;
import com.aspose.storage.api.StorageApi;

public class ConvertPowerPointDocuments {

	public static void execute(Context context) throws Exception {
		//ExStart: 1
		SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID); 
		StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);


		String name = "sample";
		String fileName = name + ".pptx";
		String password = "";
		String format = "pdf";
		String outPath = "";
		File inputFile = Utils.stream2file("sample","pptx", context.getResources().openRawResource(R.raw.sample));
		
		try
		{
		    // Invoke Aspose.Slides Cloud SDK API to convert document to other format using storage
		    ResponseMessage apiResponse = slidesApi.PutSlidesConvert(password, format, outPath, inputFile);

		    if (apiResponse != null)
		    {
		        System.out.println("Convert PowerPoint Documents to other File Formats without Using Storage, Done!");
		    }
		}
		catch (Exception ex)
		{
		   ex.printStackTrace();

		}
		//ExEnd: 1

	}

}
