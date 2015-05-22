package com.aspose.slides.model;

import com.aspose.slides.model.TextItems;
public class TextItemsResponse {
  private TextItems TextItems = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getTextItems
	 * Gets TextItems
	 * @return TextItems
	 */
  public TextItems getTextItems() {
    return TextItems;
  }

	/**
	 * setTextItems
	 * Sets TextItems
	 * @param TextItems TextItems
	 */
  public void setTextItems(TextItems TextItems) {
    this.TextItems = TextItems;
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
    sb.append("class TextItemsResponse {\n");
    sb.append("  TextItems: ").append(TextItems).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

