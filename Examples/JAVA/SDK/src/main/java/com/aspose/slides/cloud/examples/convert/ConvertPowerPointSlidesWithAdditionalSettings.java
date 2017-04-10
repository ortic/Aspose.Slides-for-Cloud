package com.aspose.slides.cloud.examples.convert;

import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.model.ResponseMessage;
import com.aspose.storage.api.StorageApi;

public class ConvertPowerPointSlidesWithAdditionalSettings {

	public static void main(String[] args) {
		//ExStart: 1
		SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID); 
		StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

		String name = "sample";
		String fileName = name + ".pptx";
		String format = "pdf";
		Integer jpegQuality = 50;
		String password = "";
		String storage = "";
		String folder = "";
		String outPath = "";
		Path inputFile = Utils.getPath(ConvertPowerPointSlidesWithAdditionalSettings.class, fileName);

		try
		{
		    // Upload source file to aspose cloud storage
		    storageApi.PutCreate(fileName, "", "",inputFile.toFile());

		    // Invoke Aspose.Slides Cloud SDK API to convert document to other format with additional settings
		    ResponseMessage apiResponse = slidesApi.GetSlidesDocumentWithFormat(fileName, format, 
		    								jpegQuality, password, storage, folder, outPath);

		    if (apiResponse != null)
		    {
		    	 System.out.println("Convert PowerPoint Documents to other File Formats with Additional Settings, Done!");
		    }
		}
		catch (Exception ex)
		{
		    ex.printStackTrace();
		}
		//ExEnd: 1

	}

}
