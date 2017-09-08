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



// [ - Checking for an element - ]
// You can check if there’s at least one occurrence of a specific element in an array by using contains(_:), which returns true if it finds the element in the array, and false if it doesn’t.
func isEliminated(player: String) -> Bool {
    return !players.contains(player)
}
print(isEliminated(player: "Bob"))

print(players[1...3].contains("Bob"))



// [3. Modifying Arrays]
// You can make all kinds of changes to mutable arrays: adding and removing elements, updating existing values, and moving elements around into a different order.


// [ - Appending elements - ]
players.append("Eli")
players += ["Gina"]


// [ - Inserting elements - ]
players.insert("Frank", at: 5)
if let position = players.index(of: "Frank") {
    players.insert("Fuck", at: position + 1)
}


// [ - Removing elements - ]
var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed")

removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed")

// But how would you get the index of an element if you didn’t already know it?There’s a method for that! index(of:) returns the "first index" of the element, because the array might contain multiple copies of the same value. If the method doesn’t find the element, it returns nil.

if let position = players.index(of: "Fuck") {
    removedPlayer = players.remove(at: position)
    if removedPlayer != nil {
        print("\(removedPlayer) was removed")
    }
}


// [ - Updating elements - ]
print(players)
// > ["Alice", "Bob", "Dan", "Eli", "Frank"]
// you should use the subscript syntax to update the name:
players[4] = "Franklin"
print(players)
// > ["Alice", "Bob", "Dan", "Eli", "Franklin"]

// use subscripting with ranges to update multiple values in a single line of code:
players[0...1] = ["Donna", "Craig", "Brian", "Anna"]
print(players)
// > ["Donna", "Craig", "Brian", "Anna", "Dan", "Eli", "Franklin"]
// This code replaces the first two players, Alice and Bob, with the four players in the new players array. 
// ** As you can see, the size of the range doesn’t have to be equal to the size of the array that holds the values you’re adding. **


// [ - Moving elements - ]

// Mehod #1 - use remove() and insert()
//let playerAnna = players.remove(at: 3)
//players.insert(playerAnna, at: 0)
//print(players)
// > ["Anna", "Donna", "Craig", "Brian", "Dan", "Eli", "Franklin"]

// Method #2 - use sort()
//players.sort()
//print(players)
// > ["Anna", "Brian", "Craig", "Dan", "Donna", "Eli", "Franklin"]

// If you’d like to leave the original array untouched and return a sorted copy instead, use sorted() instead of sort().
let sortedPlayers = players.sorted()
print("players is \(players)")
print("sortedPlayers is \(sortedPlayers)")


// [4. Iterating through an array]
// This code goes over all the elements of players, from index 0 up to players.count - 1 and prints their values.
for player in players {
    print(player)
}

// If you also need the index of each element, you can iterate over the return value of the array’s enumerated() method, which returns tuples with the index and value of each element in the array.
for (index, player) in players.enumerated() {
    print("\(index + 1). \(player)")
}


// external name "in" for paramter "array" and its type is "[Int]
func sumOfAllItems(in array: [Int]) -> Int {
    var sum = 0
    for number in array {
        sum += number
    }
    return sum
}
let scores = [2, 2, 8, 6, 1, 2, 1]
print(sumOfAllItems(in: scores))



// [5. Variadic Parameters]
// A variadic parameter is used to pass an unknown number of parameters to a function. You use "three dots after the type to mark a parameter as variadic".
func sum(of numbers: Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}
print(sum(of: 1, 6, 2, -3))



// [6. Running time for array operations]
// Arrays are stored as a continuous block in memory. That means if you have ten elements in an array, the ten values are all stored one next to the other. With that in mind, here’s what the performance of various array operations costs:
// Accessing elements: The cost of fetching an element is O(1). Since all the values are sequential, it’s easy to do random access and fetch a value at a particular index; all the compiler needs to know is where the array starts and what index you want to fetch.
// Inserting elements: The complexity of adding an element depends on the position in which you add the new element:
//  • If you add to the beginning of the array, Swift can do it in O(1).
//  • If you add to the middle of the array, all values from that index on need to be shifted over. Doing so will require N/2 operations, therefore the running time is O(N).
//  • If you add to the end of the array and there’s room, it will take O(1). If there isn’t room, Swift will need to make space somewhere else and copy the entire array over before adding the new element, which will take O(N). The average case is O(1) though, because arrays are not full most of the time.
// Deleting elements: Deleting an element leaves a gap where the removed element was. As was mentioned earlier, all elements in the array have to be sequential so this gap needs to be closed by shifting elements forward.
//  The complexity is similar to inserting elements: If you’re removing an element from the beginning or the end, it’s an O(1) operation. If you’re removing from the middle, the complexity is O(N).
//  Searching for an Element: If the element you’re searching for is the first element in the array, then the search will end after a single operation. If the element doesn’t exist, you need to perform N operations until you realize that the element is not found. On average, searching for an element will take N/2 operations, therefore searching has a complexity of O(N).





