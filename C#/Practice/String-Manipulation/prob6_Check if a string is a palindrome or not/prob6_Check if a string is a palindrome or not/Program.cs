using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prob6_Check_if_a_string_is_a_palindrome_or_not
{
    internal class Program
    {
        /*
         * Problem 6: Check if a string is a palindrome or not.
            * Solution

            Here we have to check that a string is palindrome or not. 
            Palindrome means when you read it from the beginning or from the last, 
            characters should be the same.
            Here, we will check each character from the beginning and compare it from last. 
        */
        static void Main(string[] args)
        {
            string str = "";
            Console.WriteLine("Please enter a string");
            str = Console.ReadLine(); //My name is mukesh
            Console.WriteLine("");

            checkString(str);

            bool palindrome;
            string reverseString = "";
            for(int i = str.Length - 1; i >= 0; i--)
            {
                reverseString += str[i];
            }

            if(str == reverseString)
            {
                palindrome = true;
            }
            else
            {
                palindrome = false;
            }

            Console.WriteLine("Is the string \"{0}\" a PALINDROME?: {1} ", str, palindrome );
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
