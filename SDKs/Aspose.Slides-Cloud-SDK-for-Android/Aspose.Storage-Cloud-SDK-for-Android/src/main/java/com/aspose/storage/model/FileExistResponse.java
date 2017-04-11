package com.aspose.storage.model;

import com.aspose.storage.model.FileExist;
public class FileExistResponse {
  private FileExist FileExist = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getFileExist
	 * Gets FileExist
	 * @return FileExist
	 */
  public FileExist getFileExist() {
    return FileExist;
  }

	/**
	 * setFileExist
	 * Sets FileExist
	 * @param FileExist FileExist
	 */
  public void setFileExist(FileExist FileExist) {
    this.FileExist = FileExist;
  }

  /**
	 * getCode
	 * Gets String
	 * @return Code
	 */
  public String getCode() {
    return Code;
  }

	/**
	 * setCode
	 * Sets String
	 * @param Code String
	 */
  public void setCode(String Code) {
    this.Code = Code;
  }

  /**
	 * getStatus
	 * Gets String
	 * @return Status
	 */
  public String getStatus() {
    return Status;
  }

	/**
	 * setStatus
	 * Sets String
	 * @param Status String
	 */
  public void setStatus(String Status) {
    this.Status = Status;
  }

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class FileExistResponse {\n");
    sb.append("  FileExist: ").append(FileExist).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

