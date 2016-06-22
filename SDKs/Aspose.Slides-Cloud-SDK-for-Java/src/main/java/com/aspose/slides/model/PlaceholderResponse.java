package com.aspose.slides.model;

import com.aspose.slides.model.Placeholder;
public class PlaceholderResponse {
  private Placeholder Placeholder = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getPlaceholder
	 * Gets Placeholder
	 * @return Placeholder
	 */
  public Placeholder getPlaceholder() {
    return Placeholder;
  }

	/**
	 * setPlaceholder
	 * Sets Placeholder
	 * @param Placeholder Placeholder
	 */
  public void setPlaceholder(Placeholder Placeholder) {
    this.Placeholder = Placeholder;
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
    sb.append("class PlaceholderResponse {\n");
    sb.append("  Placeholder: ").append(Placeholder).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

