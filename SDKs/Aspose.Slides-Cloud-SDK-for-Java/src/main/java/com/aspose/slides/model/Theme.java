package com.aspose.slides.model;

import java.util.*;
import com.aspose.slides.model.ResourceUri;
import com.aspose.slides.model.ResourceUriElement;
public class Theme {
  private String Name = null;
  private ResourceUriElement ColorScheme = null;
  private ResourceUriElement FontScheme = null;
  private ResourceUriElement FormatScheme = null;
  private ResourceUri SelfUri = null;
  private List<ResourceUri> AlternateLinks = new ArrayList<ResourceUri>();
  private List<ResourceUri> Links = new ArrayList<ResourceUri>();
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
	 * getColorScheme
	 * Gets ResourceUriElement
	 * @return ColorScheme
	 */
  public ResourceUriElement getColorScheme() {
    return ColorScheme;
  }

	/**
	 * setColorScheme
	 * Sets ResourceUriElement
	 * @param ColorScheme ResourceUriElement
	 */
  public void setColorScheme(ResourceUriElement ColorScheme) {
    this.ColorScheme = ColorScheme;
  }

  /**
	 * getFontScheme
	 * Gets ResourceUriElement
	 * @return FontScheme
	 */
  public ResourceUriElement getFontScheme() {
    return FontScheme;
  }

	/**
	 * setFontScheme
	 * Sets ResourceUriElement
	 * @param FontScheme ResourceUriElement
	 */
  public void setFontScheme(ResourceUriElement FontScheme) {
    this.FontScheme = FontScheme;
  }

  /**
	 * getFormatScheme
	 * Gets ResourceUriElement
	 * @return FormatScheme
	 */
  public ResourceUriElement getFormatScheme() {
    return FormatScheme;
  }

	/**
	 * setFormatScheme
	 * Sets ResourceUriElement
	 * @param FormatScheme ResourceUriElement
	 */
  public void setFormatScheme(ResourceUriElement FormatScheme) {
    this.FormatScheme = FormatScheme;
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
    sb.append("class Theme {\n");
    sb.append("  Name: ").append(Name).append("\n");
    sb.append("  ColorScheme: ").append(ColorScheme).append("\n");
    sb.append("  FontScheme: ").append(FontScheme).append("\n");
    sb.append("  FormatScheme: ").append(FormatScheme).append("\n");
    sb.append("  SelfUri: ").append(SelfUri).append("\n");
    sb.append("  AlternateLinks: ").append(AlternateLinks).append("\n");
    sb.append("  Links: ").append(Links).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

