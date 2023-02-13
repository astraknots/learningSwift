import Cocoa

let ctemp = 46.0
var ftemp = (ctemp*9)/5+32
print("Celsius temp of \(ctemp)° is equal to Fahrenheit temp of \(ftemp)°")

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

let his_ages = ["Brian": 49]
print(his_ages["Cat", default:10])

let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people)

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

//comment? yay!
var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday

let name: String = "guy"
let num: Int = 1
let dub: Double = 0
let logic: Bool = true
let ray: [String] = ["stinrgray"]
let seter: Set<String> = Set(["something"])
let dicky: [Int:String] = [1:"me"]

var teams: [String] = [String]()
var beams = [String]()

var rayray = ["Red", "blue", "yellow", "green", "Red"]
print(rayray.count)
var setray = Set(rayray)
print("There are \(setray.count) unique items in rayray")

