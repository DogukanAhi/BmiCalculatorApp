import UIKit

struct CalculatorModel {
    
    var bmi : BmiModel?
    
    func getBMIValue() -> String {
        let bmiDecimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiDecimal
    }
    
    mutating func calculateBMI(height: Float,weight: Float) {
        let bmiValue = weight / (height*height)
        
        if bmiValue < 18.5 {
            bmi = BmiModel(value: bmiValue, advice: "Eat more!!", color: UIColor.blue)
        }
        else if bmiValue < 24.9 {
            bmi = BmiModel(value: bmiValue, advice: "You're so fit! ", color: UIColor.green)
        } else {
            bmi = BmiModel(value: bmiValue, advice: "You need to lose weight", color: UIColor.red)
        }
    }
    
    func getColor () -> UIColor {
        return bmi?.color ?? UIColor.gray
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
}
