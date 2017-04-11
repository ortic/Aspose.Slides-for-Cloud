package com.aspose.slides.model;

import com.aspose.slides.model.Slides;
public class SlideListResponse {
  private Slides Slides = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getSlides
	 * Gets Slides
	 * @return Slides
	 */
  public Slides getSlides() {
    return Slides;
  }

	/**
	 * setSlides
	 * Sets Slides
	 * @param Slides Slides
	 */
  public void setSlides(Slides Slides) {
    this.Slides = Slides;
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
    sb.append("class SlideListResponse {\n");
    sb.append("  Slides: ").append(Slides).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

