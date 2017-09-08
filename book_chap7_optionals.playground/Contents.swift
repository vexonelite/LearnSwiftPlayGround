//: Playground - noun: a place where people can play

import UIKit

// Chapter 7: Optionals


// Sentinel value:
// A valid value that represents a special condition such as the absence of a value is known as a sentinel value.

// For example:
// you can’t be completely confident that the server didn’t return an error.

// "Nil" is the name given to the absence of a value, and you’re about to see how Swift incorporates this concept directly into the language in a rather elegant way.

// Optional:
// Swift introduces a whole new type that can represent not just a value, but also the "absence of a value". Optional handles the possibility a value could be nil.
// If you’re handling a non-optional type, then you’re guaranteed to have a value and don’t need to worry about the existence of a valid value.
// Similarly, if you are using an optional type then you know you must handle the "nil case".
// It removes the ambiguity introduced by using sentinel values.

// Optionals are Swift’s solution to the problem of representing both a value and the absence of a value.
// An optional type is allowed to reference either a value or nil.

// By the end of this chapter, you’ll know why you need optionals and how to use them safely.


// errorCode contains either an Int or nil.
var errorCode: Int?
errorCode = 100
errorCode = nil


// Unwrapping optionals

// result1 is an optional that contains the value 30
var result1: Int? = 30
// warning happens here
print(result1)
// Error happen here: "value of optional type 'Int?' not unwrapped; did you mean to use '!' or '?'?"
//print(result1 + 1)
// the reason for above is that you’re trying to add an integer to a box — not to the value inside the box, but to the box itself.
// In short, you cannot add value to an optional type directly.



// Force unwrapping - solution for the above example
// You need to unwrap the value from its box.

// This means unwrappedAuthorName is of type String, not String?.
var authorName: String? = "Mat Galloway"
var authorAge: Int? = 30
var unwrappedAuthorName = authorName!
print("Author is \(unwrappedAuthorName)")



authorName = nil
// Error happens here because the variable contains no value when you try to unwrap it.
print("Author is \(authorName)")

// Safe way:
if authorName != nil {
    print("Author is \(authorName!)")
} else {
    print("No author.")
}

// so declare a variable as optional type
// check if it is not nil? if it is the case, then unwrap it!



// 1. Optional binding

// This optional binding gets rid of the optional type. If the optional contains a value, this value is unwrapped and stored in, or bound to, the constant unwrappedAuthorName. The if statement then executes the first block of code, within which you can safely use unwrappedAuthorName, as it’s a regular non-optional String.
// If the optional doesn’t contain a value, then the if statement executes the else block. In that case, the unwrappedAuthorName variable doesn’t even exist.
if let unwrappedAuthorName = authorName {
    print("Author is \(unwrappedAuthorName)")
} else {
    print("No author.")
}

// You can even unwrap multiple values at the same time:
if let authorName = authorName,
    let authorAge = authorAge {
    print("The author is \(authorName) who is \(authorAge) years old.")
} else {
    print("No author or no age.")
}

// You can combine unwrapping multiple optionals with additional boolean checks:
if let authorName = authorName,
    let authorAge = authorAge,
    authorAge >= 40 {
    print("The author is \(authorName) who is \(authorAge) years old.")
} else {
    print("No author or no age or age less than 40.")
}




// 2. guard statement
// Sometimes you want to check a condition and only continue executing a function if the condition is true, such as when you use optionals. 
// Imagine a function that fetches some data from the network; that fetch might fail if the network is down.
// The usual way to encapsulate this behavior is using an optional, which has a value if the fetch succeeds, and nil otherwise.
// Swift has a useful and powerful feature to help in situations like this: the guard statement.
func calculateNumberOfSides(shape: String) -> Int? {
    switch shape {
    case "Triangle":
        return 3
    case "Square":
        return 4
    case "Rectangle":
        return 4
    case "Pentagon":
        return 5
    case "Hexagon":
        return 6
    default:
        return nil
    }
}

// using optinal biding
func maybePrintSides(shape: String) {
    let sides = calculateNumberOfSides(shape: shape)
    if let unwrappedSides = sides {
        print("A \(shape) has \(unwrappedSides) sides.")
    } else {
        print("I don't know the number of sides for \(shape).")
    }
}
maybePrintSides(shape: "Exe")
maybePrintSides(shape: "Triangle")

// using guard
func maybePrintSidesGuard(shape: String) {
    guard let sides = calculateNumberOfSides(shape: shape) else {
        print("I don't know the number of sides for \(shape).")
        return
    }
    print("A \(shape) has \(sides) sides.")
}

maybePrintSidesGuard(shape: "Axe")
maybePrintSidesGuard(shape: "Square")

// You may hear programmers talking about the “happy path” through a function; this is the path you’d expect to happen most of the time. Any other path followed would be due to an error, or another reason why the function should return earlier than expected.
// Guard statements ensure the happy path remains on the left hand side of the code; this is usually regarded as a good thing as it makes code more readable and understandable.

// ** Also, because the guard statement must return in the false case, the Swift compiler knows that if the condition was true, anything checked in the guard statement’s condition must be true for the remainder of the function. This means the compiler can make certain optimizations. You don’t need to understand how these optimizations work, or even what they are, since Swift is designed to be userfriendly and fast.


// 3. nil coalescing operator "??"
// You use it when you want to get a value out of the optional no matter what — and in the case of nil, you’ll use a default value. This is called nil coalescing.


var optionalSting: String?
var mustHaveResult1 = optionalSting ?? "wtf"


// For instance:
var optionalInt: Int? = 10
var mustHaveResult2: Int
if let unwrapped = optionalInt {
    mustHaveResult2 = unwrapped
} else {
    mustHaveResult2 = 0
}
// equivalent way:
var mustHaveResult3 = optionalInt ?? 0

// seems that nil coalescing provides a way to use default value when an optinal type is nil

