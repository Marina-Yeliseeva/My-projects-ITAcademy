//
//  ViewController.swift
//  calculator code
//
//  Created by Марина Елисеева on 1.11.21.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.darkGray
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 55)
        label.textAlignment = NSTextAlignment.right
        return label
        
    }()
    let button1: UIButton = {
        let button = UIButton()
        //button.translatesAutoresizingMaskIntoConstraints = false
       // button.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        button.backgroundColor = UIColor.darkGray
        button.setTitle("1", for: .normal)
        button.layer.cornerRadius = 45
        return button
    }()
    let button2: UIButton = {
        let button = UIButton()
        //button.translatesAutoresizingMaskIntoConstraints = false
       // button.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        button.backgroundColor = UIColor.darkGray
        button.setTitle("2", for: .normal)
        button.layer.cornerRadius = 45
        return button
   
    }()
    let button3: UIButton = {
        let button = UIButton()
        //button.translatesAutoresizingMaskIntoConstraints = false
       // button.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        button.backgroundColor = UIColor.darkGray
        button.setTitle("3", for: .normal)
        button.layer.cornerRadius = 45
        return button
   
    }()
    let button4: UIButton = {
        let button = UIButton()
        //button.translatesAutoresizingMaskIntoConstraints = false
       // button.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        button.backgroundColor = UIColor.darkGray
        button.setTitle("4", for: .normal)
        button.layer.cornerRadius = 45
        return button
   
    }()

    override func viewDidLoad() {
         super.viewDidLoad()
        
        createButton1Constraints()
        createButton2Constraints()
        createButton3Constraints()
        createButton4Constraints()
        createTitleLabelConstraints()
        
        
        
        
        
        func createButton1Constraints(){
            button1.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button1)
            button1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            button1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
            //button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
            button1.widthAnchor.constraint(equalToConstant: 90).isActive = true
            button1.heightAnchor.constraint(equalToConstant: 90).isActive = true
        }
        func createButton2Constraints(){
            button2.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button2)
            button2.leftAnchor.constraint(equalTo: button1.rightAnchor, constant: 20).isActive = true
            button2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
            button2.widthAnchor.constraint(equalToConstant: 90).isActive = true
            button2.heightAnchor.constraint(equalToConstant: 90).isActive = true
            
        }
        func createButton3Constraints(){
            button3.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button3)
            button3.leftAnchor.constraint(equalTo: button2.rightAnchor, constant: 20).isActive = true
            button3.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
            button3.widthAnchor.constraint(equalToConstant: 90).isActive = true
            button3.heightAnchor.constraint(equalToConstant: 90).isActive = true
            
        }
        func createButton4Constraints(){
            button4.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button4)
            button4.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            button4.bottomAnchor.constraint(equalTo: button1.topAnchor, constant: -20).isActive = true
            button4.widthAnchor.constraint(equalToConstant: 90).isActive = true
            button4.heightAnchor.constraint(equalToConstant: 90).isActive = true
            
        }
        func createTitleLabelConstraints(){
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(titleLabel)
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant: 90).isActive = true
        }
        }
}

      /*  func createButton1Constraints() {
            NSLayoutConstraint(item: button1,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .leadingMargin,
                               multiplier: 1,
                               constant: 20).isActive = true
            NSLayoutConstraint(item: button1,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 90).isActive = true
            NSLayoutConstraint(item: button1,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .bottomMargin,
                               multiplier: 1,
                               constant: 50).isActive = true
            NSLayoutConstraint(item: button1,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 90).isActive = true
        }
        
        func createButton2Constraints() {
            NSLayoutConstraint(item: button2,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: button1,
                               attribute: .leadingMargin,
                               multiplier: 1,
                               constant: 20).isActive = true
            NSLayoutConstraint(item: button2,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 90).isActive = true
            NSLayoutConstraint(item: button2,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .bottomMargin,
                               multiplier: 1,
                               constant: 50).isActive = true
            NSLayoutConstraint(item: button2,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 90).isActive = true
            
           
}
    
       
     
let leftConstraint = NSLayoutConstraint(item: button, attribute: .leftMargin , relatedBy: .equal, toItem: view, attribute: .leftMargin, multiplier: 1, constant: 20)
let bottomConstraint = NSLayoutConstraint(item: button, attribute: .bottomMargin , relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 50)
let topConstraint = NSLayoutConstraint(item: button, attribute: .topMargin , relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 200)
let rightConstraint = NSLayoutConstraint(item: button, attribute: .rightMargin , relatedBy: .equal, toItem: view, attribute: .rightMargin, multiplier: 1, constant: 100)
NSLayoutConstraint.activate([leftConstraint, bottomConstraint])
 
}
*/
