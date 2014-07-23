package TxtHandler;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

/**
 * This is a class to use as reference for reading and writing files.
 * @author IJo
 *
 */
public class FileLoader {
	private ArrayList<String> myLines;

	/**
	 * This method reads the file with the filename given and stores each line
	 * into the output arraylist.
	 * @param filename
	 * @return
	 */
	private ArrayList<String> readFile(String filename) {
		myLines = new ArrayList<String>();
		try {
			FileReader dataFile = new FileReader(filename);
			BufferedReader bufferedReader = new BufferedReader(dataFile);
			String currentLine = bufferedReader.readLine();

			while(currentLine != null) {
				String trimmedWord = currentLine.trim();
				myLines.add(trimmedWord);
				currentLine = bufferedReader.readLine();
			}
			bufferedReader.close();
		} 
		catch (IOException e) {
			System.err.println("A error occured reading file: " + e);
			e.printStackTrace();
			return myLines;
		}
		return myLines;
	}
	
	/**
	 * This is a method to read a file by the input name 
	 * and output a copy of the file by the output name
	 * @param inputFilename
	 * @param outputFilename
	 * @throws IOException
	 */
	private void writeFile(String inputFilename, String outputFilename) throws IOException	{
		readFile(inputFilename);
		BufferedWriter writer = null;
        File outputFile = new File(outputFilename);
		writer = new BufferedWriter(new FileWriter(outputFile));
		for(String s : myLines){
	        writer.write(s + "\n");			
		}
        writer.close();
	}
	
	public static void main(String[] args) throws IOException{
		FileLoader f = new FileLoader();
		f.writeFile("files/thes.txt", "files/thescopied.txt");
	}
}
