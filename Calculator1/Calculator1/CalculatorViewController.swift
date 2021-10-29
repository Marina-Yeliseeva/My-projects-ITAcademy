//
//  CalculatorViewController.swift
//  Calculator1
//
//  Created by Марина Елисеева on 28.10.21.
//

import UIKit

class CalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    
    @IBOutlet weak var displayResultLabel: UILabel!
    @IBAction func numberPressed(_ sender: UIButton) {
        displayResultLabel.text = "0"
        /*let tag = sender.tag + 2
                
                if displayResultLabel.text == "0" {
                    displayResultLabel.text = "\(tag)"
                }*/
        //let number = sender.currentTitle!
        //displayResultLabel.text = displayResultLabel.text! + number
        // let number = numberPressed(CalculatorViewController)
        //displayResultLabel.text = number.text
        
    }
    
    
}
