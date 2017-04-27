//: Playground - noun: a place where people can play

import UIKit

var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen"
namesOfIntegers[44] = "forty four"

namesOfIntegers

//Clear out the dictionary
namesOfIntegers = [:]

namesOfIntegers

//Dictionary literals explicitly declared
var airports: [String: String] = ["YYZ": "Toronto Pearson", "LAX": "Los Angeles International"]

print("The airports dictionary contains: \(airports.count) items")

if airports.isEmpty {
    print("There are no airports due to the ape invasions")
}

//Add new item
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
airports["DEV"] = "Devslopes International"

//Remove an item
airports["DEV"] = nil

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// ====================

var strArray = [String]()
var dblArray: [Double] = [2.3, 4.5, 3.6, 7.8]
var difArray: [Any] = [5, 3.6, "one"]

difArray.append("Box")
difArray.remove(at: 0)
dblArray.removeAll()
difArray.reverse()

var oddNumbers: [Int] = []
for i in 0...100 {
  if i%2 != 0 {
    oddNumbers.append(i)
  }
}
print(oddNumbers)

var sums = [Int]()
for val in oddNumbers {
  sums.append(val + 5)
}

var index = 0
while index < sums.count {
  print("The sum is: \(sums[index])")
  index += 1
}






