using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class Slides {
    public List<ResourceUriElement> SlideList { get; set; }

    public ResourceUri SelfUri { get; set; }

    public List<ResourceUri> AlternateLinks { get; set; }

    public List<ResourceUri> Links { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class Slides {\n");
      sb.Append("  SlideList: ").Append(SlideList).Append("\n");
      sb.Append("  SelfUri: ").Append(SelfUri).Append("\n");
      sb.Append("  AlternateLinks: ").Append(AlternateLinks).Append("\n");
      sb.Append("  Links: ").Append(Links).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
