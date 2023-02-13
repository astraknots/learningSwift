import Cocoa

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)


struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

struct Human {
    var oldFeelings: Set<String> = Set<String>()
    var feelings = [String]() {
        willSet {
            print("I'm feeling a shift towards \(concatFeelings(these:newValue.filter { !oldFeelings.contains($0) }))")
        }
        didSet {
            for aFeeling in oldValue {
                print("I used to feel \(aFeeling)")
                oldFeelings.insert(aFeeling)
            }
        }
    }
    init(someFeels: [String]) {
        self.feelings = someFeels
    }
    func expressYourself() {
        print("I'm feeling \(concatFeelings(these:feelings))")
    }
    func concatFeelings(these feels: [String]) -> String {
        var allFeelings: String = feels[0]
        for aFeeling in feels {
            if aFeeling != feels[0] {
                if aFeeling == feels[feels.count-1]{
                    allFeelings += ", and " + aFeeling
                }else {
                    allFeelings += ", " + aFeeling
                }
            }
        }
        return allFeelings
    }
}

var lunarHuman = Human(someFeels:["excited", "tired"])
lunarHuman.expressYourself()
lunarHuman.feelings.append("accomplished")
lunarHuman.feelings.append("thirsty")
