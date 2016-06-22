package com.aspose.slides.model;

import com.aspose.slides.model.ResourceUri;
public class ResourceUriElement {
  private ResourceUri Uri = null;
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

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class ResourceUriElement {\n");
    sb.append("  Uri: ").append(Uri).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

