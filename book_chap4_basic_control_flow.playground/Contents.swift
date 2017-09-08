//: Playground - noun: a place where people can play

import UIKit

// Chapter 4 - Control flow

// Boolean Operator
let doesOneEqualTwo = (1 == 2)
let doesOneNotEqualTwo = (1 != 2)
let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)
let isOneGreaterThanOrEqualToTwo = (1 >= 2)
let isOneLessThanOrEqualToTwo = (1 <= 2)


let and = true && true
let or = true || false
let andTrue = (1 < 2) && (4 > 3)
let andFalse = (1 < 2) && (3 > 4)
let orTrue = (1 < 2) || (3 > 4)
let orFalse = (1 == 2) || (3 == 4)

// String equality
let guess: String = "dog"
let dogEqualsCat: Bool = (guess == "cat")
// This syntax checks if one string comes before another alphabetically. 
// In this case, order equals true because "cat" comes before "dog".
let order: Bool = "cat" < "dog"

let stringA = "café"
let stringB = "cafe\u{0301}"
let equal = stringA == stringB


// if statement
if (2 > 1) {
    print("Yes, 2 is greater than 1.")
}

let animal = "Fox"
if (animal == "Cat") || (animal == "Dog") {
    print("Animal is a house pet.")
} else {
    print("Animal is not a house pet.")
}


let hourOfDay = 12
let timeOfDay: String
if hourOfDay < 6 {
    timeOfDay = "Early morning"
} else if hourOfDay < 12 {
    timeOfDay = "Morning"
} else if hourOfDay < 17 {
    timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
    timeOfDay = "Evening"
} else if hourOfDay < 24 {
    timeOfDay = "Late evening"
} else {
    timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)


var hoursWorked = 45
var price = 0
if hoursWorked > 40 {
    let hoursOver40 = hoursWorked - 40
    price += hoursOver40 * 50
    hoursWorked -= hoursOver40
}
price += hoursWorked * 25
print(price)


//The "ternary" conditional operator
let a = 5
let b = 10
let min = a < b ? a : b
let max = a > b ? a : b



// Loops
var sum = 1
while sum < 10 {
    sum = sum + (sum + 1)
    print(sum)
}
print(sum)


// Swift version of do-white: the repeat-while
sum = 1
print("\n")
repeat {
    sum = sum + (sum + 1)
    print(sum)
} while sum < 100

sum = 1
print("\n")
repeat {
    sum = sum + (sum + 1)
    print(sum)
} while sum < 1

//Breaking out of a loop
sum = 1
print("\n")
while true {
    sum = sum + (sum + 1)
    print(sum)
    if sum >= 100 {
        break
    }
}