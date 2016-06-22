package com.aspose.slides.model;

import java.util.*;
import com.aspose.slides.model.ResourceUri;
public class SlideBackground {
  private String Type = null;
  private ResourceUri SelfUri = null;
  private List<ResourceUri> AlternateLinks = new ArrayList<ResourceUri>();
  private List<ResourceUri> Links = new ArrayList<ResourceUri>();
  /**
	 * getType
	 * Gets String
	 * @return Type
	 */
  public String getType() {
    return Type;
  }

	/**
	 * setType
	 * Sets String
	 * @param Type String
	 */
  public void setType(String Type) {
    this.Type = Type;
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
    sb.append("class SlideBackground {\n");
    sb.append("  Type: ").append(Type).append("\n");
    sb.append("  SelfUri: ").append(SelfUri).append("\n");
    sb.append("  AlternateLinks: ").append(AlternateLinks).append("\n");
    sb.append("  Links: ").append(Links).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

