using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class Shape {
    public string Text { get; set; }

    public ResourceUriElement Paragraphs { get; set; }

    public string ShapeType { get; set; }

    public string Name { get; set; }

    public float? Width { get; set; }

    public float? Height { get; set; }

    public string AlternativeText { get; set; }

    public bool? Hidden { get; set; }

    public float? X { get; set; }

    public float? Y { get; set; }

    public int? ZOrderPosition { get; set; }

    public ResourceUriElement Shapes { get; set; }

    public FillFormat FillFormat { get; set; }

    public LineFormat LineFormat { get; set; }

    public ResourceUri SelfUri { get; set; }

    public List<ResourceUri> AlternateLinks { get; set; }

    public List<ResourceUri> Links { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class Shape {\n");
      sb.Append("  Text: ").Append(Text).Append("\n");
      sb.Append("  Paragraphs: ").Append(Paragraphs).Append("\n");
      sb.Append("  ShapeType: ").Append(ShapeType).Append("\n");
      sb.Append("  Name: ").Append(Name).Append("\n");
      sb.Append("  Width: ").Append(Width).Append("\n");
      sb.Append("  Height: ").Append(Height).Append("\n");
      sb.Append("  AlternativeText: ").Append(AlternativeText).Append("\n");
      sb.Append("  Hidden: ").Append(Hidden).Append("\n");
      sb.Append("  X: ").Append(X).Append("\n");
      sb.Append("  Y: ").Append(Y).Append("\n");
      sb.Append("  ZOrderPosition: ").Append(ZOrderPosition).Append("\n");
      sb.Append("  Shapes: ").Append(Shapes).Append("\n");
      sb.Append("  FillFormat: ").Append(FillFormat).Append("\n");
      sb.Append("  LineFormat: ").Append(LineFormat).Append("\n");
      sb.Append("  SelfUri: ").Append(SelfUri).Append("\n");
      sb.Append("  AlternateLinks: ").Append(AlternateLinks).Append("\n");
      sb.Append("  Links: ").Append(Links).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
