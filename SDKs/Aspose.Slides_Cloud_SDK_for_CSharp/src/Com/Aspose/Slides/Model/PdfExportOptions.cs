using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Com.Aspose.Slides.Model {
  public class PdfExportOptions {
    public PdfTextCompression TextCompression { get; set; }

    public bool? EmbedFullFonts { get; set; }

    public PdfCompliance Compliance { get; set; }

    public string JpegQuality { get; set; }

    public bool? SaveMetafilesAsPng { get; set; }

    public string Password { get; set; }

    public bool? EmbedTrueTypeFontsForASCII { get; set; }

    public ExportFormats ExportFormat { get; set; }

    public override string ToString()  {
      var sb = new StringBuilder();
      sb.Append("class PdfExportOptions {\n");
      sb.Append("  TextCompression: ").Append(TextCompression).Append("\n");
      sb.Append("  EmbedFullFonts: ").Append(EmbedFullFonts).Append("\n");
      sb.Append("  Compliance: ").Append(Compliance).Append("\n");
      sb.Append("  JpegQuality: ").Append(JpegQuality).Append("\n");
      sb.Append("  SaveMetafilesAsPng: ").Append(SaveMetafilesAsPng).Append("\n");
      sb.Append("  Password: ").Append(Password).Append("\n");
      sb.Append("  EmbedTrueTypeFontsForASCII: ").Append(EmbedTrueTypeFontsForASCII).Append("\n");
      sb.Append("  ExportFormat: ").Append(ExportFormat).Append("\n");
      sb.Append("}\n");
      return sb.ToString();
    }
  }
  }
