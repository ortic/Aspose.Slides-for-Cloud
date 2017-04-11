package com.aspose.storage.model;

public class FileExist {
  private Boolean IsExist = null;
  private Boolean IsFolder = null;
  /**
	 * getIsExist
	 * Gets Boolean
	 * @return IsExist
	 */
  public Boolean getIsExist() {
    return IsExist;
  }

	/**
	 * setIsExist
	 * Sets Boolean
	 * @param IsExist Boolean
	 */
  public void setIsExist(Boolean IsExist) {
    this.IsExist = IsExist;
  }

  /**
	 * getIsFolder
	 * Gets Boolean
	 * @return IsFolder
	 */
  public Boolean getIsFolder() {
    return IsFolder;
  }

	/**
	 * setIsFolder
	 * Sets Boolean
	 * @param IsFolder Boolean
	 */
  public void setIsFolder(Boolean IsFolder) {
    this.IsFolder = IsFolder;
  }

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class FileExist {\n");
    sb.append("  IsExist: ").append(IsExist).append("\n");
    sb.append("  IsFolder: ").append(IsFolder).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

