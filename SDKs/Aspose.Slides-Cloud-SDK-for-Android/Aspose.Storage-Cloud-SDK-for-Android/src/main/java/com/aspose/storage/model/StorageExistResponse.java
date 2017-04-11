package com.aspose.storage.model;

public class StorageExistResponse {
  private Boolean IsExist = null;
  private String Code = null;
  private String Status = null;
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
    sb.append("class StorageExistResponse {\n");
    sb.append("  IsExist: ").append(IsExist).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

