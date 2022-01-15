//
//  PreviewViewController.swift
//  ImageDownload
//
//  Created by Марина Елисеева on 3.01.22.
//

import UIKit

class PreviewViewController: UIViewController {
    let urlStr = "https://images.unsplash.com/photo-1609024849543-ff59df361d08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60"

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Imageview"
        let url = URL(string: urlStr)!
        
       // Для загрузки небольшого фото
//        if let data = try?Data(contentsOf: url){
//            imageView.image = UIImage(data: data)
        
        
    // Многопоочность
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = try?Data(contentsOf: url){
                DispatchQueue.main.async {
                    [weak self] in
                    self?.imageView.image = UIImage(data: data)
                    
                }
        }
        }
    }
    
 

}
