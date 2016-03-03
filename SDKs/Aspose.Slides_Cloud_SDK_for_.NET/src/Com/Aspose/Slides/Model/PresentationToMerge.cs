using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class PresentationToMerge {
    public string Path { get; set; }

    public List<int?> Slides { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class PresentationToMerge {\n");
      sb.Append("  Path: ").Append(Path).Append("\n");
      sb.Append("  Slides: ").Append(Slides).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
