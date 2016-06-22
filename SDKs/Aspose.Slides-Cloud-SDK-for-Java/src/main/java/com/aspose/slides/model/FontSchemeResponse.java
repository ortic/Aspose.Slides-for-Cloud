package com.aspose.slides.model;

import com.aspose.slides.model.FontScheme;
public class FontSchemeResponse {
  private FontScheme FontScheme = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getFontScheme
	 * Gets FontScheme
	 * @return FontScheme
	 */
  public FontScheme getFontScheme() {
    return FontScheme;
  }

	/**
	 * setFontScheme
	 * Sets FontScheme
	 * @param FontScheme FontScheme
	 */
  public void setFontScheme(FontScheme FontScheme) {
    this.FontScheme = FontScheme;
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
    sb.append("class FontSchemeResponse {\n");
    sb.append("  FontScheme: ").append(FontScheme).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

