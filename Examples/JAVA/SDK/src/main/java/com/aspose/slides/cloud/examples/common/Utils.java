package com.aspose.slides.cloud.examples.common;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Logger;

public class Utils {

    
  
    public static final String STORAGE = null;
    public static final String FOLDER = null;
    public static final String BASE_PATH = null;

    private static final Logger LOGGER = Logger.getLogger(Utils.class.getName());

    public static Path getPath(Class example, String filename) {
        final File f = new File(example.getProtectionDomain().getCodeSource().getLocation().getPath());
        String path=f.getAbsolutePath();
        int subPathIndex=path.indexOf("Examples");
        String subPath=path.substring(0, subPathIndex) + "Data/" + filename;

        Path p=Paths.get(subPath);
        return p;
    }

   
    
}