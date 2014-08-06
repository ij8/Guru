package TxtHandler;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class RemoveAndAddTags {
	
	ArrayList<String> splitString = new ArrayList<String>();
	
	/**
	 * This method reads the file with the filename given and stores each line
	 * into the output arraylist.
	 * @param filename
	 * @return
	 */
	private String readFile(String filename) {
		String output = "";
		try {
			FileReader dataFile = new FileReader(filename);
			BufferedReader bufferedReader = new BufferedReader(dataFile);
			String currentLine = bufferedReader.readLine();

			while(currentLine != null) {
				String trimmedWord = currentLine.trim();
				output += trimmedWord;
				currentLine = bufferedReader.readLine();
			}
			bufferedReader.close();
		} 
		catch (IOException e) {
			System.err.println("A error occured reading file: " + e);
			e.printStackTrace();
		}
		return output;
	}
		
	private void splitByTags(String input)	{
		if(input.indexOf('<') != -1 && input.indexOf('>') != -1)	{
			if(isThereSomethingBeforeFirstTag(input))	{
				splitString.add(input.substring(0,input.indexOf('<')));
			}
			splitString.add(findFirstTag(input));
			splitByTags(input.substring(input.indexOf('>')+1));
		}
		else if(input.trim().length() > 0){
			splitString.add(input.trim());
		}
		
	}
	
	
	private boolean isThereSomethingBeforeFirstTag(String input)	{
		if(input.indexOf('<') != -1)	{
			String beforeTag = input.substring(0,input.indexOf('<') );
			if(beforeTag.trim().length() != 0){
				return true;
			}
		}
		return false;
	}
	
	private String findFirstTag(String input)	{
		if(input.indexOf('<') != -1 && input.indexOf('>') != -1)	{
			return input.substring(input.indexOf('<'), input.indexOf('>')+1);
		}
		return "no tags";
	}
	
	private void searchAndAddTags(String query){
		for(String s:splitString){
			if(!s.contains("<"))	{
				String[] wordArray = s.split(" ");
				for(String word:wordArray)	{
					if(word.toLowerCase().equals(query.toLowerCase()))	{
						word = "<span>" + word + "</span>";
					}
				}
				s = "";
				for(String word:wordArray){
					s += word + " ";
				}
			}
			System.out.println(s);
		}
	}
	
	public static void main(String[] args)	{
		RemoveAndAddTags r = new RemoveAndAddTags();
		String input = r.readFile("files/TestHtml.txt");	
		System.out.println(input);
		r.splitByTags(input);
		System.out.println(r.splitString);
		r.searchAndAddTags("text");
	}
}
