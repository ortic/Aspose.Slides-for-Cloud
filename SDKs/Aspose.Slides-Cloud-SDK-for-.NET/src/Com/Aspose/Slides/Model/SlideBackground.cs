using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class SlideBackground {
    public string Type { get; set; }

    public FillFormat FillFormat { get; set; }

    public ResourceUri SelfUri { get; set; }

    public List<ResourceUri> AlternateLinks { get; set; }

    public List<ResourceUri> Links { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class SlideBackground {\n");
      sb.Append("  Type: ").Append(Type).Append("\n");
      sb.Append("  FillFormat: ").Append(FillFormat).Append("\n");
      sb.Append("  SelfUri: ").Append(SelfUri).Append("\n");
      sb.Append("  AlternateLinks: ").Append(AlternateLinks).Append("\n");
      sb.Append("  Links: ").Append(Links).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
