using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class PresentationStringReplaceResponse {
    public Document Document { get; set; }

    public int? Matches { get; set; }

    public string Code { get; set; }

    public string Status { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class PresentationStringReplaceResponse {\n");
      sb.Append("  Document: ").Append(Document).Append("\n");
      sb.Append("  Matches: ").Append(Matches).Append("\n");
      sb.Append("  Code: ").Append(Code).Append("\n");
      sb.Append("  Status: ").Append(Status).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
