//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
 * Swift 3 String and Character Variables
 */

// variable of Character type that is just a single character

var singleLetter:Character = "F"

// string type variable, contains as many letters, numbers, etc as you want

var mishMash:String = "sdf2325&803!!~"

// create an array of Characters

var letters:[Character] = ["C", "A","R", "T","O", "O","N", "S","M", "A","R", "T", ".", "c", "o", "m"]

//convert the letters array into a string variable named website

var website:String = String (letters)

// lets play around....

print (letters.count)  // prints the number of objects in the array

// get the length of string website
print (website.characters.count ) //prints the same value


//test to see if converting it all to lower case equals "cartoonsmart.com"

if ( website.lowercased() == "cartoonsmart.com") {
    
    print (website.lowercased())
    
    //note in Swift 3 this is lowercased(). In Swift 2 it was lowercaseString
    
}

let capFirstLetters = website.capitalized  //capFirstLetters would be "Cartoonsmart.Com"

//note in Swift 3 this is .capitalized. In Swift 2 it was capitalizedString

//test to see if website contains a range of ".com"

if ( website.range(of: ".com") != nil) {
    
    //note in Swift 2, this would have been .rangeOfString(".com")
    
    print ("it has the dot com")
}

if ( website.lowercased().hasPrefix("car")) {
    
    //do something if the string begins with "car"
    
    print ("true")
    
}

print ((website == "AAA") ? "Xtrue" : "Xflase")

if (website == "AAA") {
}
if ( website.hasSuffix(".net")) {
    
    // do something if its .net
    
    print ("true")
    
} else {
    
    //its not .net
    
    print ("not true")
    
}

/**
 * How to split up a long string into shorter strings without breaking up words…
 */
var longString:String = "There was a disturbance in the Force last night. Dispatch Jedi to check it out."


let maxInOneLine:Int = 30  //max characters in the first line
var i:Int = 0

var shorterString1:String = ""
var shorterString2:String = ""

var useLine2:Bool = false //if true, we will put the rest of the string characters on line 2

//iterate through the longString one letter at a time

for letter in longString.characters {
    
    //if i is greater than 30 and the current letter is not a space...
    if ( i > maxInOneLine && String(letter)  == " " ){
        useLine2 = true
    }
    
    if (useLine2 == false){
        shorterString1 = shorterString1 + String(letter)
    }
    else {
        shorterString2 = shorterString2 + String(letter)
    }
    
    
    i += 1
    
}

let maxLogSize:Int = 10
let upperBound:Int = longString.characters.count / maxLogSize
//for index in 0 ..< upperBound {
for index in 0 ... upperBound {
    let start:Int = index * maxLogSize
    let tmp:Int = (index + 1) * maxLogSize
    let end = (tmp > longString.characters.count) ? longString.characters.count : tmp
    let log:String = String(start) + ", " + String(tmp) + ", " + String(end)
    print (log)
    print(longString.substring(with: longString.index(longString.startIndex, offsetBy:start) ..< longString.index(longString.startIndex, offsetBy:end)))
}

print( shorterString1 )  // There was a disturbance in the Force
print( shorterString2 ) // last night. Dispatch Jedi to check it out.



/**
 * How to Convert String to Int or Int to String with Swift 3…
 */
//here are a couple ways to convert an Int to a String

let someString:String = "Obi Won"
let someInt:Int = 40
let someSentence:String = "Obi Won was \(someInt) when he retired to Tattoine"
let someSentence2:String = "Old Ben was " + String(someInt + 20) + " when he secretly killed Aunt Beru and Uncle Owen"

//lets reverse it and convert a String to a number
let someNumberString:String = "30"
let someNumber:Int = Int(someNumberString)! //30
let someFloatString:String = "30.11"
let someFloat:Float = Float(someFloatString)!
