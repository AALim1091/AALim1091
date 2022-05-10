using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prob5_Get_the_word_count_in_a_sentence
{
    internal class Program
    {
        /*
         * Problem 5: Get the word count in a sentence (string).
            Solution
            Here, we have to count the number of words in a sentence or a string and skip spaces. 
            First, check if the string is not null or empty then we have to split the sentence based on space 
            and count the length using the Length property. 
         */
        static void Main(string[] args)
        {
            string str = "";
            Console.WriteLine("Please enter a string");
            str = Console.ReadLine(); //My name is mukesh
            Console.WriteLine("");

            checkString(str);
            int count = 0;

            string[] arr = str.Split(' ');
            for(int i = 0; i < arr.Length; i++)
            {
                count++;
            }


            Console.WriteLine("The number of words in the string \"{0}\" is: {1}", str, count);
            Console.WriteLine("");

        }
        static void checkString(string str)
        {
            if (String.IsNullOrWhiteSpace(str))
            {
                Console.WriteLine("You did not enter a valid string, please restart and try again");
                Console.WriteLine("");
                System.Environment.Exit(0);
            }
        }
    }
}
