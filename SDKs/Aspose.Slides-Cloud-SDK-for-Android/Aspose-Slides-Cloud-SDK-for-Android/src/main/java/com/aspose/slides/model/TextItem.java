package com.aspose.slides.model;

import com.aspose.slides.model.ResourceUri;
public class TextItem {
  private ResourceUri Uri = null;
  private String Text = null;
  /**
	 * getUri
	 * Gets ResourceUri
	 * @return Uri
	 */
  public ResourceUri getUri() {
    return Uri;
  }

	/**
	 * setUri
	 * Sets ResourceUri
	 * @param Uri ResourceUri
	 */
  public void setUri(ResourceUri Uri) {
    this.Uri = Uri;
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

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class TextItem {\n");
    sb.append("  Uri: ").append(Uri).append("\n");
    sb.append("  Text: ").append(Text).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

