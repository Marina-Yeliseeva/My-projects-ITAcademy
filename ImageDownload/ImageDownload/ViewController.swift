//
//  ViewController.swift
//  ImageDownload
//
//  Created by Марина Елисеева on 3.01.22.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTaped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
    }
   
   


}

