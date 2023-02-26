//
//  ContentView.swift
//  UnitConverter
//
//  Created by Genevieve Krzeminski on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    
    //Length conversion
    @State private var inputLengthUnit = "yards"
    @State private var outputLengthUnit = "meters"
    @State private var inputLengthValue = 100.0
    
    //TODO: I think i'd like to try using an enum instead of these strings
    let lengthUnits = ["yards", "meters", "kilometers", "feet", "miles"]
    let mBaseUnit = "meters" //Translates to kilometers x1000
    let mUnits = ["meters", "kilometers"]
    let mUnitMult = [1.0, 1000.0]
    let fBaseUnit = "feet" //Translates to yards(x3), miles(x5280)
    let fUnits = ["feet", "yards", "miles"]
    let fUnitMult = [1.0, 3.0, 5280.0]
    
    let mToFBaseValue = 3.281 //Our single base unit is feet: 1 m = 3.281 ft
    
    func convertToFBaseUnit(from aUnit: String, aValue: Double) -> Double {
        print("Convert \(aValue) \(aUnit) to Feet")
        //Returns aValue in Feet
        if aUnit == fBaseUnit {
            print("\(aValue) already in \(aUnit)")
            return aValue
        } else {
            //First loop over potential feet based values
            //Convert to feet
            var idx = 0
            for fUnit in fUnits {
                if aUnit == fUnit {
                    return aValue * fUnitMult[idx]
                }
                idx += 1
            }
            //Then loop over meter based values
            //Convert to feet
            idx = 0
            for mUnit in mUnits {
                if aUnit == mUnit {
                    return (aValue * mUnitMult[idx]) * mToFBaseValue
                
                }
                idx += 1
            }
            
            
        }
        return 0.0
    }
    
    func convertFBaseUnitToNewUnit(to aUnit: String, aFootValue: Double) -> Double {
        //Returns aFootValue in aUnit
        if aUnit == fBaseUnit { //If it's already in feet, return it
            print("\(aFootValue) already in \(aUnit)")
            return aFootValue
        } else {
            //First loop over potential feet based values
            //Convert to feet unit
            var idx = 0
            for fUnit in fUnits {
                if aUnit == fUnit {
                    return aFootValue / fUnitMult[idx]
                }
                idx += 1
            }
            //Then loop over meter based values
            //Convert to feet
            idx = 0
            for mUnit in mUnits {
                if aUnit == mUnit {
                    return (aFootValue / mToFBaseValue) / mUnitMult[idx]
                }
                idx += 1
            }
            
        }
        return 0.0
    }
    
    
    
    var convertedLengthValue: Double {
        
        //First convert to same base unit of feet
        let valueInFeet = convertToFBaseUnit(from: inputLengthUnit, aValue: inputLengthValue)
        
        if outputLengthUnit == fBaseUnit {
            //great, we're already want it in feet
            return valueInFeet
        } else {
            return convertFBaseUnitToNewUnit(to:outputLengthUnit, aFootValue: valueInFeet)
        }
                
    }
    
    var body: some View {
        
        Form {
            Section {
                TextField("Input Length Value", value: $inputLengthValue, format: .number)
                    .keyboardType(.decimalPad)
                
                Picker("Length Unit from", selection: $inputLengthUnit) {
                    ForEach(lengthUnits, id: \.self) {
                        Text("\($0)")
                    }
                    
                }.pickerStyle(.segmented)
            } header: {
                Text("Length Conversion from")
            }
            
            Section {
                Text(convertedLengthValue, format: .number)
                
                Picker("Length Unit to", selection: $outputLengthUnit) {
                    ForEach(lengthUnits, id: \.self) {
                        Text("\($0)")
                    }
                }.pickerStyle(.segmented)
                
                
            } header: {
                Text("To length unit")
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
