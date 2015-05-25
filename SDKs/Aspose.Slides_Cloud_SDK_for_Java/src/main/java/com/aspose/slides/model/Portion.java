package com.aspose.slides.model;

import java.util.*;
import com.aspose.slides.model.ResourceUri;
public class Portion {
  private String Text = null;
  private String FontColor = null;
  private Double FontHeight = null;
  private ResourceUri SelfUri = null;
  private List<ResourceUri> AlternateLinks = new ArrayList<ResourceUri>();
  private List<ResourceUri> Links = new ArrayList<ResourceUri>();
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

  /**
	 * getFontColor
	 * Gets String
	 * @return FontColor
	 */
  public String getFontColor() {
    return FontColor;
  }

	/**
	 * setFontColor
	 * Sets String
	 * @param FontColor String
	 */
  public void setFontColor(String FontColor) {
    this.FontColor = FontColor;
  }

  /**
	 * getFontHeight
	 * Gets Double
	 * @return FontHeight
	 */
  public Double getFontHeight() {
    return FontHeight;
  }

	/**
	 * setFontHeight
	 * Sets Double
	 * @param FontHeight Double
	 */
  public void setFontHeight(Double FontHeight) {
    this.FontHeight = FontHeight;
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
    sb.append("class Portion {\n");
    sb.append("  Text: ").append(Text).append("\n");
    sb.append("  FontColor: ").append(FontColor).append("\n");
    sb.append("  FontHeight: ").append(FontHeight).append("\n");
    sb.append("  SelfUri: ").append(SelfUri).append("\n");
    sb.append("  AlternateLinks: ").append(AlternateLinks).append("\n");
    sb.append("  Links: ").append(Links).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

