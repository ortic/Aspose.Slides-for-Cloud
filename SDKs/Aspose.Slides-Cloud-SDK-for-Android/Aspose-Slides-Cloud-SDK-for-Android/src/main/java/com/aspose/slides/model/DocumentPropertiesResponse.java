package com.aspose.slides.model;

import com.aspose.slides.model.DocumentProperties;
public class DocumentPropertiesResponse {
  private DocumentProperties DocumentProperties = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getDocumentProperties
	 * Gets DocumentProperties
	 * @return DocumentProperties
	 */
  public DocumentProperties getDocumentProperties() {
    return DocumentProperties;
  }

	/**
	 * setDocumentProperties
	 * Sets DocumentProperties
	 * @param DocumentProperties DocumentProperties
	 */
  public void setDocumentProperties(DocumentProperties DocumentProperties) {
    this.DocumentProperties = DocumentProperties;
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
    sb.append("class DocumentPropertiesResponse {\n");
    sb.append("  DocumentProperties: ").append(DocumentProperties).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

