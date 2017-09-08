//: Playground - noun: a place where people can play

import UIKit

// Chapter 9: Dictionaries

// As you can see in the diagram above, keys are unique. The same key can’t appear twice in a dictionary, but different keys may point to the same value. All keys have to be of the same type, and all values have to be of the same type.
// Dictionaries are useful when you want to look up values by means of an identifier.
// For example, the table of contents of this book maps chapter names to their page numbers, making it easy to skip to the chapter you want to read.
// How is this different from an array? With an array, you can only fetch a value by its index, which has to be an integer, and all indexes have to be sequential. In a dictionary, the keys can be of any type and in no particular order.


// [1. Creating dictionaries]
// The easiest way to create a dictionary is by using a dictionary literal. This is a list of key-value pairs separated by commas, enclosed in square brackets.
//For your card game from the last chapter, instead of using the two arrays to map players to their scores, you can use a dictionary literal:
var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores)
// > ["Craig": 8, "Anna": 2, "Donna": 6, "Brian": 2]
// the type of the dictionary is inferred to be [String: Int].

// The empty dictionary literal looks like this: [:]. You can use that to empty an existing dictionary like so:
namesAndScores = [:]

// create a new dictionary - the type annotation is required here, as the type of the dictionary cannot be inferred from the empty dictionary literal.
var pairs: [String: Int] = [:]



// [2. Accessing values]