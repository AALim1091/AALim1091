using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prob4_Reverse_each_word_of_the_sentence
{
    internal class Program
    {
        /*
         * Problem 4: Reverse each word of the sentence (string).
            Solution
            Here, we have not only reversed a string but need to reverse a sentence. 
            Here, we will first split the sentence into an string array and then reverse each word one by one as follows.
         */
        static void Main(string[] args)
        {
            string str = "";
            Console.WriteLine("Please enter a string");
            str = Console.ReadLine(); //My name is mukesh
            Console.WriteLine("");

            checkString(str);

            string[] arr = str.Split(' '); //creates a array of strings, 1 index for each word
            string result = "";

            for (int i = 0; i < arr.Length; i++)
            {
                string word = arr[i] + " ";
                for(int j = word.Length - 1; j >= 0; j--)
                {
                    result += word[j];
                }
            }

            Console.WriteLine("Reversed string for '{0}' is: {1} ",str,result);
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
