package com.aspose.slides.model;

import java.util.*;
public class PresentationToMerge {
  private String Path = null;
  private List<Integer> Slides = new ArrayList<Integer>();
  /**
	 * getPath
	 * Gets String
	 * @return Path
	 */
  public String getPath() {
    return Path;
  }

	/**
	 * setPath
	 * Sets String
	 * @param Path String
	 */
  public void setPath(String Path) {
    this.Path = Path;
  }

  /**
	 * getSlides
	 * Gets List<Integer>
	 * @return Slides
	 */
  public List<Integer> getSlides() {
    return Slides;
  }

	/**
	 * setSlides
	 * Sets List<Integer>
	 * @param Slides List<Integer>
	 */
  public void setSlides(List<Integer> Slides) {
    this.Slides = Slides;
  }

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class PresentationToMerge {\n");
    sb.append("  Path: ").append(Path).append("\n");
    sb.append("  Slides: ").append(Slides).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

