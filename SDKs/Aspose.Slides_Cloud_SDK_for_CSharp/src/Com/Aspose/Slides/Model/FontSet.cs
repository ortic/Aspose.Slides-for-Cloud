using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class FontSet {
    public string ComplexScript { get; set; }

    public string EastAsian { get; set; }

    public string Latin { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class FontSet {\n");
      sb.Append("  ComplexScript: ").Append(ComplexScript).Append("\n");
      sb.Append("  EastAsian: ").Append(EastAsian).Append("\n");
      sb.Append("  Latin: ").Append(Latin).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
