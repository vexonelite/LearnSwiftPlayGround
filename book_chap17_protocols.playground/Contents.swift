//: Playground - noun: a place where people can play

import UIKit

// Chapter 17: Protocols

// There’s one final type that can bridge common behaviors between structs, classes and enums. In fact, it is itself a user-defined named type: the protocol.
// However, protocols don’t define a type you can instantiate directly. Instead, they define an interface or a template for an actual concrete type such as a struct, class or enumeration. With a protocol, you can define a common set of behaviors and then define the actual types that implement them.

protocol Vehicle {
    func accelerate()
    func stop()
}
