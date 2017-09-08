//: Playground - noun: a place where people can play

import UIKit

// Chapter 8: Arrays

// An array is an ordered collection of values of the same type.
// Arrays are useful when you want to store your items in a particular order

// If the array doesn’t need to change after you’ve created it, you should make it immutable by declaring it as a constant with let. 
// If you need to add, remove or update values in the array, then you should create a mutable array by declaring it as a variable.


// array literal
let evenNumbers = [2, 4, 6, 8]
let nameString = ["John", "Mary", "Tom", "Paul", "Anne"]

// An empty array can be created using the empty array literal []. Because thecompiler isn’t able to infer a type from this, you need to use a type annotation to make the type explicit:
var subscribers: [String] = []

// create an array with all of its values set to a default value:
let allZeros = [Int](repeating: 0, count: 5)
// type inference
let allZerosInferred = Array(repeating: 0, count: 5)

// Immutable
let playersC: [String] = ["Alice", "Bob", "Cindy", "Dan"]
// Muutable
var players: [String] = ["Alice", "Bob", "Cindy", "Dan"]
print(players.isEmpty)

if players.count < 2 {
    print("We need at least two players!")
} else {
    print("Let's start!")
}

// warning here:
print(players.first)
print(players.last)
print(players.min())
print(players.max())

if let firstPlayer = players.first {
    print(firstPlayer)
}



