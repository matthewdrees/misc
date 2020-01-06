#!/usr/bin/env swift

// Walking through "A Swift Tour":
// https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html
// Swift is version 5.1 at the time of this writing.

print("Hello World")

func simplevalues()
{
    var myVariable = 42
    myVariable = 50
    let myConstant = 42

    let quotation = """
    I said "I have \(myVariable) apples."
    And then "I have \(myConstant) oranges."
    """
    print(quotation)

    var shoppingList = ["catfish", "water", "tulips"]
    shoppingList[1] = "bottle of water"
    shoppingList.append("blue paint")
    print(shoppingList)

    let occupations = [
      "Malcolm": "Captain",
      "Kaylee": "Mechanic",
    ]
    print(occupations)

    let emptyArray = [String]()
    print(emptyArray)

    let emptyDictionary = [String: Float]()
    print(emptyDictionary)
}

func controlflow()
{
    let individualScores = [75, 43, 103, 87, 12]
    var teamScore = 0
    for score in individualScores {
        if score > 50 {
            teamScore += 3
        } else {
            teamScore += 1
        }
    }
    print(teamScore)

    let optionalString: String? = "Hello"
    print(optionalString == nil)

    let optionalName: String? = "John Appleseed"
    var greeting = "Hello!"
    if let name = optionalName {
        greeting = "Hello, \(name)"
    }
    print(greeting)

    // This is a warning: expression implicitly coerced from 'String?' to 'Any'
    // let optionalNameCopy = optionalName
    // print(optionalNameCopy)

    let nickName: String? = nil // Or could be a string
    let fullName: String = "John Appleseed"
    let informalGreeting = "Hi \(nickName ?? fullName)"
    print(informalGreeting)
}

simplevalues()
controlflow()

