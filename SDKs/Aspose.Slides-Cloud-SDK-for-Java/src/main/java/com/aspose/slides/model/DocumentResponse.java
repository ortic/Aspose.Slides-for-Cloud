package com.aspose.slides.model;

import com.aspose.slides.model.Document;
public class DocumentResponse {
  private Document Document = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getDocument
	 * Gets Document
	 * @return Document
	 */
  public Document getDocument() {
    return Document;
  }

	/**
	 * setDocument
	 * Sets Document
	 * @param Document Document
	 */
  public void setDocument(Document Document) {
    this.Document = Document;
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
    sb.append("class DocumentResponse {\n");
    sb.append("  Document: ").append(Document).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

