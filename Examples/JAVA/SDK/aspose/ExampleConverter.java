package com.aspose;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class ExampleConverter {

	public int ProcessExample(String sourceFile, String snippetsFolder) throws IOException
        {
            int snippetsCreated = 0;
           
            Path path = Paths.get(sourceFile);
            List<String> lines = Files.readAllLines(path);
            int lineNo = 1, startLineNo = 0, endLineNo = 0;
            for (String line : lines)
            {
                // Start - Find the snippet
                if (line.contains(Common.ExStart) == true)
                {
                    startLineNo = lineNo;
                    //Console.Write("Found ExStart at line " + startLineNo + " - ");
                    // Start - Find the ID of the snippet
                    int startID = line.indexOf(Common.ExStart) + Common.ExStart.length();
                    String snippetID = line.substring(startID).trim();
                    //Console.WriteLine("ID:" + snippetID);

                    // End - Find the snippet end in next lines
                    for (int iLines = startLineNo + 1; iLines < lines.size(); iLines++)
                    {
                        String strLine = lines.get(iLines);
                        if (strLine.contains(Common.ExEnd) == true)
                        {
                            // End - Find the ID of the snippet
                            int endID = strLine.indexOf(Common.ExEnd) + Common.ExEnd.length();
                            String snippetEndID = strLine.substring(endID).trim();
                            if (snippetID.equalsIgnoreCase(snippetEndID))
                            {
                                endLineNo = iLines + 1;
                                //Console.WriteLine("Found ExEnd at line " + endLineNo);

                                // Save the snippet
                                SaveSnippet(snippetID, startLineNo, endLineNo, lines, snippetsFolder, sourceFile);
                                snippetsCreated++;
                            }
                        }
                    }
                }

                lineNo++;
            }

            return snippetsCreated;
        }


	private void SaveSnippet(String snippetID, int startLineNo, int endLineNo, List<String> lines,
            String snippetsFolder, String sourceFile) throws IOException
        {
            // Get the name of the snippet
            String repoURL = "";
            String snippetFile = snippetsFolder + File.pathSeparatorChar + 
                GetSnippetFileName(sourceFile, snippetID,repoURL);
            // Get the lines required by the snippet
            List<String> lstLines = GetSnippetLines(startLineNo, endLineNo, lines);
            // Remove white spaces at the start
            lstLines = RemoveWhiteSpaces(lstLines);
            writeAllLines  (snippetFile, lstLines);
            //Console.WriteLine("Snippet file: " + snippetFile);
        }

	private String AddGitHubRepositoryURL() {
		

		String comment = "//";
		comment += " ";
		comment += "For complete examples and data files, please go to " + Common.GitHubURL;
		return comment;
	}

	private List<String> RemoveWhiteSpaces(List<String> lstLines) {
		// Count the white spaces in the first line
		
		int spaceCount= lstLines.get(0).indexOf( lstLines.get(0).trim());
		
		// Process all lines
		for (int iLine = 0; iLine < lstLines.size(); iLine++) {
			String line = lstLines.get(iLine);

			if (line.length() <= spaceCount)
				continue;

			// If all of the first characters are spaces, remove them
			if (line.substring(0, spaceCount).trim().length() == 0) {
				lstLines.set(iLine, line.substring(spaceCount));
			} else {
				lstLines.set(iLine,line.substring(spaceCount));
			}
		}
		return lstLines;
	}

	private List<String> GetSnippetLines(int startLineNo, int endLineNo, List<String> lines) {
		// Create an empty list
		ArrayList<String> lstLines = new ArrayList<String>();

		for (int iLines = startLineNo - 1; iLines < endLineNo; iLines++) {
			// Do not add the line, if it contains ExStart or ExEnd
			if (lines.get(iLines).contains(Common.ExStart) || lines.get(iLines).contains(Common.ExEnd))
				continue;
			lstLines.add(lines.get(iLines));
		}

		return lstLines;
	}

	private String GetSnippetFileName(String sourceFile, String snippetID,  String repoURL) throws IOException
        {
			File file=new File(sourceFile);
            String snippetFileRaw =file.getParentFile().getAbsolutePath().replaceAll("/", "-") + "-" + 
            		getFileNamewithoutExtension(sourceFile) + "-" + snippetID + "."+ getExtension(sourceFile);

           int index=snippetFileRaw.indexOf(Common.FolderNameGitHubExamples); 
           String snippetFile=snippetFileRaw.substring(index);
           return snippetFile.replace(":", "");
        }
	
	private String getFileNamewithoutExtension(String fullPath){
		File userFile = new File(fullPath);
		String fileName = userFile.getName();
		return fileName.replaceFirst("[.][^.]+$", "");
	}

	
	private void writeAllLines  (String snippetFile, List<String>lstLines) throws IOException{
		ArrayList<String> finalLines=new ArrayList<>();
		finalLines.add(AddGitHubRepositoryURL());
		finalLines.addAll(lstLines);
		Path file = Paths.get(snippetFile.replace(":", ""));
		
		Files.write(file, finalLines, Charset.forName("UTF-8"));
	}
	
	private String getExtension(String fileName){
		String extension = "";

		int i = fileName.lastIndexOf('.');
		if (i > 0) {
		    extension = fileName.substring(i+1);
		}
		
		return extension;
	}
}
