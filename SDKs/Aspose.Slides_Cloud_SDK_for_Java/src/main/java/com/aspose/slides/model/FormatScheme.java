package com.aspose.slides.model;

import java.util.*;
import com.aspose.slides.model.ResourceUri;
public class FormatScheme {
  private List<ResourceUri> BackgroundStyles = new ArrayList<ResourceUri>();
  private List<ResourceUri> EffectStyles = new ArrayList<ResourceUri>();
  private List<ResourceUri> FillStyles = new ArrayList<ResourceUri>();
  private List<ResourceUri> LineStyles = new ArrayList<ResourceUri>();
  private ResourceUri SelfUri = null;
  private List<ResourceUri> AlternateLinks = new ArrayList<ResourceUri>();
  private List<ResourceUri> Links = new ArrayList<ResourceUri>();
  /**
	 * getBackgroundStyles
	 * Gets List<ResourceUri>
	 * @return BackgroundStyles
	 */
  public List<ResourceUri> getBackgroundStyles() {
    return BackgroundStyles;
  }

	/**
	 * setBackgroundStyles
	 * Sets List<ResourceUri>
	 * @param BackgroundStyles List<ResourceUri>
	 */
  public void setBackgroundStyles(List<ResourceUri> BackgroundStyles) {
    this.BackgroundStyles = BackgroundStyles;
  }

  /**
	 * getEffectStyles
	 * Gets List<ResourceUri>
	 * @return EffectStyles
	 */
  public List<ResourceUri> getEffectStyles() {
    return EffectStyles;
  }

	/**
	 * setEffectStyles
	 * Sets List<ResourceUri>
	 * @param EffectStyles List<ResourceUri>
	 */
  public void setEffectStyles(List<ResourceUri> EffectStyles) {
    this.EffectStyles = EffectStyles;
  }

  /**
	 * getFillStyles
	 * Gets List<ResourceUri>
	 * @return FillStyles
	 */
  public List<ResourceUri> getFillStyles() {
    return FillStyles;
  }

	/**
	 * setFillStyles
	 * Sets List<ResourceUri>
	 * @param FillStyles List<ResourceUri>
	 */
  public void setFillStyles(List<ResourceUri> FillStyles) {
    this.FillStyles = FillStyles;
  }

  /**
	 * getLineStyles
	 * Gets List<ResourceUri>
	 * @return LineStyles
	 */
  public List<ResourceUri> getLineStyles() {
    return LineStyles;
  }

	/**
	 * setLineStyles
	 * Sets List<ResourceUri>
	 * @param LineStyles List<ResourceUri>
	 */
  public void setLineStyles(List<ResourceUri> LineStyles) {
    this.LineStyles = LineStyles;
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
    sb.append("class FormatScheme {\n");
    sb.append("  BackgroundStyles: ").append(BackgroundStyles).append("\n");
    sb.append("  EffectStyles: ").append(EffectStyles).append("\n");
    sb.append("  FillStyles: ").append(FillStyles).append("\n");
    sb.append("  LineStyles: ").append(LineStyles).append("\n");
    sb.append("  SelfUri: ").append(SelfUri).append("\n");
    sb.append("  AlternateLinks: ").append(AlternateLinks).append("\n");
    sb.append("  Links: ").append(Links).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

