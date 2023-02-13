//
//  Day6Checkpoint.swift
//  
//
//  Created by Genevieve Krzeminski on 1/26/23.
//

import Foundation

import Cocoa

//fizz buzz

for i in 1...100 {
    var fizz = false
    var buzz = false
    
    if i.isMultiple(of: 3) { //if i % 3 == 0 {
        fizz = true
    }
    if i.isMultiple(of: 5) { //if i % 5 == 0 {
        buzz = true
    }
    if fizz && buzz {
        print ("FizzBuzz")
    }
    else {
        fizz ? print("Fizz") : buzz ? print("Buzz") : print(i)
    }
}
