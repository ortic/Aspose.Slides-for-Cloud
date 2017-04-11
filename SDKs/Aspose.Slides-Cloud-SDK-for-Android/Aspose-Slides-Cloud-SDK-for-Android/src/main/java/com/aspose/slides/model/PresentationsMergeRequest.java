package com.aspose.slides.model;

import java.util.*;
public class PresentationsMergeRequest {
  private List<String> PresentationPaths = new ArrayList<String>();
  /**
	 * getPresentationPaths
	 * Gets List<String>
	 * @return PresentationPaths
	 */
  public List<String> getPresentationPaths() {
    return PresentationPaths;
  }

	/**
	 * setPresentationPaths
	 * Sets List<String>
	 * @param PresentationPaths List<String>
	 */
  public void setPresentationPaths(List<String> PresentationPaths) {
    this.PresentationPaths = PresentationPaths;
  }

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class PresentationsMergeRequest {\n");
    sb.append("  PresentationPaths: ").append(PresentationPaths).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

