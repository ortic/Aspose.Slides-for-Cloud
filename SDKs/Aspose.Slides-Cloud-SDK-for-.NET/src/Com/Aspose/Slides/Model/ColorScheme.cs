using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class ColorScheme {
    public string Accent1 { get; set; }

    public string Accent2 { get; set; }

    public string Accent3 { get; set; }

    public string Accent4 { get; set; }

    public string Accent5 { get; set; }

    public string Accent6 { get; set; }

    public string Dark1 { get; set; }

    public string Dark2 { get; set; }

    public string FollowedHyperlink { get; set; }

    public string Hyperlink { get; set; }

    public string Light1 { get; set; }

    public string Light2 { get; set; }

    public ResourceUri SelfUri { get; set; }

    public List<ResourceUri> AlternateLinks { get; set; }

    public List<ResourceUri> Links { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class ColorScheme {\n");
      sb.Append("  Accent1: ").Append(Accent1).Append("\n");
      sb.Append("  Accent2: ").Append(Accent2).Append("\n");
      sb.Append("  Accent3: ").Append(Accent3).Append("\n");
      sb.Append("  Accent4: ").Append(Accent4).Append("\n");
      sb.Append("  Accent5: ").Append(Accent5).Append("\n");
      sb.Append("  Accent6: ").Append(Accent6).Append("\n");
      sb.Append("  Dark1: ").Append(Dark1).Append("\n");
      sb.Append("  Dark2: ").Append(Dark2).Append("\n");
      sb.Append("  FollowedHyperlink: ").Append(FollowedHyperlink).Append("\n");
      sb.Append("  Hyperlink: ").Append(Hyperlink).Append("\n");
      sb.Append("  Light1: ").Append(Light1).Append("\n");
      sb.Append("  Light2: ").Append(Light2).Append("\n");
      sb.Append("  SelfUri: ").Append(SelfUri).Append("\n");
      sb.Append("  AlternateLinks: ").Append(AlternateLinks).Append("\n");
      sb.Append("  Links: ").Append(Links).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
