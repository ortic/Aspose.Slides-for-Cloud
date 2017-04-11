package com.aspose.slides.model;

import com.aspose.slides.model.FormatScheme;
public class FormatSchemeResponse {
  private FormatScheme FormatScheme = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getFormatScheme
	 * Gets FormatScheme
	 * @return FormatScheme
	 */
  public FormatScheme getFormatScheme() {
    return FormatScheme;
  }

	/**
	 * setFormatScheme
	 * Sets FormatScheme
	 * @param FormatScheme FormatScheme
	 */
  public void setFormatScheme(FormatScheme FormatScheme) {
    this.FormatScheme = FormatScheme;
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
    sb.append("class FormatSchemeResponse {\n");
    sb.append("  FormatScheme: ").append(FormatScheme).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

