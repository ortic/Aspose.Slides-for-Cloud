package com.aspose.slides.cloud.examples.properties;

import java.io.Console;
import java.nio.file.Path;

import com.aspose.slides.api.SlidesApi;
import com.aspose.slides.cloud.examples.common.Configuration;
import com.aspose.slides.cloud.examples.common.Utils;
import com.aspose.slides.cloud.examples.shapes.ExtractParticularShape;
import com.aspose.slides.model.DocumentProperty;
import com.aspose.slides.model.DocumentPropertyResponse;
import com.aspose.storage.api.StorageApi;

public class SetDocumentProperties {

	public static void main(String[] args) {
		//ExStart: 1
		String fileName = "sample-input.pptx";
		String propertyName = "Author";
		String folder = "";
		String storage = "";
		DocumentProperty body = new DocumentProperty();
		body.setName("Author");
		body.setValue("Naeem Akram");
		body.setBuiltIn(true);
		Path inputFile = Utils.getPath(ExtractParticularShape.class, fileName);

		try {
			SlidesApi slidesApi = new SlidesApi(Configuration.apiKey, Configuration.appSID);
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

			// Upload source file to aspose cloud storage
			storageApi.PutCreate(fileName, "", "", inputFile.toFile());

			// Invoke Aspose.Slides Cloud SDK API to set document property
			DocumentPropertyResponse apiResponse = slidesApi.PutSlidesSetDocumentProperty(fileName, propertyName,
					folder, storage, body);

			if (apiResponse != null && apiResponse.getStatus().equals("OK")) {
				DocumentProperty docProperty = apiResponse.getDocumentProperty();
				System.out.println(docProperty.getName() + " :: " + docProperty.getValue());
				System.out.println("Set Document Properties, Done!");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		//ExEnd: 1
	}

}
