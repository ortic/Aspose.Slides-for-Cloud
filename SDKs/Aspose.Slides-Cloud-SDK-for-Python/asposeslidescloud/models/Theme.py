#!/usr/bin/env python

class Theme(object):
    """NOTE: This class is auto generated by the swagger code generator program.
    Do not edit the class manually."""


    def __init__(self):
        """
        Attributes:
          swaggerTypes (dict): The key is attribute name and the value is attribute type.
          attributeMap (dict): The key is attribute name and the value is json key in definition.
        """
        self.swaggerTypes = {
            'Name': 'str',
            'ColorScheme': 'ResourceUriElement',
            'FontScheme': 'ResourceUriElement',
            'FormatScheme': 'ResourceUriElement',
            'SelfUri': 'ResourceUri',
            'AlternateLinks': 'list[ResourceUri]',
            'Links': 'list[ResourceUri]'

        }

        self.attributeMap = {
            'Name': 'Name','ColorScheme': 'ColorScheme','FontScheme': 'FontScheme','FormatScheme': 'FormatScheme','SelfUri': 'SelfUri','AlternateLinks': 'AlternateLinks','Links': 'Links'}       

        self.Name = None # str
        self.ColorScheme = None # ResourceUriElement
        self.FontScheme = None # ResourceUriElement
        self.FormatScheme = None # ResourceUriElement
        self.SelfUri = None # ResourceUri
        self.AlternateLinks = None # list[ResourceUri]
        self.Links = None # list[ResourceUri]
        
