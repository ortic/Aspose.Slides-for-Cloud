package com.aspose.slides.cloud.examples.convert;

import android.content.Context;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import com.aspose.slides.cloud.examples.R;
import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.DocumentResponse;
import com.aspose.slides.model.PresentationsMergeRequest;
import com.aspose.storage.api.StorageApi;

public class MergePowerPointDocuments {

	public static void execute(Context context) throws Exception{
		//ExStart: 1
		// For complete examples and data files, please go to https://github.com/aspose-slides/Aspose.Slides-for-Cloud
		SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID); 
		StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		String fileName = "sample.pptx";
		String storage = "";
		String folder = "";

		String mergeFile1 = "sampleinput.pptx";
		String mergeFile2 = "demo.pptx";

		File p0 = Utils.stream2file("sample","pptx", context.getResources().openRawResource(R.raw.sample));
		File p1 = Utils.stream2file("sample_input","pptx", context.getResources().openRawResource(R.raw.sampleinput));
		File p2 = Utils.stream2file("demo","pptx", context.getResources().openRawResource(R.raw.demo));


		PresentationsMergeRequest body = new PresentationsMergeRequest();
		body.setPresentationPaths( new ArrayList<String> ( Arrays.asList(new String[]{mergeFile1,mergeFile2})));

		try
		{
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",p0);
		    storageApi.PutCreate(mergeFile1, null, null, p1);
		    storageApi.PutCreate(mergeFile2, null, null, p2);

		    // Invoke Aspose.Slides Cloud SDK to merge PowerPoint presentations
		    DocumentResponse apiResponse = slidesApi.PostPresentationMerge(fileName, storage, folder, body);

		    if (apiResponse != null)
		    {
		        
		       System.out.println("Merge PowerPoint Presentations, Done!");
		        
		    }
		}
		catch (Exception ex)
		{
		   ex.printStackTrace();

		}
		//ExEnd: 1
	}

}
