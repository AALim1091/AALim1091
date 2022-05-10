using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prob3_Reverse_a_string
{
    internal class Program
    {
        /*
         * Problem 3: Reverse a string.
         *Here, we have to reverse a string. For example,
         *if we pass a string as "hello" then output should be "olleh". 
         *For reversing the string, first, we will check the string should not be null or empty.
         *After that we will loop on the string from the second last index (length - 1) 
         *and output will be added into another string object "result".
         */
        static void Main(string[] args)
        {
            string str = "";
            Console.WriteLine("Please enter a string");
            str = Console.ReadLine();

            checkString(str);

            string reverseString = "";

            for(int i = str.Length - 1; i >= 0; i--)
            {
                reverseString += str[i];
            }

            Console.Write("The string {0} REVERSED is: {1} ", str, reverseString);
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
