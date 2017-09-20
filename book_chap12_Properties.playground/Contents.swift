//: Playground - noun: a place where people can play

import UIKit

// Chapter 12: Properties


// the Car structure has two properties, both constants that store String values:
struct Car {
    let make: String
    let color: String
}

// Values like these are called properties. The two properties of Car are both stored properties, which means they store actual string values for each instance of Car.
// Some properties calculate values rather than store them; that means there’s no actual memory allocated for them, but they get calculated on-the-fly each time you access them. Naturally, these are called "computed properties".

// [1. Stored properties]

// imagine you’re building an address book. The common unit you’ll need is a Contact:
struct Contact {
    var fullName: String
    var emailAddress: String
}

// You can use this structure over and over again, letting you build an array of contacts, each with a different value. The properties you want to store are an individual’s full name and email address.
// You provide a data type for each, but opt "not to assign a default value", because you plan to assign the value upon initialization. After all, the values will be different for each instance of Contact.
// Swift automatically creates an initializer for you based on the properties you defined in your structure:
var person = Contact(fullName: "Grace Murray",
                     emailAddress: "grace@navy.mil")

//You can access the individual properties using dot notation:
let name = person.fullName // Grace Murray
let email = person.emailAddress // grace@navy.mil









