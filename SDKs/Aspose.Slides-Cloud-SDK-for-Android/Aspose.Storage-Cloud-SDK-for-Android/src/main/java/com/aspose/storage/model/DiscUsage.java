package com.aspose.storage.model;

public class DiscUsage {
  private Long UsedSize = null;
  private Long TotalSize = null;
  /**
	 * getUsedSize
	 * Gets Long
	 * @return UsedSize
	 */
  public Long getUsedSize() {
    return UsedSize;
  }

	/**
	 * setUsedSize
	 * Sets Long
	 * @param UsedSize Long
	 */
  public void setUsedSize(Long UsedSize) {
    this.UsedSize = UsedSize;
  }

  /**
	 * getTotalSize
	 * Gets Long
	 * @return TotalSize
	 */
  public Long getTotalSize() {
    return TotalSize;
  }

	/**
	 * setTotalSize
	 * Sets Long
	 * @param TotalSize Long
	 */
  public void setTotalSize(Long TotalSize) {
    this.TotalSize = TotalSize;
  }

  @Override
  public String toString()  {
    StringBuilder sb = new StringBuilder();
    sb.append("class DiscUsage {\n");
    sb.append("  UsedSize: ").append(UsedSize).append("\n");
    sb.append("  TotalSize: ").append(TotalSize).append("\n");
    sb.append("}\n");
    return sb.toString();
  }
}

