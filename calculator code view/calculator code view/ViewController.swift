//
//  ViewController.swift
//  calculator code view
//
//  Created by Марина Елисеева on 2.11.21.
//

import UIKit

class ViewController: UIViewController {
let view1: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.darkGray
    view.layer.cornerRadius = 45
  //  view.setTitle(1, for: .normal) можно ли задать название view
    return view
} ()

    let view2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.darkGray
        view.layer.cornerRadius = 45
        return view
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(view1)
        view.addSubview(view2)
        createView1Constraint()
        createView2Constraint()
        
        func createView1Constraint(){
            view1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            view1.widthAnchor.constraint(equalToConstant: 90).isActive = true
            view1.heightAnchor.constraint(equalToConstant: 90).isActive = true
            view1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-50).isActive = true
            }
        func createView2Constraint(){
            view2.leftAnchor.constraint(equalTo: view1.rightAnchor, constant: 20).isActive = true
            view2.widthAnchor.constraint(equalToConstant: 90).isActive = true
            view2.heightAnchor.constraint(equalToConstant: 90).isActive = true
            view2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-50).isActive = true
            }
        
    }
 
   // stack.view?.addSubview(view1,view2)

}

