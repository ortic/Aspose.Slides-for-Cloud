using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class TiffExportOptions {
    public string ExportFormat { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class TiffExportOptions {\n");
      sb.Append("  ExportFormat: ").Append(ExportFormat).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
