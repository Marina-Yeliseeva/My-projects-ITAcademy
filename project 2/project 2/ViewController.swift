//
//  ViewController.swift
//  project 2
//
//  Created by Марина Елисеева on 22.10.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label: UILabel!
    var counter = 0
    
    @IBAction func Increment(_ sender: Any) {
        counter += 1
        label.text = "Touches:\(counter)"
    }
    @IBAction func Decrement(_ sender: Any) {
        counter -= 1
        label.text = "Touches:\(counter)"
    
    }
}

