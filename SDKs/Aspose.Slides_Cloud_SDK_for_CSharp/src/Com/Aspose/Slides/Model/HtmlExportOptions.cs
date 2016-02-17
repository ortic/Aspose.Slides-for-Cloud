using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class HtmlExportOptions {
    public bool? SaveAsZip { get; set; }

    public string SubDirectoryName { get; set; }

    public ExportFormats ExportFormat { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class HtmlExportOptions {\n");
      sb.Append("  SaveAsZip: ").Append(SaveAsZip).Append("\n");
      sb.Append("  SubDirectoryName: ").Append(SubDirectoryName).Append("\n");
      sb.Append("  ExportFormat: ").Append(ExportFormat).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
