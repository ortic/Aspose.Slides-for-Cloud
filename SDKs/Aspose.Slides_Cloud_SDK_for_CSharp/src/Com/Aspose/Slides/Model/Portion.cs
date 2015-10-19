using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class Portion {
    public string Text { get; set; }

    public string FontColor { get; set; }

    public double? FontHeight { get; set; }

    public ResourceUri SelfUri { get; set; }

    public List<ResourceUri> AlternateLinks { get; set; }

    public List<ResourceUri> Links { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class Portion {\n");
      sb.Append("  Text: ").Append(Text).Append("\n");
      sb.Append("  FontColor: ").Append(FontColor).Append("\n");
      sb.Append("  FontHeight: ").Append(FontHeight).Append("\n");
      sb.Append("  SelfUri: ").Append(SelfUri).Append("\n");
      sb.Append("  AlternateLinks: ").Append(AlternateLinks).Append("\n");
      sb.Append("  Links: ").Append(Links).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
