//
//  ViewController.swift
//  game lesson1
//
//  Created by Марина Елисеева on 26.10.21.
//

import UIKit

class ViewController: UIViewController {
    var touches = 0{
        didSet{
            touchLabel.text = "Touches: \(touches)"
    }
    }
    
    func flipButton(emoji:String,button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.systemRed
        } else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = UIColor.white
            
        }
    }
    let emojiCollection = ["👻","🎃","👻","🎃"]
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
        flipButton(emoji:emojiCollection[buttonIndex], button:sender)
        }
    }
    
}

