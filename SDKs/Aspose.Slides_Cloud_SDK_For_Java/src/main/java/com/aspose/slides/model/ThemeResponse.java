package com.aspose.slides.model;

import com.aspose.slides.model.Theme;
public class ThemeResponse {
  private Theme Theme = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getTheme
	 * Gets Theme
	 * @return Theme
	 */
  public Theme getTheme() {
    return Theme;
  }

	/**
	 * setTheme
	 * Sets Theme
	 * @param Theme Theme
	 */
  public void setTheme(Theme Theme) {
    this.Theme = Theme;
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
    sb.append("class ThemeResponse {\n");
    sb.append("  Theme: ").append(Theme).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

