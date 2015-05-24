package com.aspose.slides.model;

import java.util.*;
import com.aspose.slides.model.ResourceUri;
import com.aspose.slides.model.FontSet;
public class FontScheme {
  private FontSet Major = null;
  private FontSet Minor = null;
  private String Name = null;
  private ResourceUri SelfUri = null;
  private List<ResourceUri> AlternateLinks = new ArrayList<ResourceUri>();
  private List<ResourceUri> Links = new ArrayList<ResourceUri>();
  /**
	 * getMajor
	 * Gets FontSet
	 * @return Major
	 */
  public FontSet getMajor() {
    return Major;
  }

	/**
	 * setMajor
	 * Sets FontSet
	 * @param Major FontSet
	 */
  public void setMajor(FontSet Major) {
    this.Major = Major;
  }

  /**
	 * getMinor
	 * Gets FontSet
	 * @return Minor
	 */
  public FontSet getMinor() {
    return Minor;
  }

	/**
	 * setMinor
	 * Sets FontSet
	 * @param Minor FontSet
	 */
  public void setMinor(FontSet Minor) {
    this.Minor = Minor;
  }

  /**
	 * getName
	 * Gets String
	 * @return Name
	 */
  public String getName() {
    return Name;
  }

	/**
	 * setName
	 * Sets String
	 * @param Name String
	 */
  public void setName(String Name) {
    this.Name = Name;
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
    sb.append("class FontScheme {\n");
    sb.append("  Major: ").append(Major).append("\n");
    sb.append("  Minor: ").append(Minor).append("\n");
    sb.append("  Name: ").append(Name).append("\n");
    sb.append("  SelfUri: ").append(SelfUri).append("\n");
    sb.append("  AlternateLinks: ").append(AlternateLinks).append("\n");
    sb.append("  Links: ").append(Links).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

