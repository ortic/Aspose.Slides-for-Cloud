using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class ImagesResponse {
    public Images Images { get; set; }

    public string Code { get; set; }

    public string Status { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class ImagesResponse {\n");
      sb.Append("  Images: ").Append(Images).Append("\n");
      sb.Append("  Code: ").Append(Code).Append("\n");
      sb.Append("  Status: ").Append(Status).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
