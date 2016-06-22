package com.aspose.slides.model;

import com.aspose.slides.model.DocumentProperty;
public class DocumentPropertyResponse {
  private DocumentProperty DocumentProperty = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getDocumentProperty
	 * Gets DocumentProperty
	 * @return DocumentProperty
	 */
  public DocumentProperty getDocumentProperty() {
    return DocumentProperty;
  }

	/**
	 * setDocumentProperty
	 * Sets DocumentProperty
	 * @param DocumentProperty DocumentProperty
	 */
  public void setDocumentProperty(DocumentProperty DocumentProperty) {
    this.DocumentProperty = DocumentProperty;
  }

  /**
	 * getCode
	 * Gets String
	 * @return Code
	 */
  public String getCode() {
    return Code;
  }

	/**
	 * setCode
	 * Sets String
	 * @param Code String
	 */
  public void setCode(String Code) {
    this.Code = Code;
  }

  /**
	 * getStatus
	 * Gets String
	 * @return Status
	 */
  public String getStatus() {
    return Status;
  }

	/**
	 * setStatus
	 * Sets String
	 * @param Status String
	 */
  public void setStatus(String Status) {
    this.Status = Status;
  }

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class DocumentPropertyResponse {\n");
    sb.append("  DocumentProperty: ").append(DocumentProperty).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

