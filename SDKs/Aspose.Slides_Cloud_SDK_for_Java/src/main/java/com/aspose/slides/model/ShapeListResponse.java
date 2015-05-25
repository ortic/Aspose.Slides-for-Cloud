package com.aspose.slides.model;

import com.aspose.slides.model.Shapes;
public class ShapeListResponse {
  private Shapes ShapeList = null;
  private String Code = null;
  private String Status = null;
  /**
	 * getShapeList
	 * Gets Shapes
	 * @return ShapeList
	 */
  public Shapes getShapeList() {
    return ShapeList;
  }

	/**
	 * setShapeList
	 * Sets Shapes
	 * @param ShapeList Shapes
	 */
  public void setShapeList(Shapes ShapeList) {
    this.ShapeList = ShapeList;
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
    sb.append("class ShapeListResponse {\n");
    sb.append("  ShapeList: ").append(ShapeList).append("\n");
    sb.append("  Code: ").append(Code).append("\n");
    sb.append("  Status: ").append(Status).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

