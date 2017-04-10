package com.aspose.slides.cloud.examples.slides;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.FontScheme;
import com.aspose.slides.model.FontSchemeResponse;
import com.aspose.storage.api.StorageApi;

public class GetFontSchemePowerpointSlide {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "demo.pptx";
		int slideIndex = 1;
		String folder = "";
		String storage = "";
		Path inputFile = Utils.getPath(GetFontSchemePowerpointSlide.class, fileName);
		try
		{
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "", inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to get slide font scheme
		    FontSchemeResponse apiResponse = slidesApi.GetSlidesThemeFontScheme(fileName, slideIndex, folder, storage);

		    if (apiResponse != null && apiResponse.getStatus().equals("OK"))
		    {
		        FontScheme fontScheme = apiResponse.getFontScheme();
		        System.out.println("Name: " + fontScheme.getName());
		        System.out.println("ComplexScript (heading part) : " + fontScheme.getMajor().getComplexScript());
		        System.out.println("EastAsian (heading part) : " + fontScheme.getMajor().getEastAsian());
		        System.out.println("Latin (heading part) : " + fontScheme.getMajor().getLatin());
		        System.out.println("ComplexScript (body part) : " + fontScheme.getMinor().getComplexScript());
		        System.out.println("EastAsian (body part) : " + fontScheme.getMinor().getEastAsian());
		        System.out.println("Latin (body part) : " + fontScheme.getMinor().getLatin());
		        System.out.println("Get Font Scheme of a PowerPoint Slide, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}
		//ExEnd: 1
	}
}
