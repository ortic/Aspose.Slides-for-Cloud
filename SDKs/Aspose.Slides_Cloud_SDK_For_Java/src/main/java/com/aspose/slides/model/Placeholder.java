package com.aspose.slides.model;

import java.util.*;
import com.aspose.slides.model.PlaceholderOrientation;
import com.aspose.slides.model.PlaceholderSize;
import com.aspose.slides.model.ResourceUri;
import com.aspose.slides.model.ResourceUriElement;
import com.aspose.slides.model.PlaceholderType;
public class Placeholder {
  private Integer Index = null;
  private Integer Orientation = null;
  private Integer Size = null;
  private Integer Type = null;
  private ResourceUriElement Shape = null;
  private ResourceUri SelfUri = null;
  private List<ResourceUri> AlternateLinks = new ArrayList<ResourceUri>();
  private List<ResourceUri> Links = new ArrayList<ResourceUri>();
  /**
	 * getIndex
	 * Gets Integer
	 * @return Index
	 */
  public Integer getIndex() {
    return Index;
  }

	/**
	 * setIndex
	 * Sets Integer
	 * @param Index Integer
	 */
  public void setIndex(Integer Index) {
    this.Index = Index;
  }

  /**
	 * getOrientation
	 * Gets PlaceholderOrientation
	 * @return Orientation
	 */
  public Integer getOrientation() {
    return Orientation;
  }

	/**
	 * setOrientation
	 * Sets PlaceholderOrientation
	 * @param Orientation PlaceholderOrientation
	 */
  public void setOrientation(Integer Orientation) {
    this.Orientation = Orientation;
  }

  /**
	 * getSize
	 * Gets PlaceholderSize
	 * @return Size
	 */
  public Integer getSize() {
    return Size;
  }

	/**
	 * setSize
	 * Sets PlaceholderSize
	 * @param Size PlaceholderSize
	 */
  public void setSize(Integer Size) {
    this.Size = Size;
  }

  /**
	 * getType
	 * Gets PlaceholderType
	 * @return Type
	 */
  public Integer getType() {
    return Type;
  }

	/**
	 * setType
	 * Sets PlaceholderType
	 * @param Type PlaceholderType
	 */
  public void setType(Integer Type) {
    this.Type = Type;
  }

  /**
	 * getShape
	 * Gets ResourceUriElement
	 * @return Shape
	 */
  public ResourceUriElement getShape() {
    return Shape;
  }

	/**
	 * setShape
	 * Sets ResourceUriElement
	 * @param Shape ResourceUriElement
	 */
  public void setShape(ResourceUriElement Shape) {
    this.Shape = Shape;
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
    sb.append("class Placeholder {\n");
    sb.append("  Index: ").append(Index).append("\n");
    sb.append("  Orientation: ").append(Orientation).append("\n");
    sb.append("  Size: ").append(Size).append("\n");
    sb.append("  Type: ").append(Type).append("\n");
    sb.append("  Shape: ").append(Shape).append("\n");
    sb.append("  SelfUri: ").append(SelfUri).append("\n");
    sb.append("  AlternateLinks: ").append(AlternateLinks).append("\n");
    sb.append("  Links: ").append(Links).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

