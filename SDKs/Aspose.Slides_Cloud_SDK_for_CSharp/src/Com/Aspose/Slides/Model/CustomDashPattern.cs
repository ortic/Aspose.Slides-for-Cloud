using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class CustomDashPattern {
    public List<float?> Items { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class CustomDashPattern {\n");
      sb.Append("  Items: ").Append(Items).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
