package com.aspose.slides.model;

import java.util.*;
import com.aspose.slides.model.ResourceUri;
public class Placeholders {
  private List<ResourceUri> PlaceholderLinks = new ArrayList<ResourceUri>();
  private ResourceUri SelfUri = null;
  private List<ResourceUri> AlternateLinks = new ArrayList<ResourceUri>();
  private List<ResourceUri> Links = new ArrayList<ResourceUri>();
  /**
	 * getPlaceholderLinks
	 * Gets List<ResourceUri>
	 * @return PlaceholderLinks
	 */
  public List<ResourceUri> getPlaceholderLinks() {
    return PlaceholderLinks;
  }

	/**
	 * setPlaceholderLinks
	 * Sets List<ResourceUri>
	 * @param PlaceholderLinks List<ResourceUri>
	 */
  public void setPlaceholderLinks(List<ResourceUri> PlaceholderLinks) {
    this.PlaceholderLinks = PlaceholderLinks;
  }

  /**
	 * getSelfUri
	 * Gets ResourceUri
	 * @return SelfUri
	 */
  public ResourceUri getSelfUri() {
    return SelfUri;
  }

	/**
	 * setSelfUri
	 * Sets ResourceUri
	 * @param SelfUri ResourceUri
	 */
  public void setSelfUri(ResourceUri SelfUri) {
    this.SelfUri = SelfUri;
  }

  /**
	 * getAlternateLinks
	 * Gets List<ResourceUri>
	 * @return AlternateLinks
	 */
  public List<ResourceUri> getAlternateLinks() {
    return AlternateLinks;
  }

	/**
	 * setAlternateLinks
	 * Sets List<ResourceUri>
	 * @param AlternateLinks List<ResourceUri>
	 */
  public void setAlternateLinks(List<ResourceUri> AlternateLinks) {
    this.AlternateLinks = AlternateLinks;
  }

  /**
	 * getLinks
	 * Gets List<ResourceUri>
	 * @return Links
	 */
  public List<ResourceUri> getLinks() {
    return Links;
  }

	/**
	 * setLinks
	 * Sets List<ResourceUri>
	 * @param Links List<ResourceUri>
	 */
  public void setLinks(List<ResourceUri> Links) {
    this.Links = Links;
  }

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class Placeholders {\n");
    sb.append("  PlaceholderLinks: ").append(PlaceholderLinks).append("\n");
    sb.append("  SelfUri: ").append(SelfUri).append("\n");
    sb.append("  AlternateLinks: ").append(AlternateLinks).append("\n");
    sb.append("  Links: ").append(Links).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

