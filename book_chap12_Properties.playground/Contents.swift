//: Playground - noun: a place where people can play

import UIKit

// Chapter 12: Properties


// the Car structure has two properties, both constants that store String values:
struct Car {
    let make: String
    let color: String
}

// Values like these are called properties. The two properties of Car are both "stored properties", which means they store actual string values for each instance of Car.
// Some properties calculate values rather than store them; that means there’s no actual memory allocated for them, but they get calculated on-the-fly each time you access them. Naturally, these are called "computed properties".

// [1. Stored properties]

// imagine you’re building an address book. The common unit you’ll need is a Contact:
struct Contact {
    var fullName: String
    var emailAddress: String
}

// You can use this structure over and over again, letting you build an array of contacts, each with a different value. The properties you want to store are an individual’s full name and email address.
// You provide a data type for each, but opt "not to assign a default value", because you plan to assign the value upon initialization. After all, the values will be different for each instance of Contact.
// ** Swift automatically creates an initializer for you based on the properties you defined in your structure:
var person = Contact(fullName: "Grace Murray",
                     emailAddress: "grace@navy.mil")

//You can access the individual properties using dot notation:
let name = person.fullName // Grace Murray
let email = person.emailAddress // grace@navy.mil

// You can assign values to properties as long as they’re defined as variables (and the instance is stored in a variable as well). When Grace married, she changed her last name:
person.fullName = "Grace Hopper"
let grace = person.fullName // Grace Hopper


// If you’d prefer to make it so that a value can’t be changed, you can define a property as a constant instead using let:
struct Contact2 {
    var fullName: String
    let emailAddress: String
}

var person2 = Contact2(fullName: "Grace Murray",
                     emailAddress: "grace@navy.mil")

// Once you’ve initialized an instance of this structure, you can’t change emailAddress.
// Error: cannot assign to a constant
//person2.emailAddress = "grace@gmail.com"



// [ - Default values -]

// If you can make a reasonable assumption about " what the value of a property should be when the type is initialized ", you can give that property a default value. 
// It doesn’t make sense to create a default name or email address for a contact, but imagine there’s a new property type to indicate what kind of contact it is:
struct Contact3 {
    var fullName: String
    let emailAddress: String
    var type = "Friend"
}

// By including the assignment in the definition of type, you give this property a default value. Any contact created from here on will automatically be a friend, unless you change the default value of type to something like “Work” or “Family” .




// [2. Computed properties]


// Stored properties are certainly the most common, but there are also properties that are computed, which simply means they perform a calculation before returning a value.
// While a stored property can be a constant or a variable, "a computed property must be defined as a variable". Computed properties must also include a type, because the compiler needs to know what to expect as a return value.


// The measurement for a TV is the perfect use case for a computed property. The industry definition of the screen size of a TV isn’t the screen’s height or width, but its diagonal measurement:
struct TV {
    var height: Double
    var width: Double
    // 1
    var diagonal: Int {
        // 2
        let result = sqrt(height * height + width * width)
        print("result: \(result)")
        // 3
        let roundedResult = result.rounded()
        print("roundedResult: \(roundedResult)")
        // 4
        return Int(roundedResult)
    }
}

// 1. You use an Int type for your diagonal property. Although height and width are each a Double, TV sizes are usually advertised as nice, round numbers such as 50" rather than 49.52". Instead of the usual assignment operator = to assign a value as you would for a stored property, you use curly braces to enclose your computed property’s calculation.
// 2. As you’ve seen before in this book, geometry can be handy; once you have the width and height, you can use the Pythagorean theorem to calculate the width of the diagonal.
// 3. If you convert a Double directly to Int, it truncates the decimal, so 109.99 will become just 109. That just won’t do! Instead, you use the rounded(_:) method to round the value with the standard rule: If it the decimal is 0.5 or above, it rounds up; otherwise it rounds down.
// 4. Now that you’ve got a properly rounded number, you return it as an Int.

// Computed properties "don’t store any values; they simply return values based on calculations". From outside of the structure, a computed property can be accessed just like a stored property. Test this with the TV size calculation:
var tv = TV(height: 53.93, width: 95.87)
let size = tv.diagonal // 110

tv.width = tv.height
let diagonal = tv.diagonal // 76


// [- Getter and setter -]
// The computed property you wrote in the previous section is a called a "read-only computed property". It comes with a block of code to compute the value of the property. This block of code is called a getter. It’s also possible to create a "readwrite computed property". Such a property comes with two blocks of code: a getter and a setter. This setter works differently than you might expect. Because the computed property has no place to store a value, the setter usually sets one or more related stored properties indirectly:

struct TV2 {
    var height: Double
    var width: Double
    
    var diagonal: Int {
        // 1
        get {
            // 2
            let result = sqrt(height * height + width * width)
            print("result: \(result)")
            let roundedResult = result.rounded()
            print("roundedResult: \(roundedResult)")
            return Int(roundedResult)
        }
        
        set {
            // 3
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            // 4
            print("newValue: \(newValue)")
            height = Double(newValue) * ratioHeight /
                sqrt(ratioWidth * ratioWidth + ratioHeight * ratioHeight)
            width = height * ratioWidth / ratioHeight
        }
    }
}

// 1. Because you want to include a setter, you now have to be explicit about which calculations comprise the getter and which the setter, so you surround each code block with curly braces and precede it with either get or set. This isn’t required for read-only computed properties, as their single code block is implicitly a getter.
// 2. You use the same code as before to get the computed value.
// 3. For a setter, you "usually have to make some kind of assumption". In this case, you provide a reasonable default value for the screen ratio.
// 4. The formulas to calculate a height and width, given a diagonal and a ratio, are a bit deep. You could work them out with a bit of time, but I’ve done the dirty work for you and provided them here. The important parts to focus on are:
//    • The "newValue constant" lets you use whatever value was passed in during the assignment.
//    • Remember, the diagonal is an Int, so to use it in a calculation with a Double, you must first transform it into a Double.
//    • Once you’ve done the calculations, you assign the height and width properties ofthe TV structure.

// Now, in addition to setting the height and width directly, you can set them indirectly by setting the diagonal computed property. When you set this value, your setter will calculate and store the height and width.
// Notice that there’s no return statement in a setter — it only modifies the other stored properties.

var tv2 = TV2(height: 53.93, width: 95.87)
tv2.diagonal = 70
let height = tv2.height // 34.32...
let width = tv2.width // 61.01...



// [3. Type properties]
// The type itself may also "need properties that are common across all instances. These properties are called type properties."
// Imagine you’re building a game with many levels. Each level has a few attributes, or stored properties:
struct Level {
    let id: Int
    var boss: String
    var unlocked: Bool
}
let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)

// You declare a type property using static for value-based types like structures. You can use a type property to store the game’s progress as the player unlocks each level:
struct Level2 {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool
}

// Here, highestLevel is a property on Level itself rather than on the instances. That means you don’t access a type property on an instance:



// [4. Property observers]




// [5. Lazy properties]

