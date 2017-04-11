package com.aspose.slides.model;

import com.aspose.slides.model.SplitDocumentResult;
public class SplitDocumentResponse {
  private SplitDocumentResult SplitResult = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getSplitResult
	 * Gets SplitDocumentResult
	 * @return SplitResult
	 */
  public SplitDocumentResult getSplitResult() {
    return SplitResult;
  }

	/**
	 * setSplitResult
	 * Sets SplitDocumentResult
	 * @param SplitResult SplitDocumentResult
	 */
  public void setSplitResult(SplitDocumentResult SplitResult) {
    this.SplitResult = SplitResult;
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
    sb.append("class SplitDocumentResponse {\n");
    sb.append("  SplitResult: ").append(SplitResult).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

