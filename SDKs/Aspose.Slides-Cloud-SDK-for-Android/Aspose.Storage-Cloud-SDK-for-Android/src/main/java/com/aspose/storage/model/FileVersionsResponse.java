package com.aspose.storage.model;

import java.util.*;
public class FileVersionsResponse {
  private List<FileVersion> FileVersions = new ArrayList<FileVersion>();
  private String Code = null;
  private String Status = null;
  /**
	 * getFileVersions
	 * Gets List<FileVersion>
	 * @return FileVersions
	 */
  public List<FileVersion> getFileVersions() {
    return FileVersions;
  }

	/**
	 * setFileVersions
	 * Sets List<FileVersion>
	 * @param FileVersions List<FileVersion>
	 */
  public void setFileVersions(List<FileVersion> FileVersions) {
    this.FileVersions = FileVersions;
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
    sb.append("class FileVersionsResponse {\n");
    sb.append("  FileVersions: ").append(FileVersions).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

