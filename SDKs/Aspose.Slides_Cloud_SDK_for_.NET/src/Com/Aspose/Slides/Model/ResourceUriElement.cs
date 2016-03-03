using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class ResourceUriElement {
    public ResourceUri Uri { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class ResourceUriElement {\n");
      sb.Append("  Uri: ").Append(Uri).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
