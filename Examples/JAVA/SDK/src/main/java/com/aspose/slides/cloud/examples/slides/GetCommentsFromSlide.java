package com.aspose.slides.cloud.examples.slides;

import java.io.Console;
import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.SlideComment;
import com.aspose.slides.model.SlideComments;
import com.aspose.slides.model.SlideCommentsResponse;
import com.aspose.storage.api.StorageApi;

public class GetCommentsFromSlide {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		int slideIndex = 1;
		String folder = "";
		String storage = "";
		Path inputFile = Utils.getPath(GetCommentsFromSlide.class, fileName);

		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile.toFile());
		    // Invoke Aspose.Slides Cloud SDK API to get comments of a slide
		    SlideCommentsResponse apiResponse = slidesApi.GetSlidesSlideComments(fileName, slideIndex, folder, storage);

		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {
		        SlideComments slideComments = apiResponse.getSlideComments();
		        for (SlideComment slideComment : slideComments.getList())
		        {
		        	System.out.println("Author :: " + slideComment.getAuthor());
		        	System.out.println("Text :: " + slideComment.getText());
		        }
		        System.out.println("Get Comments of a PowerPoint Slide, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}
		//ExEnd: 1
	}
}
