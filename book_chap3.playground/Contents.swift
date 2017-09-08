//: Playground - noun: a place where people can play

import UIKit

// Type Conversion
var integer: Int = 100
var decimal: Double = 12.5
integer = Int(decimal)

let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
let totalCost: Double = hourlyRate * Double(hoursWorked)

let actuallyDouble1 = Double(3)
let actuallyDouble2: Double = 3
let actuallyDouble3 = 3 as Double



// String (basic)
let characterA: Character = "a"
let stringDog: String = "Dog"
var message = "Hello" + " my name is "
let name = "Matt"
message += name // "Hello my name is Matt"



// Tuple
let tuple = (day: 15, month: 8, year: 2015)
let day = tuple.day

let coordinates: (Int, Int) = (2, 3)
let x = coordinates.0
let y = coordinates.1

let coordinatesNamed = (x: 2, y: 3)
// Inferred to be of type (x: Int, y: Int
let x1 = coordinatesNamed.x
let y1 = coordinatesNamed.y

let coordinates3D = (x: 2, y: 3, z: 1)
let (x2, y2, z2) = coordinates3D
let x3 = coordinates3D.x
let y3 = coordinates3D.y
let z3 = coordinates3D.z
// This line of code only declares x and y. 
// The _ is special and simply means you’re ignoring this part for now.
// you can use the underscore throughout Swift to ignore a value.
let (x4, y4, _) = coordinates3D
let printOut1 = "x4: \(x4), y4: \(y4), but does not have z4!"




