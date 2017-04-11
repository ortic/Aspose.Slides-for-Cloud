package com.aspose.slides.model;

public class SlideResponse {
  private Slide Slide = null;
  private String Code = null;
  private String Status = null;
  
  public Slide getSlide() {
   return Slide;
}

public void setSlide(Slide slide) {
   Slide = slide;
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

}

