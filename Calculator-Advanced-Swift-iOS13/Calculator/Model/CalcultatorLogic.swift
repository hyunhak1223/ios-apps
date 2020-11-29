//
//  CalcultatorLogic.swift
//  Calculator
//
//  Created by 현학 on 08/11/2020.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation



struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermidiateCalculation: (n1: Double, calcMethod: String)?

    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
   mutating func calculate(symbol: String) -> Double? {
        if let n = number {
        if symbol == "+/-" {
            return n * -1
        } else if symbol == "AC" {
           return 0
        } else if symbol == "%" {
            return n * 0.01
        } else if symbol == "+" {
            intermidiateCalculation = (n1: n, calcMethod: symbol)
        } else if symbol == "=" {
            return performTwoNumCalculation(n2: n)
        } else {
            intermidiateCalculation = (n1: n, calcMethod: symbol)
        }
        }
        
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermidiateCalculation?.n1, let operation = intermidiateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in deos not match any of the cases.")
            }
        
        }
    return nil
    }
}
