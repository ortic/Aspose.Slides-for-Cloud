package com.aspose.storage;

import org.junit.Test;

import static org.junit.Assert.*;

import com.aspose.storage.api.StorageApi;
import com.aspose.storage.client.ApiException;
import com.aspose.storage.model.DiscUsage;
import com.aspose.storage.model.DiscUsageResponse;
import com.aspose.storage.model.FileExistResponse;
import com.aspose.storage.model.MoveFileResponse;
import com.aspose.storage.model.MoveFolderResponse;
import com.aspose.storage.model.RemoveFileResponse;
import com.aspose.storage.model.RemoveFolderResponse;
import com.aspose.storage.model.ResponseMessage;
import com.aspose.storage.model.StorageExistResponse;

import java.io.File;
/**
 * To work on unit tests, switch the Test Artifact in the Build Variants view.
 */
public class StorageUnitTest {

    public StorageApi storageApi;
    public String BASE_URL;
    public String APP_SID;
    public String APP_KEY;

    public StorageUnitTest(){

        BASE_URL = "http://api.aspose.cloud/v1.1";
        APP_SID = "****";
        APP_KEY = "****";

        storageApi = new StorageApi(BASE_URL,APP_KEY,APP_SID);
    }

    @Test
    public void GetDiscUsage() throws ApiException {

        DiscUsageResponse response = null;

        try {
            response = storageApi.GetDiscUsage(null);
            assertEquals("200",response.getCode());
            assertEquals(DiscUsage.class,response.getDiscUsage().getClass());
        } catch (ApiException ex) {
            ex.printStackTrace();
        }
    }

    @Test
    public void PutCreateFolder() throws ApiException {

        ResponseMessage response = null;

        try {
            response = storageApi.PutCreateFolder("AndroidTestFolder",null,null);
            assertEquals(200, response.getCode().intValue());
        } catch (ApiException ex) {
            ex.printStackTrace();
        }

    }

    @Test
    public void PutCreate() throws Exception {

        ResponseMessage response = null;

        try {
            response = storageApi.PutCreate("AndroidTestFolder/SampleWordDocument.docx", "", "", new File(StorageApi.class.getResource("/SampleWordDocument.docx").toURI()));
            assertEquals(200, response.getCode().intValue());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    @Test
    public void GetDownload() throws ApiException {

        ResponseMessage response = null;

        try {
            response = storageApi.GetDownload("AndroidTestFolder/SampleWordDocument.docx", "", "");
            assertEquals(200, response.getCode().intValue());
        } catch (ApiException ex) {
            ex.printStackTrace();
        }

    }

    @Test
    public void GetIsExist() throws ApiException {

        FileExistResponse response = null;

        try {
            response = storageApi.GetIsExist("AndroidTestFolder/SampleWordDocument.docx", "", "");
            assertEquals("200", response.getCode());
        } catch (ApiException ex) {
            ex.printStackTrace();
        }

    }

    @Test
    public void GetIsStorageExist() throws ApiException {

        StorageExistResponse response = null;

        try {
            response = storageApi.GetIsStorageExist("Aspose123");
            assertEquals("200", response.getCode());
        } catch (ApiException ex) {
            ex.printStackTrace();
        }

    }


    @Test
    public void PostMoveFile() throws Exception {

        ResponseMessage response_create = null;
        MoveFileResponse response_move = null;

        try {
            response_create = storageApi.PutCreate("SampleWordDocument.docx","","",new File(StorageApi.class.getResource("/SampleWordDocument.docx").toURI()));
            response_move = storageApi.PostMoveFile("SampleWordDocument.docx", "AndroidTestFolder/MovedSampleWordDocument.docx", "", "", "");
            assertEquals("200", response_move.getCode());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    @Test
    public void PostMoveFolder() throws Exception {

        ResponseMessage response_create = null;
        MoveFolderResponse response_move = null;

        try {
            response_create = storageApi.PutCreateFolder("AnotherAndroidTest", "", "");
            response_move = storageApi.PostMoveFolder("AnotherAndroidTest", "AndroidTestFolder/AnotherAndroidTest", "", "");
            assertEquals("200", response_move.getCode());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    @Test
    public void PutCopyFile() throws Exception {

         ResponseMessage response = null;

        try {
            response = storageApi.PutCopy("AndroidTestFolder/MovedSampleWordDocument.docx", "SampleWordDocument.docx", "", "", "", new File(StorageApi.class.getResource("/SampleWordDocument.docx").toURI()));
            assertEquals(200, response.getCode().intValue());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    @Test
    public void PutCopyFolder() throws Exception {

        ResponseMessage response = null;

        try {
            response = storageApi.PutCopyFolder("AndroidTestFolder/AnotherAndroidTest", "CopiedAndroidTest", "", "");
            assertEquals(200, response.getCode().intValue());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    @Test
    public void GetListFiles() throws ApiException {

        ResponseMessage response = null;

        try {
            response = storageApi.GetListFiles("AndroidTestFolder", null);
            assertEquals(200, response.getCode().intValue());
        } catch (ApiException ex) {
            ex.printStackTrace();
        }

    }

    @Test
    public void DeleteFolder() throws ApiException {

        RemoveFolderResponse response = null;

        try {
            response = storageApi.DeleteFolder("AndroidTestFolder/AnotherAndroidTest", "", false);
            assertEquals("200", response.getCode());
        } catch (ApiException ex) {
            ex.printStackTrace();
        }

    }

    @Test
    public void DeleteFile() throws ApiException {

        RemoveFileResponse response = null;

        try {
            response = storageApi.DeleteFile("AndroidTestFolder/MovedSampleWordDocument.docx", "","");
            assertEquals("200", response.getCode());
        } catch (ApiException ex) {
            ex.printStackTrace();
        }

    }


}
