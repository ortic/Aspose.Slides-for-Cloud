package com.aspose.slides.model;

import com.aspose.slides.model.Images;
public class ImagesResponse {
  private Images Images = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getImages
	 * Gets Images
	 * @return Images
	 */
  public Images getImages() {
    return Images;
  }

	/**
	 * setImages
	 * Sets Images
	 * @param Images Images
	 */
  public void setImages(Images Images) {
    this.Images = Images;
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
    sb.append("class ImagesResponse {\n");
    sb.append("  Images: ").append(Images).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

