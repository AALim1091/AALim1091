using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prob10_Get_the_Index_of_String
{
    internal class Program
    {
        /*
         * Problem 10: Get the index of string
            Solution
            Here, C# provides the binary search mechanism on array, list etc. We can use the BinarySearch method. 
            In this method, you can pass an array or list and the strings that needs to be searched. 
         */
        static void Main(string[] args)
        {
            string str = "";
            Console.WriteLine("Please enter a string");
            str = Console.ReadLine(); //Am Guest Hi I Mukesh
            str = str.ToUpper();
            Console.WriteLine("");
            checkString(str);


            //Hi Guest I Mukesh Am

            Console.WriteLine("Now enter the word to search and we will return the index location");
            string word = Console.ReadLine();
            word = word.ToUpper();
            checkWord(str, word);

            string[] arr = str.Split(' ');
           // Array.Sort(arr); //Am Guest Hi I Mukesh

            int index = 0;
            for (int i = 0; i < arr.Length; i++)
            {
                if(word == arr[i])
                {
                    index = i;
                    Console.WriteLine("");
                    Console.WriteLine("The position of \"{0}\" in array is: {1}", word, index);
                    Console.WriteLine("");
                }
            }
            

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
        static void checkWord(string str, string word)
        {
           checkString(word);

            for (int i = 0; i < str.Length; i++)
            {
                if (!str.Contains(word))
                {
                    Console.WriteLine("You entered an invalid word, please restart and try again");
                    Console.WriteLine("");
                    System.Environment.Exit(0);
                }
            }
        }
    }
}
