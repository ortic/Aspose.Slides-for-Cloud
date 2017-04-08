package com.aspose;

public class App {

	public static void main(String[] args) {
		String baseGitHubFolder = "/home/mateen/";

		String examples = "/home/mateen/Aspose.Tasks-for-Java/Examples/src/main/java/com/aspose/tasks/examples/";
		String snippets = baseGitHubFolder + "latest_gists/";

		try {
			ExamplesToSnippetsConverter converter = new ExamplesToSnippetsConverter();
			converter.ProcessExamples(examples, snippets);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		System.out.println("\n\nProgram finished. Press any key to continue....");

	}

}
