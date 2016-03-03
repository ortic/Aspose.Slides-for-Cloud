using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class TextItem {
    public ResourceUri Uri { get; set; }

    public string Text { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class TextItem {\n");
      sb.Append("  Uri: ").Append(Uri).Append("\n");
      sb.Append("  Text: ").Append(Text).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
