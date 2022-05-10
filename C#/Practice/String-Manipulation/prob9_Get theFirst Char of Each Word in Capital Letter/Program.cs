using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prob9_Get_theFirst_Char_of_Each_Word_in_Capital_Letter
{
    internal class Program
    {
        /*
         * Problem 9: Get the first char of each word in capital letter.
            Solution
            Here, you will get one string, 
            it could be a word or sentence as well.
            We have to find out the first character of each word and capitalize it. 
            After checking the null or empty string, 
            we will split it into an string array based on space. 
            Then loop through the string array and get the first character of each word using Substring method 
            and capitalize it using ToUpper method. 
         */
        static void Main(string[] args)
        {
            string str = "";
            Console.WriteLine("Please enter a string");
            str = Console.ReadLine(); //I love my india.
            Console.WriteLine("");

            checkString(str);

            Console.Write("The first letters of each word capitalized is: "); //I love my india.

            string[] arr = str.Split(' ');
            for (int i = 0; i < arr.Length; i++)
            {
                Console.Write(arr[i].Substring(0, 1).ToUpper() + " ");
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
