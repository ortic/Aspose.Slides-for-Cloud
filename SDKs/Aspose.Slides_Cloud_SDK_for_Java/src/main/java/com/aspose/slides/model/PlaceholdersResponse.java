package com.aspose.slides.model;

import com.aspose.slides.model.Placeholders;
public class PlaceholdersResponse {
  private Placeholders Placeholders = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getPlaceholders
	 * Gets Placeholders
	 * @return Placeholders
	 */
  public Placeholders getPlaceholders() {
    return Placeholders;
  }

	/**
	 * setPlaceholders
	 * Sets Placeholders
	 * @param Placeholders Placeholders
	 */
  public void setPlaceholders(Placeholders Placeholders) {
    this.Placeholders = Placeholders;
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
    sb.append("class PlaceholdersResponse {\n");
    sb.append("  Placeholders: ").append(Placeholders).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

