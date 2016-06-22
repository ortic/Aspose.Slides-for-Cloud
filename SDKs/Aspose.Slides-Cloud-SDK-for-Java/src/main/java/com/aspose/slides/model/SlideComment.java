package com.aspose.slides.model;

public class SlideComment {
  private String Author = null;
  private String Text = null;
  private String CreatedTime = null;
  /**
	 * getAuthor
	 * Gets String
	 * @return Author
	 */
  public String getAuthor() {
    return Author;
  }

	/**
	 * setAuthor
	 * Sets String
	 * @param Author String
	 */
  public void setAuthor(String Author) {
    this.Author = Author;
  }

  /**
	 * getText
	 * Gets String
	 * @return Text
	 */
  public String getText() {
    return Text;
  }

	/**
	 * setText
	 * Sets String
	 * @param Text String
	 */
  public void setText(String Text) {
    this.Text = Text;
  }

  /**
	 * getCreatedTime
	 * Gets String
	 * @return CreatedTime
	 */
  public String getCreatedTime() {
    return CreatedTime;
  }

	/**
	 * setCreatedTime
	 * Sets String
	 * @param CreatedTime String
	 */
  public void setCreatedTime(String CreatedTime) {
    this.CreatedTime = CreatedTime;
  }

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class SlideComment {\n");
    sb.append("  Author: ").append(Author).append("\n");
    sb.append("  Text: ").append(Text).append("\n");
    sb.append("  CreatedTime: ").append(CreatedTime).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

