package com.aspose.slides.model;

import com.aspose.slides.model.ColorScheme;
public class ColorSchemeResponse {
  private ColorScheme ColorScheme = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getColorScheme
	 * Gets ColorScheme
	 * @return ColorScheme
	 */
  public ColorScheme getColorScheme() {
    return ColorScheme;
  }

	/**
	 * setColorScheme
	 * Sets ColorScheme
	 * @param ColorScheme ColorScheme
	 */
  public void setColorScheme(ColorScheme ColorScheme) {
    this.ColorScheme = ColorScheme;
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
    sb.append("class ColorSchemeResponse {\n");
    sb.append("  ColorScheme: ").append(ColorScheme).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

