import Cocoa

/* make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:
 
 A property storing how many rooms it has.
 A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
 A property storing the name of the estate agent responsible for selling the building.
 A method for printing the sales summary of the building, describing what it is along with its other properties.
 */

protocol Building {
    var numRooms: Int { get }
    var cost: Int { get set }
    var estateAgentName: String { get set }
    func showSalesSummary()
}

struct House: Building {
    var numRooms = 6
    var cost = 500_000
    var estateAgentName = "Charley Reagent"
    
    func showSalesSummary() {
        print("\(estateAgentName) sold a house containing \(numRooms) for \(cost)")
    }
}

struct Office: Building {
    var numRooms = 25
    var cost = 1_000_000
    var estateAgentName = "Offices Unlimited Inc"
    var name = "A Dental Place"
    
    func showSalesSummary() {
        print("\(estateAgentName) sold \(name) containing \(numRooms) for \(cost)")
    }
}

var dentalOffice = Office()
dentalOffice.showSalesSummary()

var myHouse = House()
myHouse.showSalesSummary()


