using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class Theme {
    public string Name { get; set; }

    public ResourceUriElement ColorScheme { get; set; }

    public ResourceUriElement FontScheme { get; set; }

    public ResourceUriElement FormatScheme { get; set; }

    public ResourceUri SelfUri { get; set; }

    public List<ResourceUri> AlternateLinks { get; set; }

    public List<ResourceUri> Links { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class Theme {\n");
      sb.Append("  Name: ").Append(Name).Append("\n");
      sb.Append("  ColorScheme: ").Append(ColorScheme).Append("\n");
      sb.Append("  FontScheme: ").Append(FontScheme).Append("\n");
      sb.Append("  FormatScheme: ").Append(FormatScheme).Append("\n");
      sb.Append("  SelfUri: ").Append(SelfUri).Append("\n");
      sb.Append("  AlternateLinks: ").Append(AlternateLinks).Append("\n");
      sb.Append("  Links: ").Append(Links).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
