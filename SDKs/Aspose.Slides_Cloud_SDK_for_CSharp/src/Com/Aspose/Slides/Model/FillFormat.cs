using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class FillFormat {
    public string Type { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class FillFormat {\n");
      sb.Append("  Type: ").Append(Type).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
