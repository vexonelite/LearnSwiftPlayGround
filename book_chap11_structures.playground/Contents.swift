//: Playground - noun: a place where people can play

import UIKit

// Chapter 11: Structures

// This chapter introduces structures, which are the first named type you will learn about. As you will learn, structures are types that can store named properties and define their own behaviors. Like a String, Int or Array, you can define your own structures to create named types to later use in your code. By the end of this chapter, you’ll know how to define and use your own structures.

// You begin your adventure into custom types with pizza.

// As you begin to expand, you want to write a program that calculates if a potential customer is within range of a pizza delivery restaurant. The first version of your program might might look something like this:

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
