//: Playground - noun: a place where people can play

import UIKit

// Chapter 10: Collection Iteration with Closures

// The previous section taught you about "functions". But Swift has another object you can use to "break up code into reusable chunks: a closure". They become particularly useful when dealing with collections.

// A closure is simply "a function with no name"; you can assign it to a variable and pass it around like any other value. This chapter shows you how convenient and useful closures can be.

// [1. Closure basics]

// Closures are so named because they have the ability to “close over” the variables and constants within the closure’s own scope. This simply means that a closure can access, store and manipulate the value of any variable or constant from the surrounding context. Variables and constants within the body of a closure are said to have been captured by the closure.
// You may ask, “If closures are functions without names, then how do you use them?” To use a closure, you first have to assign it to a variable or constant.

// ** Here’s a declaration of a variable that can hold a closure:
var multiplyClosure: (Int, Int) -> Int
// ** The type of a closure is a function type.

// Assign a closure to a variable
multiplyClosure = { (a: Int, b: Int) -> Int in
    return a * b
}

// This looks similar to a function declaration, but there’s a subtle difference. There’s the same parameter list, -> symbol and return type. But in the case of closures, these elements appear inside braces, and there is an "in" keyword after the return type.
//With your closure variable defined, you can use it just as if it were a function, like so:
let result = multiplyClosure(4, 2)




// [ - Shorthand syntax - ]

// Compared to functions, closures are designed to be lightweight. There are many ways to shorten their syntax. First, if the closure consists of a single return statement, you can "leave out the return keyword", like so:
multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b
}

// Next, you can use Swift’s type inference to shorten the syntax even more by "removing the type information":
multiplyClosure = { (a, b) in
    a * b
}


// And finally, you can even omit the parameter list if you want. Swift lets you refer to each parameter by number, starting at zero, like so:
multiplyClosure = {
    $0 * $1
}
// The parameter list, "return type" and "in keyword" are all gone, and your new closure declaration is much shorter than the original. Numbered parameters like this should really only be used when the closure is short and sweet, like the one above. If the parameter list is much longer it can be confusing to remember what each numbered parameter refers to. In these cases you should use the named syntax!



// This declares a function named operateOnNumbers, which takes Int values as its first two parameters. The third parameter is named operation and is of a function type. "operateOnNumbers" itself returns an Int.
func operateOnNumbers(_ a: Int,
                      _ b: Int,
                      operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    print(result)
    return result
}

let addClosure = { (a: Int, b: Int) in
    a + b
}

func addFunction(_ a: Int, _ b: Int) -> Int {
    return a + b
}

// operateOnNumbers is called the same way, whether the operation is a function or a closure.
operateOnNumbers(4, 2, operation: addClosure)
operateOnNumbers(4, 2, operation: addFunction)




// The power of the closure syntax comes in handy again: You can "define the closure inline with the operateOnNumbers function call", like this:
operateOnNumbers(4, 2, operation: { (a: Int, b: Int) -> Int in
    return a + b
})
// There’s no need to define the closure and assign it to a local variable or constant; you can simply declare the closure right where you pass it into the function as a parameter!


/*

But recall that you can simplify the closure syntax to remove a lot of the boilerplate
code. You can therefore reduce the above to the following:
operateOnNumbers(4, 2, operation: { $0 + $1 })
In fact, you can even go a step further. The + operator is just a function that takes
two arguments and returns one result so you can write:
operateOnNumbers(4, 2, operation: +)
There’s one more way you can simplify the syntax, but it can only be done when
the closure is the final parameter passed to a function. In this case, you can move
the closure outside of the function call:
operateOnNumbers(4, 2) {
    $0 + $1
}
 */

