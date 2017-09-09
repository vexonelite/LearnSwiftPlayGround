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

// [ - Using subscripting - ]

// Dictionaries support subscripting to access values. Unlike arrays, you don’t access a value by its index but rather by its key.

namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores["Anna"])
// > Optional(2)
print(namesAndScores["Greg"])
// > nil

// ** Notice that the return type is an optional. The dictionary will check if there’s a pair with the key Anna, and if there is, return its value. If the dictionary doesn’t find the key, it will return nil.
if let playerScore = namesAndScores["Anna"] {
    print(playerScore)
}
if let playerScore = namesAndScores["Greg"] {
    print(playerScore)
}
else {
    print("No score for player \"Greg\"")
}


// [ - Using properties and methods - ]

namesAndScores.isEmpty
// > false

//** If you just want to know whether a dictionary has elements or not, it is always better to use the isEmpty property. A dictionary needs to loop through all of the values to compute the count. isEmpty, by contrast, always runs in constant time no matter how many values there are.

namesAndScores.count
// > 4

// If you’d like to look only at the keys or the values of a dictionary, you can create an array from the dictionary’s keys or values properties, respectively:
Array(namesAndScores.keys)
// ["Craig", "Anna", "Donna", "Brian"]
Array(namesAndScores.values)
// [8, 2, 6, 2]

// ** In order to "conserve processing and memory consumption", the keys and values properties actually return special lazy collection types. Because they conform to Swift’s "Sequence type", you can iterate over them with a for loop. They are called "lazy" because "the values only become available as your loop requests them". This is an important detail if you ever deal with dictionaries that have thousands or millions of keys and values. Often, however, just using standard, randomly accessible array is more convenient.


// [3. Modifying dictionaries]

// [ - Adding pairs -]
// var bobData: [String: String] = [:]
var bobData = ["name": "Bob",
               "profession": "Card Player",
               "country": "USA"]
bobData.updateValue("CA", forKey: "state")
bobData["city"] = "San Francisco"
print(Array(bobData.keys))
print(Array(bobData.values))


// [ - Updating values -]
if let value = bobData.updateValue("Bobby", forKey: "name") {
    print(value)
}
// You saw this method above when you read about adding pairs. Why does it return the string Bob? updateValue(_:forKey:) replaces the value of the given key with the new value and returns the old value. If the key doesn’t exist, this method will add a new pair and return nil.
bobData["profession"] = "Mailman"
print(Array(bobData.keys))
print(Array(bobData.values))


// [ - Removing pairs -]
if let value = bobData.removeValue(forKey: "state") {
    print(value)
}

// Assigning nil as a key’s associated value removes the pair from the dictionary.
bobData["city"] = nil
// ** Note: If you are using a dictionary that has values that are optional types, dictionary[key] = nil still removes the key completely. If you want keep the key and set the value to nil you must use the updateValue method.

print(Array(bobData.keys))
print(Array(bobData.values))


// [4. Iterating through dictionaries]
for (player, score) in namesAndScores {
    print("\(player) - \(score)")
}
// > Craig - 8
// > Anna - 2
// > Donna - 6

for player in namesAndScores.keys {
    print("\(player), ", terminator: "") // no newline
    //print(player)
}
print("") // print one final newline
// > Craig, Anna, Donna, Brian,



// [5. Running time for dictionary operations]

// In order to be able to examine how dictionaries work, you need to understand what hashing is and how it works. Hashing is the process of transforming a value — String, Int, Double, Bool, etc — to a numeric value, known as the hash value. This value can then be used to quickly lookup the values in a hash table.
// Swift dictionaries have a "type requirement for keys". "Keys must be Hashable" or you will get a compiler error.
// Fortunately, in Swift, "all basic types are already hashable and have a hashValue integer property". 
// Here’s an example:
print("some string".hashValue)
// > -497521651836391849
print(1.hashValue)
// > 1
print(false.hashValue)
// > 0
// The hash value has to be deterministic — meaning that a given value must always return the same hash value. No matter how many times you calculate the hash value for some string, it will always give the same value. (You should never save a hash value, however, as there is no guarantee it will be the same from run-to-run of your program.)

// Here’s the performance of various dictionary operations. This great performance hinges on having a good hashing function that avoids value collisions. If you have a poor hashing function, all of below algorithms degenerate to linear time, or O(n) performance. Fortunately, the built-in types have great, general purpose hashValue implementations.

// Accessing elements: Getting the value of a given key is a constant time operation, or O(1).
// Inserting elements: To insert an element, the dictionary needs to calculate the hash value of the key and then store data based on that hash. These are all O(1) operations.
// Deleting elements: Again, the dictionary needs to calculate the hash value to know exactly where to find the element, and then remove it. This is also an O(1) operation.
// Searching for an element: As mentioned above, accessing an element has constant running time, so the complexity for searching is also O(1).

// While all of these running times compare favorably to arrays, remember that you lose order information when using dictionaries.