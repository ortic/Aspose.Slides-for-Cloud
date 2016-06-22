using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class OrderedMergeRequest {
    public List<PresentationToMerge> Presentations { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class OrderedMergeRequest {\n");
      sb.Append("  Presentations: ").Append(Presentations).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
