using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class Placeholder {
    public int Index { get; set; }

    public string Orientation { get; set; }

    public string Size { get; set; }

    public string Type { get; set; }

    public ResourceUriElement Shape { get; set; }

    public ResourceUri SelfUri { get; set; }

    public List<ResourceUri> AlternateLinks { get; set; }

    public List<ResourceUri> Links { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class Placeholder {\n");
      sb.Append("  Index: ").Append(Index).Append("\n");
      sb.Append("  Orientation: ").Append(Orientation).Append("\n");
      sb.Append("  Size: ").Append(Size).Append("\n");
      sb.Append("  Type: ").Append(Type).Append("\n");
      sb.Append("  Shape: ").Append(Shape).Append("\n");
      sb.Append("  SelfUri: ").Append(SelfUri).Append("\n");
      sb.Append("  AlternateLinks: ").Append(AlternateLinks).Append("\n");
      sb.Append("  Links: ").Append(Links).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
