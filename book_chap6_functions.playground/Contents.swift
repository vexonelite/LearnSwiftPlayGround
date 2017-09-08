//: Playground - noun: a place where people can play

import UIKit

// Chapter 6 - Functions

func printMyName() {
    print("My name is Matt Galloway.")
}
printMyName()


// Take care not to confuse the terms “parameter” and “argument”. 
// A function declares its parameters in its parameter list. 
// When you call a function, 
// you provide values as arguments for the functions parameters.

func printMultipleOfFive(value: Int) {
    print("\(value) * 5 = \(value * 5)")
}
printMultipleOfFive(value: 10)

func printMultipleOf(multiplier: Int, andValue: Int) {
    print("1. \(multiplier) * \(andValue) = \(multiplier * andValue)")
}
// Print multiple of multiplier 4 and value 2
printMultipleOf(multiplier: 4, andValue: 2)

func printMultipleOf(multiplier: Int, and value: Int) {
    print("2. \(multiplier) * \(value) = \(multiplier * value)")
}
// Print multiple of multiplier 4 and 2
printMultipleOf(multiplier: 4, and: 2)

func printMultipleOf(_ multiplier: Int, and value: Int) {
    print("3. \(multiplier) * \(value) = \(multiplier * value)")
}
//Print multiple of 4 and 2
printMultipleOf(4, and: 2)

// If you want to have no external name at all, then you can employ the underscore "_"
func printMultipleOf(_ multiplier: Int, _ value: Int) {
    print("4. \(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, 2)


func printMultipleOf5(_ multiplier: Int, _ value: Int = 1) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}
// if no value is provided for the second parameter, it defaults to 1.
printMultipleOf5(4)




// Return value:

func multiply(_ number: Int, by multiplier: Int) -> Int {
    return number * multiplier
}
let result = multiply(4, by: 2)


// return a tuple
func multiplyAndDivide(_ number: Int, by factor: Int)
    -> (product: Int, quotient: Int) {
        return (number * factor, number / factor)
}
let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quotient = results.quotient



// Function parameters are constants by default, 
// which means they can’t be modified.
func incrementAndPrint(_ value: Int) {
    //value += 1 // error will happen here!!
    print(value)
}
var value = 5
incrementAndPrint(value)

// add "inout" allow us to modify the value of parameter1
func incrementAndPrint(_ parameter1: inout Int) {
    parameter1 += 1
    print(parameter1)
}
value = 5
incrementAndPrint(&value)
print(value)



// Function overloading
func getValue() -> Int {
    return 31;
}
func getValue() -> String {
    return "Matt Galloway"
}
let intResult: Int = getValue();
let stringResult: String = getValue();



// Functions as variables: 
// Functions in Swift are simply another data type
// You can assign them to variables and constants 
// just as you can any other type of value, such as an Int or a String.

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}
printResult(subtract, 4, 2)
printResult(add, 4, 2)





// The land of no return: 
// There are some functions which are designed to never, ever, return.

// Swift has a way to tell the compiler that 
// a function is known to never return. It is done like so:
//func noReturn() -> Never {
//}

func infiniteLoop() -> Never {
    while true {
        print("wtf")
    }
}
//infiniteLoop()

//If an application is about to work with corrupt data, 
// it’s often best to crash rather than continue 
// in an unknown and potentially dangerous state.




//func isPrime(_ number: Int) -> Bool {
//    return (number / 1)
//}

func fibonacci(_ number: Int) -> Int {
    switch number {
    case 1, 2:
        return 1
    default:
        return fibonacci(number - 1) + fibonacci(number - 2)
    }
}
fibonacci(5)
fibonacci(10)
