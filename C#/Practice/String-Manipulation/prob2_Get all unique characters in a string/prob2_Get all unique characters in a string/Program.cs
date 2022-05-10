using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prob2_Get_all_unique_characters_in_a_string
{
    internal class Program
    {
        /*
         * Problem 2: Get all unique characters in a string.
         * This is just opposite of problem 1. 
         * In problem 1, we are trying to find duplicate characters but here, we are trying to find all unique characters. 
         * Means, just remove duplicate characters and you will get a unique characters list. If you compare above and below code,
         * we are now returning the result object where all unique characters are available.
         */
        static void Main(string[] args)
        {
            string str = "";
            Console.WriteLine("Please enter a string");
            str = Console.ReadLine();
            checkString(str);
            str = str.ToUpper();


            Console.WriteLine("Below are the UNIQUE letters of string: {0}", str);
            Console.WriteLine("");

            char[] chars = str.ToCharArray(); // converts string to an array of chars

            for (int i = 0; i < chars.Length; i++)
            {

                for (int j = i + 1; j < chars.Length; j++) // compare next character
                {
                    if (chars[i] == chars[j] && chars[i] != ' ')
                    {
                        chars[j] = '0';
                    }

                }
                if (chars[i] != '0' && chars[i] != ' ')
                {
                    Console.Write("{0} ", chars[i]);
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
