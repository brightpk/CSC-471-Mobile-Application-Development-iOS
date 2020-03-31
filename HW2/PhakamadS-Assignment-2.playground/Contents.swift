import UIKit

/* 2) Write a function in Swift that performs the following tasks
 *
 * a) Function rank performs a binary search of a key in a sorted integer array.
 * If the key appears in the array, the rank function returns the index of key in the array.
 * If the key does not appear in the array, the rank function returns -1.
 */

func rank(sortedArray arr : [Int], startIndex left : Int, endIndex right : Int, find key : Int) -> Int {
    if right >= left {
        let mid = left + (right - left) / 2
        
        if arr[mid] == key {
            return mid
        }
        if arr[mid] > key {
            return rank(sortedArray: arr, startIndex: left, endIndex: mid - 1, find: key)
        }
        return rank(sortedArray: arr, startIndex: mid + 1, endIndex: right, find: key)
    }

    return -1
}

/* b) Createa sorted integer array to test the rank function.
 * Make several calls on the rank function.
 * Verify that the results are correct.
 */

print("2) A binary search of a key in a sorted integer array")
print()
var lst1 = [1, 2, 3, 4, 5]
let resultSeach3 = rank(sortedArray : lst1, startIndex : 0, endIndex : lst1.count - 1, find : 3)
let resultSearch7 = rank(sortedArray : lst1, startIndex : 0, endIndex : lst1.count - 1, find : 7)
var lst2 = [2, 11, 13, 34, 57, 80]
let resultSearch34 = rank(sortedArray : lst2, startIndex : 0, endIndex : lst2.count - 1, find : 34)
let resultSearch60 = rank(sortedArray : lst2, startIndex : 0, endIndex : lst2.count - 1, find : 60)
var lst3 = [5, 10, 15, 20, 25, 30, 35, 40]
let resultSearch40 = rank(sortedArray : lst3, startIndex : 0, endIndex : lst3.count - 1, find : 40)
let resultSearch45 = rank(sortedArray : lst3, startIndex : 0, endIndex : lst3.count - 1, find : 45)

print("List 1: \(lst1)")
print("Found number 3      --> index \(resultSeach3)")
print("Not found number 7  --> \(resultSearch7)")
print()
print("List 2: \(lst2)")
print("Found number 34     --> index \(resultSearch34)")
print("Not found number 60 --> \(resultSearch60)")
print()
print("List 3: \(lst3)")
print("Found number 40     --> index \(resultSearch40)")
print("Not found number 45 --> \(resultSearch45)")
print("---------------------------------------------------\n")


/* 3) Write a more complete version of the Fraction class we have discussed in the lecture.
 * Start from scratch and type in all the code yourself. (You will learn more from the mistakes you make along the way.)
 *
 * a) Add methods to the Fraction class, version 4 (Program 6.6 in the playground Swift Part 01 – The Basics)
 * to compute the subtraction, multiplication, and division of two fractions in a similar way to the add method
 * (for the formulae to compute the subtraction, multiplication, and division of two fractions,
 * see http://en.wikipedia.org/wiki/Rational_number).
 * Each method should take another fraction object as the parameter and return the result as a new Fraction object.
 * The resulting fraction should not have common factors in its numerator and denominator.
 */

class Fraction {
    var numerator: Int = 0
    var denominator: Int = 1
    
    init(_ numerator: Int, over denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    init() {}
    
    func setTo(numerator: Int, over denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    func print() {
        Swift.print("\(numerator)/\(denominator)")
    }
    
    func toDouble() -> Double {
        return Double(numerator) / Double(denominator);
    }
    
    func add(_ f: Fraction) -> Fraction {
        let result: Fraction = Fraction()
        result.numerator = numerator * f.denominator + denominator * f.numerator
        result.denominator = denominator * f.denominator
        result.reduce()
        return result
    }
    
    /* subtraction */
    func minus(_ f: Fraction) -> Fraction {
        let result: Fraction = Fraction()
        result.numerator = numerator * f.denominator - denominator * f.numerator
        result.denominator = denominator * f.denominator
        result.reduce()
        return result
    }
    
    /* multiplication */
    func multiply(_ f: Fraction) -> Fraction {
        let result: Fraction = Fraction()
        result.numerator = numerator * f.numerator
        result.denominator = denominator * f.denominator
        result.reduce()
        return result
    }
    
    /* division */
    func divide(_ f: Fraction) -> Fraction {
        let result: Fraction = Fraction()
        result.numerator = numerator * f.denominator
        result.denominator = denominator * f.numerator
        result.reduce()
        return result
    }
    
    func reduce() {
        var u = abs(numerator)
        var v = denominator
        var r: Int
        while (v != 0) {
            r = u % v; u = v; v = r
        }
        numerator /= u
        denominator /= u
    }
    
}

/* b) Write test code to test each of the new methods of the class with different input values. Verify that your results are correct. */
print("3) Fraction")
var f1 = Fraction(1, over: 2)
var f2 = Fraction(1, over: 4)
var resultAdd = f1.add(f2)
print()
print("Addition: ")
print("\(f1.numerator)/\(f1.denominator) + \(f2.numerator)/\(f2.denominator) = \(resultAdd.numerator)/\(resultAdd.denominator)")

var f3 = Fraction(5, over: 12)
var f4 = Fraction(2, over: 8)
var resultMinus = f3.minus(f4)
print()
print("Subtraction: ")
print("\(f3.numerator)/\(f3.denominator) - \(f4.numerator)/\(f4.denominator) = \(resultMinus.numerator)/\(resultMinus.denominator)")

var f5 = Fraction(7, over: 5)
var f6 = Fraction(5, over: 8)
var resultTimes = f5.multiply(f6)
print()
print("Multiplication: ")
print("\(f5.numerator)/\(f5.denominator) * \(f6.numerator)/\(f6.denominator) = \(resultTimes.numerator)/\(resultTimes.denominator)")

var f7 = Fraction(2, over: 10)
var f8 = Fraction(4, over: 6)
var resultDivide = f7.divide(f8)
print()
print("Division: ")
print("\(f7.numerator)/\(f7.denominator) ÷ \(f8.numerator)/\(f8.denominator) = \(resultDivide.numerator)/\(resultDivide.denominator)")
