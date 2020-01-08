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

    let vegetable = "red pepper"
    switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
    }

    let interestingNumbers = [
        "Prime": [2, 3, 5, 7, 11, 13],
        "Fibonacci": [1, 1, 2, 3, 5, 8],
        "Square": [1, 4, 9, 16, 25],
    ]
    var largest = 0
    var largestKind = ""
    for (kind, numbers) in interestingNumbers {
        for number in numbers {
            if number > largest {
                largest = number
                largestKind = kind
            }
        }
    }
    print("largest: '\(largestKind)': \(largest)")

    var n = 2
    while n < 100 {
        n *= 2
    }
    print(n)

    var m = 2
    repeat {
        m *= 2
    } while m < 100
    print(m)

    var total = 0
    for i in 0..<4 {
        total += i
    }
    print(total)
}

// Weird, write _ brefore the parameter name to avoid using argument label.
func greet(person: String, day: String) -> String
{
    return "\(person), today is \(day)"
}
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}

func functions_and_closures()
{
    print(greet(person: "Bob", day: "Tuesday"))

    let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
    print(statistics.max)
    print(statistics.2)

    let increment = makeIncrementer()
    print(increment(7))

    let numbers = [20, 19, 7, 12]
    print(hasAnyMatches(list: numbers, condition: lessThanTen))

    let mappedNumbers = numbers.map({ number in 3 * number })
    print(mappedNumbers)

    let sortedNumbers = numbers.sorted { $0 > $1 }
    print(sortedNumbers)
}
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

func objects_and_classes()
{
    let shape = Shape()
    shape.numberOfSides = 7
    print(shape.simpleDescription())
    shape.numberOfSides = 8 // "let" is a lie! Or at least it doesn't mean "const".
    print(shape.simpleDescription())

    let test = Square(sideLength: 5.2, name: "my test square")
    print(test.area())
    print(test.simpleDescription())

    let triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
    print(triangle.perimeter)
    triangle.perimeter = 9.9
    print(triangle.perimeter)

    let triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
    print(triangleAndSquare.square.sideLength)
    print(triangleAndSquare.triangle.sideLength)
    triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
    print(triangleAndSquare.triangle.sideLength)

    let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
    let sideLength = optionalSquare?.sideLength
    print(sideLength!)
}

func enumerations_and_structures()
{
    enum Rank: Int {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king

        func simpleDescription() -> String {
            switch self {
            case.ace:
                return "ace"
            case.jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
            }
        }
    }
    let ace = Rank.ace
    print(ace)
    let aceRawValue = ace.rawValue
    print(aceRawValue)

    if let convertedRank = Rank(rawValue: 11) {
        let threeDescription = convertedRank.simpleDescription()
        print(threeDescription)
    }

    enum Suit {
        case spades, hearts, diamonds, clubs

        func simpleDescription() -> String {
            switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
            }
        }
    }
    let hearts = Suit.hearts
    print(hearts)
    let heartsDescription = hearts.simpleDescription()
    print(heartsDescription)

    enum ServerResponse {
        case result(String, String)
        case failure(String)
    }

    let success = ServerResponse.result("6:00 am", "8:09 pm")
    let failure = ServerResponse.failure("Out of cheese.")
    func printMessage(response: ServerResponse) {
        switch response {
        case let .result(sunrise, sunset):
            print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
        case let .failure(message):
            print("Failure...  \(message)")
        }
    }
    printMessage(response: success)
    printMessage(response: failure)

    struct Card {
        var rank: Rank
        var suit: Suit
        func simpleDescription() -> String {
            return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
        }
    }
    let threeOfSpades = Card(rank: .three, suit: .spades)
    print(threeOfSpades.simpleDescription())
}

simplevalues()
controlflow()
functions_and_closures()
objects_and_classes()
enumerations_and_structures()
// protocols_and_extensions()
// error_handling()
// generics()

