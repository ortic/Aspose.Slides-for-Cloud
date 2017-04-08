package com.aspose;
 public class ErrorDescription
    {
        public String sourceFile = "";
        public Exception exception = null;
        
        public ErrorDescription(String s, Exception e){
        	this.sourceFile=s;
        	this.exception=e;
        }
    }