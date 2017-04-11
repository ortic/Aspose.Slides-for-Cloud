package com.aspose.storage.model;

import com.aspose.storage.model.DiscUsage;
public class DiscUsageResponse {
  private DiscUsage DiscUsage = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getDiscUsage
	 * Gets DiscUsage
	 * @return DiscUsage
	 */
  public DiscUsage getDiscUsage() {
    return DiscUsage;
  }

	/**
	 * setDiscUsage
	 * Sets DiscUsage
	 * @param DiscUsage DiscUsage
	 */
  public void setDiscUsage(DiscUsage DiscUsage) {
    this.DiscUsage = DiscUsage;
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
    sb.append("class DiscUsageResponse {\n");
    sb.append("  DiscUsage: ").append(DiscUsage).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

