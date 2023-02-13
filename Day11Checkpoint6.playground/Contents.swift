import Cocoa

/*  create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down.
 Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
 */

enum GearChangeDirection {
    case up, down
}


struct Car {
    let model: String
    let numSeats: Int
    private var currentGear: Int
    
    init(model: String, numSeats: Int) {
        self.model = model
        self.numSeats = numSeats
        self.currentGear = 1
    }
    
    mutating func changeGear(byShifting dir: GearChangeDirection) {
        switch dir {
        case .up:
            if currentGear < 6 {
                currentGear += 1
                print("Upshifted to \(currentGear)")
            } else {
                print("We can't shift the gear any higher!")
            }
        case .down:
            if currentGear > 1 {
                currentGear -= 1
                print("Downshifted to \(currentGear)")
            } else {
                print("We can't shift the gear any lower!")
            }
            
        }
    }
}

var myCar = Car(model: "Audi", numSeats:5)
myCar.changeGear(byShifting: GearChangeDirection.up)
myCar.changeGear(byShifting: .down)
myCar.changeGear(byShifting: .down)
myCar.changeGear(byShifting: .down)
myCar.changeGear(byShifting: .up)
myCar.changeGear(byShifting: .up)
myCar.changeGear(byShifting: .up)
myCar.changeGear(byShifting: .up)
myCar.changeGear(byShifting: .up)
myCar.changeGear(byShifting: .up)
myCar.changeGear(byShifting: .up)
print(myCar.model)
print(myCar.numSeats)
