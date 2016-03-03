using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class LineFormat {
    public LineAlignment Alignment { get; set; }

    public LineCapStyle CapStyle { get; set; }

    public LineDashStyle DashStyle { get; set; }

    public LineJoinStyle JoinStyle { get; set; }

    public LineStyle Style { get; set; }

    public ArrowHeadProperties BeginArrowHead { get; set; }

    public ArrowHeadProperties EndArrowHead { get; set; }

    public CustomDashPattern CustomDashPattern { get; set; }

    public FillFormat FillFormat { get; set; }

    public float? MiterLimit { get; set; }

    public double? Width { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class LineFormat {\n");
      sb.Append("  Alignment: ").Append(Alignment).Append("\n");
      sb.Append("  CapStyle: ").Append(CapStyle).Append("\n");
      sb.Append("  DashStyle: ").Append(DashStyle).Append("\n");
      sb.Append("  JoinStyle: ").Append(JoinStyle).Append("\n");
      sb.Append("  Style: ").Append(Style).Append("\n");
      sb.Append("  BeginArrowHead: ").Append(BeginArrowHead).Append("\n");
      sb.Append("  EndArrowHead: ").Append(EndArrowHead).Append("\n");
      sb.Append("  CustomDashPattern: ").Append(CustomDashPattern).Append("\n");
      sb.Append("  FillFormat: ").Append(FillFormat).Append("\n");
      sb.Append("  MiterLimit: ").Append(MiterLimit).Append("\n");
      sb.Append("  Width: ").Append(Width).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
