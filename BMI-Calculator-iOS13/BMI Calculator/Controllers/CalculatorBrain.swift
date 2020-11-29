//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by 현학 on 21/10/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit


struct CalculatorBrain {
    
    var bmi: BMI?

    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height*height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        } else if bmiValue > 24.9 {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        }
       
        
    }
    
     func getAdvice() -> String {
        return bmi?.advice ?? "no advice"
    }
    
    func getColor() -> UIColor {
    
        return bmi?.color ?? UIColor.white
   }
    
    func getBMIValue() -> String {
       //(bmi ?? 0.0)   ?? 쓰면 bmi가 nil아니면 사용하고 nil이면 디폴트값으로 0 ,옵셔널 문제 해결방법중 하나
       let bmiTo1DeciamlPlace = String(format: "%.1f", bmi?.value ?? 0.0)
       return bmiTo1DeciamlPlace
   }
    
    
}

