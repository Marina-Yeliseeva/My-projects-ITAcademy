//
//  ViewController.swift
//  ImageDispatchQueue
//
//  Created by Марина Елисеева on 17.01.22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBAction func buttonTapped(_ sender: UIButton) {
        activityIndicator.startAnimating()
        let imageFileName = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("myFile")
        if FileManager.default.fileExists(atPath: imageFileName.path){
            print ("use image from cash")
            if let data = try? Data(contentsOf: imageFileName){
                let image = UIImage(data: data)
                presentImage(image)
            }
                return
        }
        let urlStr = "https://effigis.com/wp-content/uploads/2015/02/DigitalGlobe_WorldView2_50cm_8bit_Pansharpened_RGB_DRA_Rome_Italy_2009DEC10_8bits_sub_r_1.jpg"
        let url = URL(string: urlStr)!
        DispatchQueue.global(qos: .utility).async{
            
            if let data = try? Data(contentsOf: url){
                try? data.write(to: imageFileName) // сохраняем данные
                let image = UIImage(data: data)
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else{
                        print ("no self")
                        return
                    }
                    self.presentImage(image)
                }
            }
            
        }
        
    }
    func presentImage(_ image: UIImage?){
        let previewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        present(previewVC, animated: true, completion: nil)
        previewVC.imageView.image = image
        activityIndicator.stopAnimating()
        
    }
    deinit{
        print("controller deinited") // когда нажимаем кнопку back
    }
    
    
}

