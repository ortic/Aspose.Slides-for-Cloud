package com.aspose.slides.model;

import com.aspose.slides.model.Slide;
public class SlideStringReplaceResponse {
  private Slide Slide = null;
  private Integer Matches = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getSlide
	 * Gets Slide
	 * @return Slide
	 */
  public Slide getSlide() {
    return Slide;
  }

	/**
	 * setSlide
	 * Sets Slide
	 * @param Slide Slide
	 */
  public void setSlide(Slide Slide) {
    this.Slide = Slide;
  }

  /**
	 * getMatches
	 * Gets Integer
	 * @return Matches
	 */
  public Integer getMatches() {
    return Matches;
  }

	/**
	 * setMatches
	 * Sets Integer
	 * @param Matches Integer
	 */
  public void setMatches(Integer Matches) {
    this.Matches = Matches;
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
    sb.append("class SlideStringReplaceResponse {\n");
    sb.append("  Slide: ").append(Slide).append("\n");
    sb.append("  Matches: ").append(Matches).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

