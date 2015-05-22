package com.aspose.slides.model;

import java.util.*;
import com.aspose.slides.model.ResourceUri;
import com.aspose.slides.model.ResourceUriElement;
import com.aspose.slides.model.AutoShapeType;
public class Shape {
  private String Text = null;
  private ResourceUriElement Paragraphs = null;
  private AutoShapeType ShapeType = null;
  private String Name = null;
  private Float Width = null;
  private Float Height = null;
  private String AlternativeText = null;
  private Boolean Hidden = null;
  private Float X = null;
  private Float Y = null;
  private Integer ZOrderPosition = null;
  private ResourceUriElement Shapes = null;
  private ResourceUriElement FillFormat = null;
  private ResourceUriElement LineFormat = null;
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
	 * getParagraphs
	 * Gets ResourceUriElement
	 * @return Paragraphs
	 */
  public ResourceUriElement getParagraphs() {
    return Paragraphs;
  }

	/**
	 * setParagraphs
	 * Sets ResourceUriElement
	 * @param Paragraphs ResourceUriElement
	 */
  public void setParagraphs(ResourceUriElement Paragraphs) {
    this.Paragraphs = Paragraphs;
  }

  /**
	 * getShapeType
	 * Gets AutoShapeType
	 * @return ShapeType
	 */
  public AutoShapeType getShapeType() {
    return ShapeType;
  }

	/**
	 * setShapeType
	 * Sets AutoShapeType
	 * @param ShapeType AutoShapeType
	 */
  public void setShapeType(AutoShapeType ShapeType) {
    this.ShapeType = ShapeType;
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
	 * getAlternativeText
	 * Gets String
	 * @return AlternativeText
	 */
  public String getAlternativeText() {
    return AlternativeText;
  }

	/**
	 * setAlternativeText
	 * Sets String
	 * @param AlternativeText String
	 */
  public void setAlternativeText(String AlternativeText) {
    this.AlternativeText = AlternativeText;
  }

  /**
	 * getHidden
	 * Gets Boolean
	 * @return Hidden
	 */
  public Boolean getHidden() {
    return Hidden;
  }

	/**
	 * setHidden
	 * Sets Boolean
	 * @param Hidden Boolean
	 */
  public void setHidden(Boolean Hidden) {
    this.Hidden = Hidden;
  }

  /**
	 * getX
	 * Gets Float
	 * @return X
	 */
  public Float getX() {
    return X;
  }

	/**
	 * setX
	 * Sets Float
	 * @param X Float
	 */
  public void setX(Float X) {
    this.X = X;
  }

  /**
	 * getY
	 * Gets Float
	 * @return Y
	 */
  public Float getY() {
    return Y;
  }

	/**
	 * setY
	 * Sets Float
	 * @param Y Float
	 */
  public void setY(Float Y) {
    this.Y = Y;
  }

  /**
	 * getZOrderPosition
	 * Gets Integer
	 * @return ZOrderPosition
	 */
  public Integer getZOrderPosition() {
    return ZOrderPosition;
  }

	/**
	 * setZOrderPosition
	 * Sets Integer
	 * @param ZOrderPosition Integer
	 */
  public void setZOrderPosition(Integer ZOrderPosition) {
    this.ZOrderPosition = ZOrderPosition;
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
	 * getFillFormat
	 * Gets ResourceUriElement
	 * @return FillFormat
	 */
  public ResourceUriElement getFillFormat() {
    return FillFormat;
  }

	/**
	 * setFillFormat
	 * Sets ResourceUriElement
	 * @param FillFormat ResourceUriElement
	 */
  public void setFillFormat(ResourceUriElement FillFormat) {
    this.FillFormat = FillFormat;
  }

  /**
	 * getLineFormat
	 * Gets ResourceUriElement
	 * @return LineFormat
	 */
  public ResourceUriElement getLineFormat() {
    return LineFormat;
  }

	/**
	 * setLineFormat
	 * Sets ResourceUriElement
	 * @param LineFormat ResourceUriElement
	 */
  public void setLineFormat(ResourceUriElement LineFormat) {
    this.LineFormat = LineFormat;
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
    sb.append("class Shape {\n");
    sb.append("  Text: ").append(Text).append("\n");
    sb.append("  Paragraphs: ").append(Paragraphs).append("\n");
    sb.append("  ShapeType: ").append(ShapeType).append("\n");
    sb.append("  Name: ").append(Name).append("\n");
    sb.append("  Width: ").append(Width).append("\n");
    sb.append("  Height: ").append(Height).append("\n");
    sb.append("  AlternativeText: ").append(AlternativeText).append("\n");
    sb.append("  Hidden: ").append(Hidden).append("\n");
    sb.append("  X: ").append(X).append("\n");
    sb.append("  Y: ").append(Y).append("\n");
    sb.append("  ZOrderPosition: ").append(ZOrderPosition).append("\n");
    sb.append("  Shapes: ").append(Shapes).append("\n");
    sb.append("  FillFormat: ").append(FillFormat).append("\n");
    sb.append("  LineFormat: ").append(LineFormat).append("\n");
    sb.append("  SelfUri: ").append(SelfUri).append("\n");
    sb.append("  AlternateLinks: ").append(AlternateLinks).append("\n");
    sb.append("  Links: ").append(Links).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

