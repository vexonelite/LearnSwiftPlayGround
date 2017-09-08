//: Playground - noun: a place where people can play

import UIKit

// Chapter 8: Arrays

// An array is an ordered collection of values of the same type.
// Arrays are useful when you want to store your items in a particular order

// If the array doesn’t need to change after you’ve created it, you should make it immutable by declaring it as a constant with let. 
// If you need to add, remove or update values in the array, then you should create a mutable array by declaring it as a variable.



// [1. Creating arrays]

// array literal
let evenNumbers = [2, 4, 6, 8]
let nameString = ["John", "Mary", "Tom", "Paul", "Anne"]

// An empty array can be created using the empty array literal []. Because thecompiler isn’t able to infer a type from this, you need to use a type annotation to make the type explicit:
var subscribers: [String] = []

// create an array with all of its values set to a default value:
let allZeros = [Int](repeating: 0, count: 5)
// type inference
let allZerosInferred = Array(repeating: 0, count: 5)


//Finally, remember that it’s good practice to declare arrays that aren’t going to change as constants. For example, consider this array:
let vowels = ["A", "E", "I", "O", "U"]



// Immutable
let playersC: [String] = ["Alice", "Bob", "Cindy", "Dan"]
// Muutable
var players: [String] = ["Alice", "Bob", "Cindy", "Dan"]
print(players.isEmpty)



// [2. Accessing elements]

// [ - Using Array's properties and methods - ]

// isEmpty property
print(players.isEmpty)


// count property
if players.count < 2 {
    print("We need at least two players!")
} else {
    print("Let's start!")
}


// property first/ last will return an optional
// also, method min() and max() will return optional

// warning here:
//print(players.first)
//print(players.last)
//print(players.min())
//print(players.max())
var currentPlayer = players.first
//print(currentPlayer)
currentPlayer = players.min()
//print(currentPlayer)


// using optional binding to do
if let firstPlayer = players.first {
    print(firstPlayer)
}

if let minPlayer = players.min() {
    print(minPlayer)
}


// [ - Using subscripting - ]

var firstPlayer = players[0]
print("First player is \(firstPlayer)")


//When you use subscripts, you don’t have to worry about optionals, since trying to access a non-existing index doesn’t return nil; it simply causes a runtime error. (it will make app crash)

//var wrongPlayer = players[4]
// > fatal error: Index out of range


// [ - Using ranges - ]
let upcomingPlayers = players[1...2]
print("upcoming players are \(upcomingPlayers)")


let upcomingPlayers2 = players[1 ..< players.count]
print(upcomingPlayers2)







