// This a sequence class designed to make an 
// object from a single entry fasta file

import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.FileNotFoundException;

class Sequence
{
	String header;
	String fasta;
	int seqLength;

	// constructor 
	Sequence(String fileName)
	{
		String[] arr = getFasta(fileName);
		header = arr[0];
		fasta = arr[1];
		seqLength = fasta.length();
	}

	// method to get header and fasta
	static String[] getFasta(String fileName)
	{

		// store String entries for filename
		// and future file lines
		String file = fileName;
		String line = null;
		
		// decalre variables for header and sequence
		String header = "";
		String sequence = "";
		
		// use try/catch idiom for fileIO		
		try
		{
			// reader and buffer objects
			FileReader fileReader =
				new FileReader(file);

			BufferedReader bufferedReader =
				new BufferedReader(fileReader);


			// while the reader still has lines 
			while(( line = bufferedReader.readLine()) != null)
			{
				// fasta uses ">" for delineation
				if( line.startsWith(">") )
				{
					header += line;
				}
				else
				{
					sequence += line;
				}
			}
		}

		// catch exceptions in open/read
		catch(FileNotFoundException ex)
		{
			System.out.println("Can't open the file");
		}

		catch(IOException ex)
		{
			System.out.println("Error reading file");
		}

		return new String[]{ header, sequence };
	}

}

public class seqTest
{
	public static void main(String args[])
	{
		// create Seq object
		Sequence seqObj = new Sequence("in.txt");

		// test that it worked
		System.out.println("The header is: ");
		System.out.println(seqObj.header);

		System.out.println("The sequence is: ");
		System.out.println(seqObj.fasta);

		System.out.println("The length of the fasta is:");
		System.out.println(seqObj.seqLength);
	}
}