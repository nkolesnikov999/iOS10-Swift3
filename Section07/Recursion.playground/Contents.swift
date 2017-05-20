//: Playground - noun: a place where people can play

import UIKit

func printNumber(max: Int) {
    for x in 0...max {
        print(x)
    }
}
//printNumber(max: 3)

func printNumberRec(max: Int) {
    if max > 0 {
        printNumber(max: max - 1)
    }
    print(max)
}
//printNumberRec(max: 3)

func factorialFirst(num: UInt) -> Double {
    var factorial: Double = 1
    for x in 1...num {
        if factorial != 0 {
            factorial *= Double(x)
        } else {
            factorial = 1
        }
    }
    
    return factorial
}

print(factorialFirst(num: 170))


func factorial(num: Int) -> Double {
    if num <= 1 { return 1 }
    return Double(num) * factorial(num: num - 1)
}

factorial(num: 170)

// https://projecteuler.net/archives
