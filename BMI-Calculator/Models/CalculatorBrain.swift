//
//  CalculatorBrain.swift
//  BMI-Calculator
//
//  Created by Артём Голынец on 9.02.23.
//

import UIKit

struct CalculatorBrain {
     
    private var bmi : BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight/(height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: weight/(height * height), advice: "Eat more pies", color: .blue )
        } else if bmiValue < 25 {
            bmi = BMI(value: weight/(height * height), advice: "Fir as a fiddle", color: .green)
        } else {
            bmi = BMI(value: weight/(height * height), advice: "Eat less pies", color: .red)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getBMIAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getBMIColor() -> UIColor {
        return bmi?.color ?? .green
    }
}
 
