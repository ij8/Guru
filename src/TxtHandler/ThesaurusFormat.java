package TxtHandler;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 * This is a program to properly format thesaurus txt files from online
 * so that the GSA can use them. This class is separate 
 * @author IJo
 *
 */
public class ThesaurusFormat {
	/**
	 * This is a method that reads and writes a file at the same time to avoid
	 * iterating twice over the same arraylist containing the text of the document
	 * being parsed. The output file written is in the correct format for
	 * GSA usage.
	 * @param inputFilename
	 * @param outputFilename
	 */
	private void readWriteWithBracket(String inputFilename, String outputFilename)	{
		try {
			FileReader dataFile = new FileReader(inputFilename);
			BufferedReader bufferedReader = new BufferedReader(dataFile);
	        File outputFile = new File(outputFilename);
			BufferedWriter writer = new BufferedWriter(new FileWriter(outputFile));
			String currentLine = bufferedReader.readLine();

			while(currentLine != null) {
				String trimmedWord = currentLine.trim();
				writer.write("{" + trimmedWord + "}\n");	
				currentLine = bufferedReader.readLine();
			}
			bufferedReader.close();
	        writer.close();

		} 
		catch (IOException e) {
			System.err.println("A error occured reading file: " + e);
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) throws IOException{
		ThesaurusFormat t = new ThesaurusFormat();
		t.readWriteWithBracket("files/thes.txt", "files/modthes.txt");
	}
}
