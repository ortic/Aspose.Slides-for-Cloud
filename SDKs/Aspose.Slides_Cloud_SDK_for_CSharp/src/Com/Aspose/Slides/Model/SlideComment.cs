using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class SlideComment {
    public string Author { get; set; }

    public string Text { get; set; }

    public string CreatedTime { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class SlideComment {\n");
      sb.Append("  Author: ").Append(Author).Append("\n");
      sb.Append("  Text: ").Append(Text).Append("\n");
      sb.Append("  CreatedTime: ").Append(CreatedTime).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
