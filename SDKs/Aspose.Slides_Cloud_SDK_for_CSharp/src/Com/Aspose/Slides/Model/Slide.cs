using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class Slide {
    public float? Width { get; set; }

    public float? Height { get; set; }

    public ResourceUriElement Shapes { get; set; }

    public ResourceUriElement Theme { get; set; }

    public ResourceUriElement Placeholders { get; set; }

    public ResourceUriElement Images { get; set; }

    public ResourceUriElement Comments { get; set; }

    public ResourceUriElement Background { get; set; }

    public ResourceUri SelfUri { get; set; }

    public List<ResourceUri> AlternateLinks { get; set; }

    public List<ResourceUri> Links { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class Slide {\n");
      sb.Append("  Width: ").Append(Width).Append("\n");
      sb.Append("  Height: ").Append(Height).Append("\n");
      sb.Append("  Shapes: ").Append(Shapes).Append("\n");
      sb.Append("  Theme: ").Append(Theme).Append("\n");
      sb.Append("  Placeholders: ").Append(Placeholders).Append("\n");
      sb.Append("  Images: ").Append(Images).Append("\n");
      sb.Append("  Comments: ").Append(Comments).Append("\n");
      sb.Append("  Background: ").Append(Background).Append("\n");
      sb.Append("  SelfUri: ").Append(SelfUri).Append("\n");
      sb.Append("  AlternateLinks: ").Append(AlternateLinks).Append("\n");
      sb.Append("  Links: ").Append(Links).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
