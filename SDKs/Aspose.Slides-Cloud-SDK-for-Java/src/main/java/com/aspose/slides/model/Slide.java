package com.aspose.slides.model;

import java.util.*;
import com.aspose.slides.model.ResourceUri;
import com.aspose.slides.model.ResourceUriElement;
public class Slide {
  private Float Width = null;
  private Float Height = null;
  private ResourceUriElement Shapes = null;
  private ResourceUriElement Theme = null;
  private ResourceUriElement Placeholders = null;
  private ResourceUriElement Images = null;
  private ResourceUriElement Comments = null;
  private ResourceUriElement Background = null;
  private ResourceUri SelfUri = null;
  private List<ResourceUri> AlternateLinks = new ArrayList<ResourceUri>();
  private List<ResourceUri> Links = new ArrayList<ResourceUri>();
  /**
	 * getWidth
	 * Gets Float
	 * @return Width
	 */
  public Float getWidth() {
    return Width;
  }

	/**
	 * setWidth
	 * Sets Float
	 * @param Width Float
	 */
  public void setWidth(Float Width) {
    this.Width = Width;
  }

  /**
	 * getHeight
	 * Gets Float
	 * @return Height
	 */
  public Float getHeight() {
    return Height;
  }

	/**
	 * setHeight
	 * Sets Float
	 * @param Height Float
	 */
  public void setHeight(Float Height) {
    this.Height = Height;
  }

  /**
	 * getShapes
	 * Gets ResourceUriElement
	 * @return Shapes
	 */
  public ResourceUriElement getShapes() {
    return Shapes;
  }

	/**
	 * setShapes
	 * Sets ResourceUriElement
	 * @param Shapes ResourceUriElement
	 */
  public void setShapes(ResourceUriElement Shapes) {
    this.Shapes = Shapes;
  }

  /**
	 * getTheme
	 * Gets ResourceUriElement
	 * @return Theme
	 */
  public ResourceUriElement getTheme() {
    return Theme;
  }

	/**
	 * setTheme
	 * Sets ResourceUriElement
	 * @param Theme ResourceUriElement
	 */
  public void setTheme(ResourceUriElement Theme) {
    this.Theme = Theme;
  }

  /**
	 * getPlaceholders
	 * Gets ResourceUriElement
	 * @return Placeholders
	 */
  public ResourceUriElement getPlaceholders() {
    return Placeholders;
  }

	/**
	 * setPlaceholders
	 * Sets ResourceUriElement
	 * @param Placeholders ResourceUriElement
	 */
  public void setPlaceholders(ResourceUriElement Placeholders) {
    this.Placeholders = Placeholders;
  }

  /**
	 * getImages
	 * Gets ResourceUriElement
	 * @return Images
	 */
  public ResourceUriElement getImages() {
    return Images;
  }

	/**
	 * setImages
	 * Sets ResourceUriElement
	 * @param Images ResourceUriElement
	 */
  public void setImages(ResourceUriElement Images) {
    this.Images = Images;
  }

  /**
	 * getComments
	 * Gets ResourceUriElement
	 * @return Comments
	 */
  public ResourceUriElement getComments() {
    return Comments;
  }

	/**
	 * setComments
	 * Sets ResourceUriElement
	 * @param Comments ResourceUriElement
	 */
  public void setComments(ResourceUriElement Comments) {
    this.Comments = Comments;
  }

  /**
	 * getBackground
	 * Gets ResourceUriElement
	 * @return Background
	 */
  public ResourceUriElement getBackground() {
    return Background;
  }

	/**
	 * setBackground
	 * Sets ResourceUriElement
	 * @param Background ResourceUriElement
	 */
  public void setBackground(ResourceUriElement Background) {
    this.Background = Background;
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
    sb.append("class Slide {\n");
    sb.append("  Width: ").append(Width).append("\n");
    sb.append("  Height: ").append(Height).append("\n");
    sb.append("  Shapes: ").append(Shapes).append("\n");
    sb.append("  Theme: ").append(Theme).append("\n");
    sb.append("  Placeholders: ").append(Placeholders).append("\n");
    sb.append("  Images: ").append(Images).append("\n");
    sb.append("  Comments: ").append(Comments).append("\n");
    sb.append("  Background: ").append(Background).append("\n");
    sb.append("  SelfUri: ").append(SelfUri).append("\n");
    sb.append("  AlternateLinks: ").append(AlternateLinks).append("\n");
    sb.append("  Links: ").append(Links).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

