using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prob8_Get_All_Possible_Substring_in_a_String
{
    internal class Program
    {
        /*
         * Problem 8: Get all possible substring in a string.
            Solution

            Here, we have one string and we have to find out all possible substrings in a string. 
            Here, we will use two for loops, one inside another one to create substrings. 
            Based on the loop index value and Substring method, 
            we will create all possible substrings for the provided string. 
         */
        static void Main(string[] args)
        {
            string str = "";
            Console.WriteLine("Please enter a string");
            str = Console.ReadLine(); //india
            Console.WriteLine("");

            checkString(str);

            for(int i = 1; i < str.Length; i++) //iterate through first string
            {
                for(int j = 0; j <= str.Length - i; j++) //iterate through 2nd string one char behind
                {
                    Console.WriteLine(str.Substring(j, i));
                }
            }
         
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
