using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class ArrowHeadProperties {
    public LineArrowheadLength Length { get; set; }

    public LineArrowheadStyle Style { get; set; }

    public LineArrowheadWidth Width { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class ArrowHeadProperties {\n");
      sb.Append("  Length: ").Append(Length).Append("\n");
      sb.Append("  Style: ").Append(Style).Append("\n");
      sb.Append("  Width: ").Append(Width).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
