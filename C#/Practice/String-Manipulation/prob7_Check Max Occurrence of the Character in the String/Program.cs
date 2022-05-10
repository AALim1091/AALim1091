using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prob7_Check_Max_Occurrence_of_the_Character_in_the_String
{
    internal class Program
    {
        /*
         * Problem 7: Check max occurrence of a character in the string.
            Solution
            Here, we have one string and need to find that character whose occurrence is maximum. 
            First, we will convert that string to a character array and then using the loop, 
            add it to dictionary array using a key-value pair. At last, 
            we will check whose has maximum occurrence using the foreach loop. 
         */
        static void Main(string[] args)
        {
            string str = "";
            Console.WriteLine("Please enter a string");
            str = Console.ReadLine(); //Hello World
            Console.WriteLine("");

            checkString(str);

            //input: hello world
            //output: l
            int[] count = new int[256]; // With extended ASCII codes, there are a total 256 characters
            int maxCount = 0;
            char maxChar = ' ';

            for(int i = 0; i < str.Length; i++)
            {
                count[str[i]]++;
                if(count[str[i]] > maxCount)
                {
                    maxChar = str[i];
                    maxCount = count[str[i]];
                }
            }

            Console.WriteLine("The chacter with the most occurrence in the string is: {0}", maxChar);
            Console.WriteLine("Which occurs {0} times", maxCount);
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
