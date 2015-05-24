package com.aspose.slides.model;

import java.util.*;
import com.aspose.slides.model.ResourceUri;
import com.aspose.slides.model.ResourceUriElement;
public class Document {
  private ResourceUriElement DocumentProperties = null;
  private ResourceUriElement Slides = null;
  private ResourceUriElement Images = null;
  private ResourceUri SelfUri = null;
  private List<ResourceUri> AlternateLinks = new ArrayList<ResourceUri>();
  private List<ResourceUri> Links = new ArrayList<ResourceUri>();
  /**
	 * getDocumentProperties
	 * Gets ResourceUriElement
	 * @return DocumentProperties
	 */
  public ResourceUriElement getDocumentProperties() {
    return DocumentProperties;
  }

	/**
	 * setDocumentProperties
	 * Sets ResourceUriElement
	 * @param DocumentProperties ResourceUriElement
	 */
  public void setDocumentProperties(ResourceUriElement DocumentProperties) {
    this.DocumentProperties = DocumentProperties;
  }

  /**
	 * getSlides
	 * Gets ResourceUriElement
	 * @return Slides
	 */
  public ResourceUriElement getSlides() {
    return Slides;
  }

	/**
	 * setSlides
	 * Sets ResourceUriElement
	 * @param Slides ResourceUriElement
	 */
  public void setSlides(ResourceUriElement Slides) {
    this.Slides = Slides;
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
    sb.append("class Document {\n");
    sb.append("  DocumentProperties: ").append(DocumentProperties).append("\n");
    sb.append("  Slides: ").append(Slides).append("\n");
    sb.append("  Images: ").append(Images).append("\n");
    sb.append("  SelfUri: ").append(SelfUri).append("\n");
    sb.append("  AlternateLinks: ").append(AlternateLinks).append("\n");
    sb.append("  Links: ").append(Links).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

