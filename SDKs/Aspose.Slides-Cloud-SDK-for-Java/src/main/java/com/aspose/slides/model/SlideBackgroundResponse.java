package com.aspose.slides.model;

import com.aspose.slides.model.SlideBackground;
public class SlideBackgroundResponse {
  private SlideBackground Background = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getBackground
	 * Gets SlideBackground
	 * @return Background
	 */
  public SlideBackground getBackground() {
    return Background;
  }

	/**
	 * setBackground
	 * Sets SlideBackground
	 * @param Background SlideBackground
	 */
  public void setBackground(SlideBackground Background) {
    this.Background = Background;
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
    sb.append("class SlideBackgroundResponse {\n");
    sb.append("  Background: ").append(Background).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

