//
//  ManualLayoutCalculatorViewController.swift
//  Calculator
//
//  Created by Nickolai Nikishin on 13.11.21.
//

import UIKit

class ManualLayoutCalculatorViewController: AbstractCalculatorViewController {
    
    override var displayLabel: UILabel! {
        set {
            
        }
        
        get {
            return manualDisplayLabel
        }
    }
    
    let manualDisplayLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        createUI()
    }
    
    func createUI() {
        addButtons()
    }
    
    func addButtons() {
        let equalButton = BinaryOperatorButton(type: .custom)
        equalButton.addTarget(self, action: #selector(equalOperatorButtonTapped), for: .touchUpInside)
        equalButton.setTitle("=", for: .normal)
        equalButton.setTitleColor(equalButton.selectedColor, for: .normal)
        equalButton.setTitleColor(equalButton.defaultColor, for: .selected)
        equalButton.backgroundColor = equalButton.defaultColor
        equalButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        
        equalButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(equalButton)
        
        NSLayoutConstraint.activate([
            equalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            equalButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            equalButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25, constant: -25),
            equalButton.heightAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        
        let decimalSeparatorButton = DigitButton(type: .custom)
        decimalSeparatorButton.addTarget(self, action: #selector(decimalSeparatorButtonTapped), for: .touchUpInside)
        decimalSeparatorButton.setTitle(CalculatorLogic.formatter.decimalSeparator, for: .normal)
        decimalSeparatorButton.setTitleColor(DigitButton.defaultTextColor, for: .normal)
        decimalSeparatorButton.backgroundColor = DigitButton.defaultBackgroundColor
        decimalSeparatorButton.titleLabel?.font = DigitButton.font
        decimalSeparatorButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(decimalSeparatorButton)
        
        NSLayoutConstraint.activate([
            decimalSeparatorButton.trailingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: -20),
            decimalSeparatorButton.bottomAnchor.constraint(equalTo: equalButton.bottomAnchor),
            decimalSeparatorButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            decimalSeparatorButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit0Button = DigitButton.generate(title: "0")
        digit0Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit0Button)
        
        NSLayoutConstraint.activate([
            digit0Button.trailingAnchor.constraint(equalTo: decimalSeparatorButton.leadingAnchor, constant: -20),
            digit0Button.bottomAnchor.constraint(equalTo: equalButton.bottomAnchor),
            digit0Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            digit0Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digitPlusButton = BinaryOperatorButton(type: .custom)
        digitPlusButton.addTarget(self, action: #selector(equalOperatorButtonTapped), for: .touchUpInside)
        digitPlusButton.setTitle("+", for: .normal)
        digitPlusButton.setTitleColor(digitPlusButton.selectedColor, for: .normal)
        digitPlusButton.setTitleColor(digitPlusButton.defaultColor, for: .selected)
        digitPlusButton.backgroundColor = digitPlusButton.defaultColor
        digitPlusButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        
        digitPlusButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(digitPlusButton)
        
        NSLayoutConstraint.activate([
            digitPlusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            digitPlusButton.bottomAnchor.constraint(equalTo: equalButton.topAnchor, constant: -20),
            digitPlusButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digitPlusButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        
        let digitMinusButton = BinaryOperatorButton(type: .custom)
        digitMinusButton.addTarget(self, action: #selector(equalOperatorButtonTapped), for: .touchUpInside)
        digitMinusButton.setTitle("-", for: .normal)
        digitMinusButton.setTitleColor(digitMinusButton.selectedColor, for: .normal)
        digitMinusButton.setTitleColor(digitMinusButton.defaultColor, for: .selected)
        digitMinusButton.backgroundColor = digitMinusButton.defaultColor
        digitMinusButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)

        digitMinusButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(digitMinusButton)
        
        NSLayoutConstraint.activate([
            digitMinusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            digitMinusButton.bottomAnchor.constraint(equalTo: digitPlusButton.topAnchor, constant: -20),
            digitMinusButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digitMinusButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        
        let digitMultyButton = BinaryOperatorButton(type: .custom)
        digitMultyButton.addTarget(self, action: #selector(equalOperatorButtonTapped), for: .touchUpInside)
        digitMultyButton.setTitle("×", for: .normal)
        digitMultyButton.setTitleColor(digitMultyButton.selectedColor, for: .normal)
        digitMultyButton.setTitleColor(digitMultyButton.defaultColor, for: .selected)
        digitMultyButton.backgroundColor = digitMultyButton.defaultColor
        digitMultyButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)

        digitMultyButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(digitMultyButton)
        
        NSLayoutConstraint.activate([
            digitMultyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            digitMultyButton.bottomAnchor.constraint(equalTo: digitMinusButton.topAnchor, constant: -20),
            digitMultyButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digitMultyButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        
        let digitDivideButton = BinaryOperatorButton(type: .custom)
        digitDivideButton.addTarget(self, action: #selector(equalOperatorButtonTapped), for: .touchUpInside)
        digitDivideButton.setTitle("÷", for: .normal)
        digitDivideButton.setTitleColor(digitDivideButton.selectedColor, for: .normal)
        digitDivideButton.setTitleColor(digitDivideButton.defaultColor, for: .selected)
        digitDivideButton.backgroundColor = digitDivideButton.defaultColor
        digitDivideButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)

        digitDivideButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(digitDivideButton)
        
        
        NSLayoutConstraint.activate([
            digitDivideButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            digitDivideButton.bottomAnchor.constraint(equalTo: digitMultyButton.topAnchor, constant: -20),
            digitDivideButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digitDivideButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
       
        
        let digit3Button = DigitButton.generate(title: "3")
        digit3Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit3Button)
        
        NSLayoutConstraint.activate([
            digit3Button.trailingAnchor.constraint(equalTo: digitPlusButton.leadingAnchor, constant: -20),
            digit3Button.bottomAnchor.constraint(equalTo: decimalSeparatorButton.topAnchor, constant: -20),
            digit3Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit3Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        let digit2Button = DigitButton.generate(title: "2")
        digit2Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit2Button)
        
        NSLayoutConstraint.activate([
            digit2Button.trailingAnchor.constraint(equalTo: digit3Button.leadingAnchor, constant: -20),
            digit2Button.bottomAnchor.constraint(equalTo: digit0Button.topAnchor, constant: -20),
            digit2Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit2Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        let digit1Button = DigitButton.generate(title: "1")
        digit1Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit1Button)
        
        NSLayoutConstraint.activate([
            digit1Button.trailingAnchor.constraint(equalTo: digit2Button.leadingAnchor, constant: -20),
            digit1Button.bottomAnchor.constraint(equalTo: digit0Button.topAnchor, constant: -20),
            digit1Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit1Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        let digit6Button = DigitButton.generate(title: "6")
        digit6Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit6Button)
        
        NSLayoutConstraint.activate([
            digit6Button.trailingAnchor.constraint(equalTo: digitMinusButton.leadingAnchor, constant: -20),
            digit6Button.bottomAnchor.constraint(equalTo: digit3Button.topAnchor, constant: -20),
            digit6Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit6Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        let digit5Button = DigitButton.generate(title: "5")
        digit5Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit5Button)
        
        NSLayoutConstraint.activate([
            digit5Button.trailingAnchor.constraint(equalTo: digit6Button.leadingAnchor, constant: -20),
            digit5Button.bottomAnchor.constraint(equalTo: digit2Button.topAnchor, constant: -20),
            digit5Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit5Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        let digit4Button = DigitButton.generate(title: "4")
        digit4Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit4Button)
        
        NSLayoutConstraint.activate([
            digit4Button.trailingAnchor.constraint(equalTo: digit5Button.leadingAnchor, constant: -20),
            digit4Button.bottomAnchor.constraint(equalTo: digit1Button.topAnchor, constant: -20),
            digit4Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit4Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        
        let digit9Button = DigitButton.generate(title: "9")
        digit9Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit9Button)
        
        NSLayoutConstraint.activate([
            digit9Button.trailingAnchor.constraint(equalTo: digitMultyButton.leadingAnchor, constant: -20),
            digit9Button.bottomAnchor.constraint(equalTo: digit6Button.topAnchor, constant: -20),
            digit9Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit9Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        let digit8Button = DigitButton.generate(title: "8")
        digit8Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit8Button)
        
        NSLayoutConstraint.activate([
            digit8Button.trailingAnchor.constraint(equalTo: digit9Button.leadingAnchor, constant: -20),
            digit8Button.bottomAnchor.constraint(equalTo: digit5Button.topAnchor, constant: -20),
            digit8Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit8Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        let digit7Button = DigitButton.generate(title: "7")
        digit7Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit7Button)
        
        NSLayoutConstraint.activate([
            digit7Button.trailingAnchor.constraint(equalTo: digit8Button.leadingAnchor, constant: -20),
            digit7Button.bottomAnchor.constraint(equalTo: digit4Button.topAnchor, constant: -20),
            digit7Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit7Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        
        
        let digitPercentButton = BinaryOperatorButton(type: .custom)
        digitPercentButton.addTarget(self, action: #selector(equalOperatorButtonTapped), for: .touchUpInside)
        digitPercentButton.setTitle("%", for: .normal)
        digitPercentButton.backgroundColor = .lightGray
        digitPercentButton.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        digitPercentButton.setTitleColor(.black, for: .normal)
        digitPercentButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(digitPercentButton)
        
        
        NSLayoutConstraint.activate([
            digitPercentButton.trailingAnchor.constraint(equalTo: digitDivideButton.leadingAnchor, constant: -20),
            digitPercentButton.bottomAnchor.constraint(equalTo: digit9Button.topAnchor, constant: -20),
            digitPercentButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digitPercentButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        
        let digitSignButton = BinaryOperatorButton(type: .custom)
        digitSignButton.addTarget(self, action: #selector(equalOperatorButtonTapped), for: .touchUpInside)
        digitSignButton.setTitle("+/-", for: .normal)
        digitSignButton.backgroundColor = .lightGray
        digitSignButton.setTitleColor(.black, for: .normal)
        digitSignButton.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .semibold)

        digitSignButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(digitSignButton)
        
        
        NSLayoutConstraint.activate([
            digitSignButton.trailingAnchor.constraint(equalTo: digitPercentButton.leadingAnchor, constant: -20),
            digitSignButton.bottomAnchor.constraint(equalTo: digit8Button.topAnchor, constant: -20),
            digitSignButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digitSignButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        
        let digitClearButton = BinaryOperatorButton(type: .custom)
        digitClearButton.addTarget(self, action: #selector(equalOperatorButtonTapped), for: .touchUpInside)
        digitClearButton.setTitle("AC", for: .normal)
        digitClearButton.backgroundColor = .lightGray
        digitClearButton.setTitleColor(.black, for: .normal)
        digitClearButton.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .semibold)

        digitClearButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(digitClearButton)
        
        
        NSLayoutConstraint.activate([
            digitClearButton.trailingAnchor.constraint(equalTo: digitSignButton.leadingAnchor, constant: -20),
            digitClearButton.bottomAnchor.constraint(equalTo: digit7Button.topAnchor, constant: -20),
            digitClearButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digitClearButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        manualDisplayLabel.font = UIFont.systemFont(ofSize: 70)
        manualDisplayLabel.textAlignment = .right
        manualDisplayLabel.textColor = .white
        manualDisplayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(manualDisplayLabel)
        
        NSLayoutConstraint.activate([
            manualDisplayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            manualDisplayLabel.bottomAnchor.constraint(equalTo: digitDivideButton.topAnchor, constant: -20),
            manualDisplayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
}
