//
//  ViewController.swift
//  P10
//
//  Created by Марина Елисеева on 23.10.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label1: UILabel!
    @IBAction func Switch(_ sender: UISwitch) {
        if sender.isOn{
            label1.text = "Включено"
        } else{
            label1.text = "Выключено"}
    
}
}

