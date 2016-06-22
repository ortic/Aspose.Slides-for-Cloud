package com.aspose.slides.model;

public class ResourceUri {
  private String Href = null;
  private String Relation = null;
  private String LinkType = null;
  private String Title = null;
  /**
	 * getHref
	 * Gets String
	 * @return Href
	 */
  public String getHref() {
    return Href;
  }

	/**
	 * setHref
	 * Sets String
	 * @param Href String
	 */
  public void setHref(String Href) {
    this.Href = Href;
  }

  /**
	 * getRelation
	 * Gets String
	 * @return Relation
	 */
  public String getRelation() {
    return Relation;
  }

	/**
	 * setRelation
	 * Sets String
	 * @param Relation String
	 */
  public void setRelation(String Relation) {
    this.Relation = Relation;
  }

  /**
	 * getLinkType
	 * Gets String
	 * @return LinkType
	 */
  public String getLinkType() {
    return LinkType;
  }

	/**
	 * setLinkType
	 * Sets String
	 * @param LinkType String
	 */
  public void setLinkType(String LinkType) {
    this.LinkType = LinkType;
  }

  /**
	 * getTitle
	 * Gets String
	 * @return Title
	 */
  public String getTitle() {
    return Title;
  }

	/**
	 * setTitle
	 * Sets String
	 * @param Title String
	 */
  public void setTitle(String Title) {
    this.Title = Title;
  }

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class ResourceUri {\n");
    sb.append("  Href: ").append(Href).append("\n");
    sb.append("  Relation: ").append(Relation).append("\n");
    sb.append("  LinkType: ").append(LinkType).append("\n");
    sb.append("  Title: ").append(Title).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

