import UIKit

class CalculateVC: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorModel = CalculatorModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func heighSliderChanged(_ sender: Any) {
        heightLabel.text = String(format: "%.2f", heightSlider.value) + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: Any) {
        weightLabel.text = String(format: "%.2f", weightSlider.value) + "Kg"
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorModel.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondVC
            destinationVC.bmiValue = calculatorModel.getBMIValue()
            destinationVC.advice = calculatorModel.getAdvice()
            destinationVC.color = calculatorModel.getColor()
        }
    }
}

