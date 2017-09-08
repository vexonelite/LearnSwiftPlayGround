//: Playground - noun: a place where people can play

import UIKit

// Chapter 5 - Advanced Flow Control

// Range

// 0, 1, 2, 3, 4, 5
let closedRange: CountableClosedRange = 0...5
// 0, 1, 2, 3, 4
let halfOpenRange: CountableRange = 0..<5

// For loop
let count = 10
var sum = 0
for i in 1...count {
    sum += i
}



//for i in CountableClosedRange {
//    sum += i
//}

let count2 = 10
sum = 1
var lastSum = 0
for _ in 0..<count {
    let temp = sum
    sum = sum + lastSum
    lastSum = temp
    print("\(sum), \(lastSum)")
}
print("\n")


// The loop still runs through all values in the range 1 to count, 
// but it will only execute the loop’s code block 
// when the where condition is true; in this case, where i is odd.
sum = 0
for i in 1...count where i % 2 == 1 {
    sum += i
}



// Looping with stride functions:
for index in stride(from: 10, to: 22, by: 4) {
    print(index)
}
// prints 10, 14, 18
for index in stride(from: 10, through: 22, by: 4) {
    print(index)
}
// prints 10, 14, 18, and 22




// switch statement

let number = 10
switch number {
    case 0:
        print("Zero\n")
        break;
    default:
        print("Non-zero\n")
        break;
}

switch number {
    case 10:
        print("It's ten!\n")
        break;
    default:
        break
}

switch number {
    case 2, 4, 6, 8, 10:
        print("Even\n")
        break;
    default:
        print("Odd\n")
        break
}

switch number {
    case let x where x % 2 == 0:
        print("Even\n")
    default:
        print("Odd\n")
}

switch number {
    case _ where number % 2 == 0:
        print("Even\n")
    default:
        print("Odd\n")
}



let string = "Dog"
switch string {
    case "Cat", "Dog":
        print("Animal is a house pet.\n")
        break;
    default:
        print("Animal is not a house pet.\n")
        break;
}

let hourOfDay = 13
var timeOfDay: String
switch hourOfDay {
    case 0, 1, 2, 3, 4, 5:
        timeOfDay = "Early morning\n"
    case 6, 7, 8, 9, 10, 11:
        timeOfDay = "Morning\n"
    case 12, 13, 14, 15, 16:
        timeOfDay = "Afternoon\n"
    case 17, 18, 19:
        timeOfDay = "Evening\n"
    case 20, 21, 22, 23:
        timeOfDay = "Late evening\n"
    default:
        timeOfDay = "INVALID HOUR!\n"
}
print(timeOfDay)

switch hourOfDay {
    case 0...5:
        timeOfDay = "Early morning\n"
    case 6...11:
        timeOfDay = "Morning\n"
    case 12...16:
        timeOfDay = "Afternoon\n"
    case 17...19:
        timeOfDay = "Evening\n"
    case 20..<24:
        timeOfDay = "Late evening\n"
    default:
        timeOfDay = "INVALID HOUR!\n"
}
print(timeOfDay)


//let coordinates = (x: 3, y: 2, z: 5)
//let coordinates = (x: 3, y: 0, z: 0)
//let coordinates = (x: 3, y: 3, z: 0)
let coordinates = (x: 3, y: 9, z: 5)
switch coordinates {
    case (0, 0, 0): // 1
        print("Origin\n")
    case (_, 0, 0): // 2
        print("On the x-axis.\n")
    case (0, _, 0): // 3
        print("On the y-axis.\n")
    case (0, 0, _): // 4
        print("On the z-axis.\n")
    default: // 5
        print("Somewhere in space\n")
}

switch coordinates {
case (0, 0, 0):
    print("Origin\n")
case (let x, 0, 0):
    print("On the x-axis at x = \(x)\n")
case (0, let y, 0):
    print("On the y-axis at y = \(y)\n")
case (0, 0, let z):
    print("On the z-axis at z = \(z)\n")
case let (x, y, z):
    print("Somewhere in space at x = \(x), y = \(y), z = \(z)\n")
}

switch coordinates {
case let (x, y, _) where y == x:
    print("Along the y = x line.\n")
case let (x, y, _) where y == x * x:
    print("Along the y = x^2 line.\n")
default:
    break
}
