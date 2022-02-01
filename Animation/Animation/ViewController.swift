//
//  ViewController.swift
//  Animation
//
//  Created by Марина Елисеева on 30.01.22.
//

import UIKit
import Lottie

class ViewController: UIViewController {
   
    @IBOutlet weak var lottieView: AnimationView!
    @IBOutlet weak var progressView: UIProgressView!
    
    let label: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.text = "%"
        label.font = .systemFont(ofSize: 38, weight: .bold)
    label.sizeToFit()
    label.center = CGPoint(x: 200, y: 650)
    return label
    }()
    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    let subview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    let button = UIButton()
   
    override func viewDidLoad() {
        super.viewDidLoad()
   

        
    subview.center = view.center
    subview.backgroundColor = .blue
    
    view.addSubview(subview)
    view.addSubview(label)
        
        // MARK: - progress bar
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 3 * 2.3), radius: 50, startAngle: -.pi / 2, endAngle: 2 * .pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.gray.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 8
        trackLayer.lineCap = .round
    

        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 8
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = .round
        
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        lottieView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (lottieTap)))
        
        
        let button = UIButton(frame: CGRect(x: (view.frame.size.width - 100)/2, y: view.frame.size.height - 90, width: 100, height: 50))
        button.setTitle("ANIMATE", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector (buttonTapped), for: .touchUpInside)
        
        view.addSubview(button)

    }
   
    
    @objc func handleTap(){
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0.25
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "animation")
    }
    @objc func lottieTap(){
        let animation = Animation.named("90808-overtime")
                lottieView.animation = animation
                lottieView.play { _ in
                    
                }
    }
   

    @objc func buttonTapped() {
        UIView.animate(withDuration: 1, delay: 0) {
            self.subview.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        }
        
    
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseOut) {
            self.subview.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        }
           
}
    @objc func buttonTapped2() {
        UIView.animate(withDuration: 1, delay: 0) {
            self.subview.frame = CGRect(x: self.view.frame.size.width - 200, y: 0, width: 200, height: 200)
            UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseOut) {
                self.subview.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        } completion: { _ in
//            self.button.addTarget(self, action: #selector (self.buttonTapped), for: .touchUpInside)
//            self.buttonTapped()
        }

}
}
}
