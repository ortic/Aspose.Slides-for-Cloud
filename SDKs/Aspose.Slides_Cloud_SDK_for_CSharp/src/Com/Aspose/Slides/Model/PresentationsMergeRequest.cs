using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class PresentationsMergeRequest {
    public List<string> PresentationPaths { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class PresentationsMergeRequest {\n");
      sb.Append("  PresentationPaths: ").Append(PresentationPaths).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
