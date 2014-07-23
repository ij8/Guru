package TxtHandler;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class FileLoader {
	ArrayList<String> myLines;

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
	 * This method ads brackets to the beginning and end of each line and 
	 * writes a file
	 * @param filename
	 * @throws IOException 
	 */
	private void writeFileWithBracket(String inputFilename, String outputFilename) throws IOException{
		readFile(inputFilename);
		BufferedWriter writer = null;
        File outputFile = new File(outputFilename);
		writer = new BufferedWriter(new FileWriter(outputFile));
		for(String s : myLines){
	        writer.write("{" + s + "}\n");			
		}
        writer.close();
	}
	
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
		FileLoader f = new FileLoader();
//		f.writeFileWithBracket("files/thes.txt", "files/modthes.txt");
		f.readWriteWithBracket("files/thes.txt", "files/modthes.txt");
	}
}
