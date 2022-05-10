using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Prob1_Find_duplicate_characters_in_a_string
{
    internal class Program
    {
        //Problem 1: Find duplicate characters in a string.
        /*
            Solution

            In this sample code, we have a string and we need to find all duplicate characters in the string. 
            Let create two StringBuilder objects as a result and duplicateChar. 
            We will simply loop through string chars and keep track if a char exists or not.
         * */

        static void Main(string[] args)
        {
            string str = "";
            Console.WriteLine("Please enter a string");
            str = Console.ReadLine();
            checkString(str);
            str = str.ToUpper();
            

            Console.WriteLine("Below are the duplicate letters of string: {0}", str);
            Console.WriteLine("");

            int count;
            char[] chars = str.ToCharArray(); // converts string to an array of chars

            for(int i = 0; i < chars.Length; i++)
            {
                count = 1;

                for(int j = i + 1; j < chars.Length; j++) // compare next character
                {
                    if(chars[i] == chars[j] && chars[i] != ' ')
                    {
                        count++;
                        chars[j] = '0';
                    }

                }
                if (count > 1 && chars[i] != '0')
                {
                    Console.WriteLine("{0} with a count of: {1}", chars[i], count);
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
