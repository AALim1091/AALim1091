package com.zetcode

import java.io.File
import java.io.InputStream

//1. write a function compare that accepts two numbers x, y. If x less than y return 1 , if x>y return -1 else return 0.
fun compare (x : Int, y : Int): Int {

    var result : Int = 0;
    if(x < y)
    {
        result = 1
    }
    else if(x > y)
    {
        result = -1
    }
    else(x == y)
    {
        result = 0
    }
    return result
}

//2. Write Kotlin code to display the age group based on the map below: 0-20 Family, 60- 100 senior, normal. Use the “When” statement not if else. Run the code for different ages .
fun ageGroup( age : Int):String
{
    var result : String = ""
    when(age)
    {
        in 0..20 -> result = "You are part of the Family group"
        in 21..59 -> result = "You are part of the Normal group"
        in 60..100 -> result = "Your are in the Senior group"
    }
    return result
}

//3. For the following code: replace this if with a when( file: p3.kt)
fun level(cardPoints : Int): String
{
    val cardLevel : String
    when(cardPoints)
    {
        in 0..999 -> cardLevel = "pearl"
        in 0..4999 -> cardLevel = "silver"
        in 0..9999 -> cardLevel = "gold"
        else -> cardLevel = "platinum"
    }

    return cardLevel;


}

//4. Write the code to read the text file and print its content
fun readFile(fileName : String)
{
    val inputStream: InputStream = File(fileName).inputStream()
    val inputString = inputStream.bufferedReader().use { it.readText() }
    println(inputString)
}

//5. Write the code to implement the inheritance described below :
//Individual classes without inheritance. With the use of inheritance and power of OOP
/*fun inherit(age : Int , name : String)
{

    open class Person(age: Int, name: String) {
        init {
            println("My name is $name.")
            println("My age is $age")
        }
    }

    class MathTeacher(age: Int, name: String): Person(age, name) {

        fun teachMaths() {
            println("I teach in primary school.")
        }
    }

    class Footballer(age: Int, name: String): Person(age, name) {
        fun playFootball() {
            println("I play for LA Galaxy.")
        }
    }


}
*/
open class Person(age: Int, name: String)
{
    init
    {
        println("My name is $name.")
        println("My age is $age")
    }
}

class MathTeacher(age: Int, name: String): Person(age, name)
{

    fun teachMaths()
    {
        println("I teach in CSUSB.")
    }
}

class Footballer(age: Int, name: String): Person(age, name)
{
    fun playFootball()
    {
        println("I play for LA RAMS.")
    }
}
class Businessman(age: Int, name: String): Person(age, name)
{
    fun runBusiness()
    {
        println("I work for FB")
    }
}

fun main()
{
    //1. write a function compare that accepts two numbers x, y. If x less than y return 1 , if x>y return -1 else return 0.
    println("1. write a function compare that accepts two numbers x, y. If x less than y return 1 , if x>y return -1 else return 0.")
    println("Enter a value for x: ")
    val x : Int = Integer.valueOf(readLine())
    println("Enter a value for y: ")
    val y : Int = Integer.valueOf(readLine())

    println("The results is as follows: ")
    println("If x < y, then result is 1")
    println("If x > y, then result is -1")
    println("If x == y, then result is 0")
    println("")
    val result : Int = compare(x,y)
    println("Your result is = $result")
    println("")

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //2. Write Kotlin code to display the age group based on the map below: 0-20 Family, 60- 100 senior, normal. Use the “When” statement not if else. Run the code for different ages .
    println("2. Write Kotlin code to display the age group based on the map below: 0-20 Family, 60- 100 senior, normal. Use the “When” statement not if else. Run the code for different ages .")
    println("Please enter your age to determine the group you are in: ")
    val age : Int = Integer.valueOf(readLine())
    val group : String = ageGroup(age)
    println("You entered $age, $group")
    println("")

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //3. For the following code: replace this if with a when( file: p3.kt)
    println("3. For the following code: replace this if with a when( file: p3.kt)")
    var cardPoints = 7_000
    val cardLevel =level(cardPoints)
    val plural = if(cardPoints > 1 || cardPoints == 0) "s" else ""
    println("You have $cardPoints point$plural and are at the $cardLevel level.")
    println("")

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //4. Write the code to read the text file and print its content
    println("4. Write the code to read the text file and print its content")
    val fileName : String = "C:\\Users\\Aaron\\Desktop\\src\\question4.txt" //Placed file on desktop, so i had to designate the file path
    println("The file contains the following: ")
    readFile(fileName)
    println("")

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //5. Write the code to implement the inheritance described below :
    //Individual classes without inheritance. With the use of inheritance and power of OOP
    val t1 = MathTeacher(25, "Tony")
    t1.teachMaths()
    println()
    val f1 = Footballer(29, "Henry")
    f1.playFootball()
    println()
    val b1 = Businessman(29, "Henry")
    b1.runBusiness()
    println()



}