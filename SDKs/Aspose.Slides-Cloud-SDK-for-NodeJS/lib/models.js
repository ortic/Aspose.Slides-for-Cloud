exports.models = {
  "TextEffect": {
  "id" : "TextEffect"
},"FormatScheme": {
  "properties" : {
    "BackgroundStyles" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "EffectStyles" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "FillStyles" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "LineStyles" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "FormatScheme"
},"PlaceholderType": {
  "id" : "PlaceholderType"
},"Slide": {
  "properties" : {
    "Width" : {
      "$ref" : "float"
    },
    "Height" : {
      "$ref" : "float"
    },
    "Shapes" : {
      "$ref" : "ResourceUriElement"
    },
    "Theme" : {
      "$ref" : "ResourceUriElement"
    },
    "Placeholders" : {
      "$ref" : "ResourceUriElement"
    },
    "Images" : {
      "$ref" : "ResourceUriElement"
    },
    "Comments" : {
      "$ref" : "ResourceUriElement"
    },
    "Background" : {
      "$ref" : "ResourceUriElement"
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "Slide"
},"ImagesResponse": {
  "properties" : {
    "Images" : {
      "$ref" : "Images"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "ImagesResponse"
},"TextItems": {
  "properties" : {
    "Items" : {
      "type" : "array",
      "items" : {
        "$ref" : "TextItem"
      }
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "TextItems"
},"Images": {
  "properties" : {
    "List" : {
      "type" : "array",
      "items" : {
        "$ref" : "Image"
      }
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "Images"
},"PlaceholderOrientation": {
  "id" : "PlaceholderOrientation"
},"ResponseMessage": {
  "properties" : {
    "Code" : {
      "$ref" : "int"
    },
    "Message" : {
      "type" : "string"
    }
  },
  "id" : "ResponseMessage"
},"PaperSize": {
  "id" : "PaperSize"
},"SlideComment": {
  "properties" : {
    "Author" : {
      "type" : "string"
    },
    "Text" : {
      "type" : "string"
    },
    "CreatedTime" : {
      "type" : "string"
    }
  },
  "id" : "SlideComment"
},"ThemeResponse": {
  "properties" : {
    "Theme" : {
      "$ref" : "Theme"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "ThemeResponse"
},"PlaceholderResponse": {
  "properties" : {
    "Placeholder" : {
      "$ref" : "Placeholder"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "PlaceholderResponse"
},"OrderedMergeRequest": {
  "properties" : {
    "Presentations" : {
      "type" : "array",
      "items" : {
        "$ref" : "PresentationToMerge"
      }
    }
  },
  "id" : "OrderedMergeRequest"
},"SlideCommentsResponse": {
  "properties" : {
    "SlideComments" : {
      "$ref" : "SlideComments"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "SlideCommentsResponse"
},"HttpStatusCode": {
  "id" : "HttpStatusCode"
},"PlaceholdersResponse": {
  "properties" : {
    "Placeholders" : {
      "$ref" : "Placeholders"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "PlaceholdersResponse"
},"AutoShapeType": {
  "id" : "AutoShapeType"
},"Placeholders": {
  "properties" : {
    "PlaceholderLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "Placeholders"
},"DocumentPropertiesResponse": {
  "properties" : {
    "DocumentProperties" : {
      "$ref" : "DocumentProperties"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "DocumentPropertiesResponse"
},"NumberStyle": {
  "id" : "NumberStyle"
},"Int32": {
  "id" : "Int32"
},"DocumentProperties": {
  "properties" : {
    "List" : {
      "type" : "array",
      "items" : {
        "$ref" : "DocumentProperty"
      }
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "DocumentProperties"
},"TextItem": {
  "properties" : {
    "Uri" : {
      "$ref" : "ResourceUri"
    },
    "Text" : {
      "type" : "string"
    }
  },
  "id" : "TextItem"
},"String": {
  "properties" : {
    "Chars" : {
      "$ref" : "char"
    },
    "Length" : {
      "$ref" : "int"
    }
  },
  "id" : "String"
},"SectionStart": {
  "id" : "SectionStart"
},"HttpResponseMessage": {
  "properties" : {
    "Content" : {
      "type" : "string"
    },
    "Headers" : {
      "type" : "string"
    },
    "IsSuccessStatusCode" : {
      "$ref" : "bool"
    },
    "ReasonPhrase" : {
      "type" : "string"
    },
    "RequestMessage" : {
      "type" : "string"
    },
    "StatusCode" : {
      "type" : "string"
    },
    "Version" : {
      "type" : "string"
    }
  },
  "id" : "HttpResponseMessage"
},"ColorSchemeResponse": {
  "properties" : {
    "ColorScheme" : {
      "$ref" : "ColorScheme"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "ColorSchemeResponse"
},"ResourceUri": {
  "properties" : {
    "Href" : {
      "type" : "string"
    },
    "Relation" : {
      "type" : "string"
    },
    "LinkType" : {
      "type" : "string"
    },
    "Title" : {
      "type" : "string"
    }
  },
  "id" : "ResourceUri"
},"PageBorderAppliesTo": {
  "id" : "PageBorderAppliesTo"
},"SlideBackgroundResponse": {
  "properties" : {
    "Background" : {
      "$ref" : "SlideBackground"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "SlideBackgroundResponse"
},"Portion": {
  "properties" : {
    "Text" : {
      "type" : "string"
    },
    "FontColor" : {
      "type" : "string"
    },
    "FontHeight" : {
      "$ref" : "double"
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "Portion"
},"ResourceUriElement": {
  "properties" : {
    "Uri" : {
      "$ref" : "ResourceUri"
    }
  },
  "id" : "ResourceUriElement"
},"DocumentResponse": {
  "properties" : {
    "Document" : {
      "$ref" : "Document"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "DocumentResponse"
},"CommonResponse": {
  "properties" : {
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "CommonResponse"
},"SlideListResponse": {
  "properties" : {
    "Slides" : {
      "$ref" : "Slides"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "SlideListResponse"
},"DocumentPropertyResponse": {
  "properties" : {
    "DocumentProperty" : {
      "$ref" : "DocumentProperty"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "DocumentPropertyResponse"
},"PageBorderDistanceFrom": {
  "id" : "PageBorderDistanceFrom"
},"Slides": {
  "properties" : {
    "SlideList" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUriElement"
      }
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "Slides"
},"LineNumberRestartMode": {
  "id" : "LineNumberRestartMode"
},"SlideStringReplaceResponse": {
  "properties" : {
    "Slide" : {
      "$ref" : "Slide"
    },
    "Matches" : {
      "$ref" : "int"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "SlideStringReplaceResponse"
},"ReportType": {
  "id" : "ReportType"
},"FontSet": {
  "properties" : {
    "ComplexScript" : {
      "type" : "string"
    },
    "EastAsian" : {
      "type" : "string"
    },
    "Latin" : {
      "type" : "string"
    }
  },
  "id" : "FontSet"
},"ColorScheme": {
  "properties" : {
    "Accent1" : {
      "type" : "string"
    },
    "Accent2" : {
      "type" : "string"
    },
    "Accent3" : {
      "type" : "string"
    },
    "Accent4" : {
      "type" : "string"
    },
    "Accent5" : {
      "type" : "string"
    },
    "Accent6" : {
      "type" : "string"
    },
    "Dark1" : {
      "type" : "string"
    },
    "Dark2" : {
      "type" : "string"
    },
    "FollowedHyperlink" : {
      "type" : "string"
    },
    "Hyperlink" : {
      "type" : "string"
    },
    "Light1" : {
      "type" : "string"
    },
    "Light2" : {
      "type" : "string"
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "ColorScheme"
},"TextItemsResponse": {
  "properties" : {
    "TextItems" : {
      "$ref" : "TextItems"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "TextItemsResponse"
},"Image": {
  "properties" : {
    "Width" : {
      "$ref" : "int"
    },
    "Height" : {
      "$ref" : "int"
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "Image"
},"Underline": {
  "id" : "Underline"
},"PresentationsMergeRequest": {
  "properties" : {
    "PresentationPaths" : {
      "type" : "array",
      "items" : {
        "$ref" : "string"
      }
    }
  },
  "id" : "PresentationsMergeRequest"
},"SplitDocumentResult": {
  "properties" : {
    "Slides" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "SplitDocumentResult"
},"FontScheme": {
  "properties" : {
    "Major" : {
      "$ref" : "FontSet"
    },
    "Minor" : {
      "$ref" : "FontSet"
    },
    "Name" : {
      "type" : "string"
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "FontScheme"
},"PresentationToMerge": {
  "properties" : {
    "Path" : {
      "type" : "string"
    },
    "Slides" : {
      "type" : "array",
      "items" : {
        "$ref" : "int"
      }
    }
  },
  "id" : "PresentationToMerge"
},"SlideComments": {
  "properties" : {
    "List" : {
      "type" : "array",
      "items" : {
        "$ref" : "SlideComment"
      }
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "SlideComments"
},"ShapeListResponse": {
  "properties" : {
    "ShapeList" : {
      "$ref" : "Shapes"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "ShapeListResponse"
},"Document": {
  "properties" : {
    "DocumentProperties" : {
      "$ref" : "ResourceUriElement"
    },
    "Slides" : {
      "$ref" : "ResourceUriElement"
    },
    "Images" : {
      "$ref" : "ResourceUriElement"
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "Document"
},"FormatSchemeResponse": {
  "properties" : {
    "FormatScheme" : {
      "$ref" : "FormatScheme"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "FormatSchemeResponse"
},"PresentationStringReplaceResponse": {
  "properties" : {
    "Document" : {
      "$ref" : "Document"
    },
    "Matches" : {
      "$ref" : "int"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "PresentationStringReplaceResponse"
},"Orientation": {
  "id" : "Orientation"
},"Placeholder": {
  "properties" : {
    "Index" : {
      "type" : "integer",
      "format" : "int32"
    },
    "Orientation" : {
      "$ref" : "PlaceholderOrientation"
    },
    "Size" : {
      "$ref" : "PlaceholderSize"
    },
    "Type" : {
      "$ref" : "PlaceholderType"
    },
    "Shape" : {
      "$ref" : "ResourceUriElement"
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "Placeholder"
},"PageVerticalAlignment": {
  "id" : "PageVerticalAlignment"
},"FontSchemeResponse": {
  "properties" : {
    "FontScheme" : {
      "$ref" : "FontScheme"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "FontSchemeResponse"
},"PlaceholderSize": {
  "id" : "PlaceholderSize"
},"StyleIdentifier": {
  "id" : "StyleIdentifier"
},"SplitDocumentResponse": {
  "properties" : {
    "SplitResult" : {
      "$ref" : "SplitDocumentResult"
    },
    "Code" : {
      "type" : "string"
    },
    "Status" : {
      "type" : "string"
    }
  },
  "id" : "SplitDocumentResponse"
},"DocumentProperty": {
  "properties" : {
    "Name" : {
      "type" : "string"
    },
    "Value" : {
      "type" : "string"
    },
    "BuiltIn" : {
      "type" : "boolean"
    }
  },
  "id" : "DocumentProperty"
},"Shape": {
  "properties" : {
    "Text" : {
      "type" : "string"
    },
    "Paragraphs" : {
      "$ref" : "ResourceUriElement"
    },
    "ShapeType" : {
      "$ref" : "AutoShapeType"
    },
    "Name" : {
      "type" : "string"
    },
    "Width" : {
      "$ref" : "float"
    },
    "Height" : {
      "$ref" : "float"
    },
    "AlternativeText" : {
      "type" : "string"
    },
    "Hidden" : {
      "type" : "boolean"
    },
    "X" : {
      "$ref" : "float"
    },
    "Y" : {
      "$ref" : "float"
    },
    "ZOrderPosition" : {
      "$ref" : "int"
    },
    "Shapes" : {
      "$ref" : "ResourceUriElement"
    },
    "FillFormat" : {
      "$ref" : "ResourceUriElement"
    },
    "LineFormat" : {
      "$ref" : "ResourceUriElement"
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "Shape"
},"Theme": {
  "properties" : {
    "Name" : {
      "type" : "string"
    },
    "ColorScheme" : {
      "$ref" : "ResourceUriElement"
    },
    "FontScheme" : {
      "$ref" : "ResourceUriElement"
    },
    "FormatScheme" : {
      "$ref" : "ResourceUriElement"
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "Theme"
},"Shapes": {
  "properties" : {
    "ShapesLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUriElement"
      }
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "Shapes"
},"SlideBackground": {
  "properties" : {
    "Type" : {
      "type" : "string"
    },
    "SelfUri" : {
      "$ref" : "ResourceUri"
    },
    "AlternateLinks" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    },
    "Links" : {
      "type" : "array",
      "items" : {
        "$ref" : "ResourceUri"
      }
    }
  },
  "id" : "SlideBackground"
}
}