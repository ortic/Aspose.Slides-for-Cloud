package com.aspose.slides.model;

import java.util.*;
public class OrderedMergeRequest {
  private List<PresentationToMerge> Presentations = new ArrayList<PresentationToMerge>();
  /**
	 * getPresentations
	 * Gets List<PresentationToMerge>
	 * @return Presentations
	 */
  public List<PresentationToMerge> getPresentations() {
    return Presentations;
  }

	/**
	 * setPresentations
	 * Sets List<PresentationToMerge>
	 * @param Presentations List<PresentationToMerge>
	 */
  public void setPresentations(List<PresentationToMerge> Presentations) {
    this.Presentations = Presentations;
  }

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class OrderedMergeRequest {\n");
    sb.append("  Presentations: ").append(Presentations).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

