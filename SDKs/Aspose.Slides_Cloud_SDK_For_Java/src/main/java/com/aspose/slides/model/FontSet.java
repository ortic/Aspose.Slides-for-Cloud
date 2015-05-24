package com.aspose.slides.model;

public class FontSet {
  private String ComplexScript = null;
  private String EastAsian = null;
  private String Latin = null;
  /**
	 * getComplexScript
	 * Gets String
	 * @return ComplexScript
	 */
  public String getComplexScript() {
    return ComplexScript;
  }

	/**
	 * setComplexScript
	 * Sets String
	 * @param ComplexScript String
	 */
  public void setComplexScript(String ComplexScript) {
    this.ComplexScript = ComplexScript;
  }

  /**
	 * getEastAsian
	 * Gets String
	 * @return EastAsian
	 */
  public String getEastAsian() {
    return EastAsian;
  }

	/**
	 * setEastAsian
	 * Sets String
	 * @param EastAsian String
	 */
  public void setEastAsian(String EastAsian) {
    this.EastAsian = EastAsian;
  }

  /**
	 * getLatin
	 * Gets String
	 * @return Latin
	 */
  public String getLatin() {
    return Latin;
  }

	/**
	 * setLatin
	 * Sets String
	 * @param Latin String
	 */
  public void setLatin(String Latin) {
    this.Latin = Latin;
  }

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class FontSet {\n");
    sb.append("  ComplexScript: ").append(ComplexScript).append("\n");
    sb.append("  EastAsian: ").append(EastAsian).append("\n");
    sb.append("  Latin: ").append(Latin).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

