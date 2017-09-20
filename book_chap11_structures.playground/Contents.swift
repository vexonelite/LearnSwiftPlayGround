//: Playground - noun: a place where people can play

import UIKit

// Chapter 11: Structures

// This chapter introduces structures, which are the first named type you will learn about. As you will learn, structures are types that can store named properties and define their own behaviors. Like a String, Int or Array, you can define your own structures to create named types to later use in your code. By the end of this chapter, you’ll know how to define and use your own structures.

// You begin your adventure into custom types with pizza.

// [1. Introducing structures]

// Step 1:
// As you begin to expand, you want to write a program that calculates if a potential customer is within range of a "pizza delivery restaurant". The first version of your program might might look something like this:

let restaurantLocation = (2, 4)
let restaurantRange = 2.5

// Pythagorean Theorem #$
func distance(from source: (x: Int, y: Int), to target: (x: Int, y: Int))
    -> Double {
        let distanceX = Double(source.x - target.x)
        let distanceY = Double(source.y - target.y)
        return sqrt(distanceX * distanceX + distanceY * distanceY)
}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
    let deliveryDistance = distance(from: location, to: restaurantLocation)
    return deliveryDistance < restaurantRange
}


// Step 2:
// A successful pizza delivery business may eventually expand to include multiple locations, which adds a minor twist to the deliverable calculator. Replace your existing code with the following:

let otherRestaurantLocation = (7, 8)
let otherRestaurantRange = 1.5

func isInDeliveryRange2(location: (x: Int, y: Int)) -> Bool {
    let deliveryDistance =
        distance(from: location,
                 to: restaurantLocation)
    let secondDeliveryDistance =
        distance(from: location,
                 to: otherRestaurantLocation)
    return deliveryDistance < restaurantRange ||
        secondDeliveryDistance < otherRestaurantRange
}



// Eventually, the rising number of customers will force the business to expand, and soon it might grow to a total of 10 stores! Then what? Do you keep updating your function to check against all these sets of coordinates and ranges?
// You might briefly consider creating an array of x/y coordinate tuples to keep track of your pizza restaurants, but that would be both difficult to read and maintain.

// In the example of the pizza business, you’ve been using x/y coordinate tuples to represent locations. As a first example of structures, promote locations from tuples to a structure type:
struct Location {
    let x: Int
    let y: Int
}

//This block of code demonstrates the basic syntax for defining a struct. In this case, the code declares a type named Location that combines both x and y coordinates.
// The basic syntax begins with the "struct keyword" followed by the "name of the type" and a pair of curly braces. Everything between the curly braces is a member of the struct.
// In this example, "both members are properties". Properties are constants or variables that are declared as part of a type. Every instance of the type will have these properties. This means that in our example, every Location will have both an x and a y property.

// You can instantiate a structure and store it in a constant or variable just like any other type you’ve worked with:
let storeLocation = Location(x: 2, y: 4)

// To create the Location value, you use the name of the type along with a parameter list in parentheses. This parameter list provides a way to specify the values for the properties x and y.
// This is an example of a initializer. Initializers ensure that all of the properties are known before you start using them. This is one of the key safety features of Swift; accidentally using uninitialized variables is a big source of bugs in other languages. You didn’t need to declare this initializer in the Location type, Swift provides it automatically. You’ll learn a lot more about initializers in Chapter 13, “Methods”.

struct DeliveryArea {
    var range: Double
    let center: Location
}
var storeArea = DeliveryArea(range: 4, center: storeLocation)

// Now there’s a new struct named DeliveryArea that contains a variable range property along with a constant center property. As you can see, you can have a struct value inside a struct value; here, you use the Location type as the type of the center property of the DeliveryArea struct.

// [2. Accessing members]

// With your DeliveryArea defined and an instantiated value in hand, you may be  wondering how you can use these values. Just as you have been doing with Strings, Arrays, and Dictionaries, use the dot syntax to access members:
print(storeArea.range) // 4.0

// You can even access members of members using dot syntax:
print(storeArea.center.x) // 2.0

// Similar to how you can read values with dot syntax, you can also assign them. If the delivery range of one pizza location becomes larger, you could assign the new value to the existing property:
storeArea.range = 250

// In addition to properties, you must declare the struct itself as a variable to be able to modify it after it is initialized:
let fixedArea = DeliveryArea(range: 4, center: storeLocation)
// Error: change let to var above to make it mutable.
//fixedArea.range = 250


// [3. Introducing methods]
