package com.aspose.slides.cloud.examples.convert;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.DocumentResponse;
import com.aspose.slides.model.PresentationsMergeRequest;
import com.aspose.storage.api.StorageApi;

public class MergePowerPointDocuments {

	public static void main(String[] args) {
		//ExStart: 1
		// For complete examples and data files, please go to https://github.com/aspose-slides/Aspose.Slides-for-Cloud
		SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID); 
		StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		String fileName = "sample.pptx";
		String storage = "";
		String folder = "";

		String mergeFile1 = "sample-input.pptx";
		String mergeFile2 = "demo.pptx";

		Path p0=Utils.getPath(MergePowerPointDocuments.class, fileName);
		Path p1=Utils.getPath(MergePowerPointDocuments.class, mergeFile1);
		Path p2=Utils.getPath(MergePowerPointDocuments.class, mergeFile2);
		
		PresentationsMergeRequest body = new PresentationsMergeRequest();
		body.setPresentationPaths( new ArrayList<String> ( Arrays.asList(new String[]{mergeFile1,mergeFile2})));

		try
		{
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",p0.toFile());
		    storageApi.PutCreate(mergeFile1, null, null, p1.toFile());
		    storageApi.PutCreate(mergeFile2, null, null, p2.toFile());

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
