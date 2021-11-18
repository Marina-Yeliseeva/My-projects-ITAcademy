//
//  UnaryOperatorButton.swift
//  Calculator
//
//  Created by Марина Елисеева on 16.11.21.
//

import UIKit

class UnaryOperatorButton: RoundedButton {

    
        let defaultColor = UIColor.systemGray
        let selectedColor = UIColor.white
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? selectedColor : defaultColor
        }

    }
}

