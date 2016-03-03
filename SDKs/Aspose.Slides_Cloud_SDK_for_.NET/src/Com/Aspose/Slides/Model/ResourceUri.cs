using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class ResourceUri {
    public string Href { get; set; }

    public string Relation { get; set; }

    public string LinkType { get; set; }

    public string Title { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class ResourceUri {\n");
      sb.Append("  Href: ").Append(Href).Append("\n");
      sb.Append("  Relation: ").Append(Relation).Append("\n");
      sb.Append("  LinkType: ").Append(LinkType).Append("\n");
      sb.Append("  Title: ").Append(Title).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
