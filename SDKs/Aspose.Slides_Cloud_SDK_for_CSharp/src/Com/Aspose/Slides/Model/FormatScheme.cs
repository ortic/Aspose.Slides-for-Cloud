using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class FormatScheme {
    public List<ResourceUri> BackgroundStyles { get; set; }

    public List<ResourceUri> EffectStyles { get; set; }

    public List<ResourceUri> FillStyles { get; set; }

    public List<ResourceUri> LineStyles { get; set; }

    public ResourceUri SelfUri { get; set; }

    public List<ResourceUri> AlternateLinks { get; set; }

    public List<ResourceUri> Links { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class FormatScheme {\n");
      sb.Append("  BackgroundStyles: ").Append(BackgroundStyles).Append("\n");
      sb.Append("  EffectStyles: ").Append(EffectStyles).Append("\n");
      sb.Append("  FillStyles: ").Append(FillStyles).Append("\n");
      sb.Append("  LineStyles: ").Append(LineStyles).Append("\n");
      sb.Append("  SelfUri: ").Append(SelfUri).Append("\n");
      sb.Append("  AlternateLinks: ").Append(AlternateLinks).Append("\n");
      sb.Append("  Links: ").Append(Links).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
