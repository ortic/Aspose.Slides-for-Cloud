package com.aspose;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ExamplesToSnippetsConverter
    {
        private int filesTotal = 0,
            filesProcessed = 0,
            snippetsCreatedTotal = 0;
        private String searchPattern = "java";
        private ArrayList<ErrorDescription> errors = new ArrayList<ErrorDescription>();

        public void ProcessExamples(String examples, String snippets)
        {
            // Initialize
            filesTotal = 0;
            filesProcessed = 0;
            snippetsCreatedTotal = 0;
            errors.clear();

            // Get the source code files. Criteria define in search pattern
            ArrayList<String> files = DirSearch(examples, searchPattern);
            
            filesTotal = files.size();

            for(String file : files)
            {
            	if(file.endsWith("java"))
            		 ProcessSourceFile(file, snippets);
            	
            }

            ListErrors();

            System.out.println("Total example files: " + filesTotal + "\nExamples Processed: " + filesProcessed +
                "\nSnippets created: " + snippetsCreatedTotal);

            System.out.println("Failed: " + errors.size());
        }

        /// <summary>
        /// List the errors occurred during processing
        /// </summary>
        private void ListErrors()
        {
            
            if (errors.size() > 0)
            {
                for(ErrorDescription error : errors)
                {
                   System.out.println("File: " + error.sourceFile + "\nError: " + error.exception + "\n");
                }
            }
        }

        /// <summary>
        /// Read source file and create code snippets
        /// </summary>
        /// <param name="file">source file</param>
        /// <param name="snippetsFolder">Snippets folder</param>
        private void ProcessSourceFile(String file, String snippetsFolder)
        {
            try
            {
                ExampleConverter exConverter = new ExampleConverter();
                int snippetsCreated = exConverter.ProcessExample(file, snippetsFolder);

                snippetsCreatedTotal += snippetsCreated;
                if (snippetsCreated > 0)
                    filesProcessed++;
            }
            catch(Exception ex)
            {
                LogError(file, ex);
            }
        }


        private void LogError(String file, Exception ex)
        {
            errors.add(new ErrorDescription(file, ex));
        }


        private ArrayList<String> DirSearch(String sourceFolder, String filter)
        {
            
        	List<File> files=listf(sourceFolder,filter);
        	
        	ArrayList<String> fileName=new ArrayList<String>();
        	
        	for(File f: files){
        		if(f.isFile());
        			fileName.add(f.getAbsolutePath());
        	}
        
        
        	return fileName;
        }
        
        
        
        public static List<File> listf(String directoryName,String filter) {
            File directory = new File(directoryName);

            List<File> resultList = new ArrayList<File>();

            // get all the files from a directory
            File[] fList = directory.listFiles();
            
            resultList.addAll(Arrays.asList(fList));
            
            
            
            
            for (File file : fList) {
                if (file.isDirectory()) {
                    resultList.addAll(listf(file.getAbsolutePath(),filter));
                }
            }
            return resultList;
        } 
    }