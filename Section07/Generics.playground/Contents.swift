//: Playground - noun: a place where people can play

import UIKit

func intAdder(number: Int) -> Int {
    return number + 1
}

intAdder(number: 15)


func doubleAdder(number: Double) -> Double {
    return number + 1.0
}

doubleAdder(number: 15.0)

func genericAdder<T: Strideable>(number: T) -> T {
    return number + 1
}

let result = genericAdder(number: 0)

func intMultiplier(lhs: Int, rhs: Int) -> Int {
    return lhs * rhs
}

intMultiplier(lhs: 12, rhs: 13)

protocol Numeric {
    static func *(lhs: Self, rhs: Self) -> Self
}

extension Int: Numeric {}
extension Float: Numeric {}
extension Double: Numeric {}

func genericMultiplier<T: Numeric>(lhs: T, rhs: T) -> T {
    return lhs * rhs
}

genericMultiplier(lhs: 5.2, rhs: 5)