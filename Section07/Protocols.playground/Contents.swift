//: Playground - noun: a place where people can play

import UIKit

protocol Vehicle: CustomStringConvertible {
    var isRunning: Bool { get set }
    var make: String { get set }
    var model: String { get set }
    mutating func start()
    mutating func turnOff()
}

extension Vehicle {
    var description: String {
        if isRunning {
            return "\(self.make) \(self.model) Car is Running"
        }
        return "\(self.make) \(self.model) Car is stopped"
    }
}

struct SportsCar: Vehicle {
    var isRunning: Bool = false
    var make: String
    var model: String
    mutating func start() {
        if isRunning {
            print("Already started")
        } else {
            isRunning = true
            print("Vroom")
        }
    }
    mutating func turnOff() {
        if isRunning {
            isRunning = false
            print("Crickets")
        } else {
            print("Already dead")
        }
    }
}

class SemiTrack: Vehicle {
    var isRunning: Bool = false
    var make: String
    var model: String
    
    init(isRunning: Bool, make: String, model: String) {
        self.isRunning = isRunning
        self.make = make
        self.model = model
    }
    
    func start() {
        if isRunning {
            print("Already started")
        } else {
            isRunning = true
            print("Rumble")
        }
    }
    func turnOff() {
        if isRunning {
            isRunning = false
            print("Buh..Buh")
        } else {
            print("Already dead")
        }
    }
    func blowHorn() {
        print("TOOOOOOT")
    }
}

var car = SportsCar(isRunning: false, make: "BMW", model: "X6")
car.start()
car.start()

var track = SemiTrack(isRunning: false, make: "MAN", model: "BIG")
track.start()
track.blowHorn()

car.turnOff()
track.turnOff()

var vehicleArray: Array<Vehicle> = [car, track]

for var car in vehicleArray {
    print(car)
    car.start()
    print(car)
}

extension Double {
    var dollarString: String {
        return String(format: "$%.02f", self)
    }
}

let stock = 100.2
stock.dollarString








