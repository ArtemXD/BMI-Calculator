//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Артём Голынец on 6.02.23.
//

import UIKit

class CalculateVC: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightChanhe(_ sender: UISlider) {
        heightLabel.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func weightChange(_ sender: UISlider) {
        weightLabel.text = "\(Int( sender.value))kg"
    }
    
    @IBAction func clickCalculatr(_ sender: UIButton) {
        calculatorBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        self.performSegue(withIdentifier:  "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultVC
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.view.backgroundColor = calculatorBrain.getBMIColor()
            destinationVC.adviceLabel.text = calculatorBrain.getBMIAdvice()
        }
    }
}

