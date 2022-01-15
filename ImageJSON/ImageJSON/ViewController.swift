//
//  ViewController.swift
//  ImageJSON
//
//  Created by Марина Елисеева on 13.01.22.
//

import UIKit
struct Hero:Decodable {
    let localized_name: String
    let img: String
    
}

class ViewController: UIViewController,UICollectionViewDataSource {

    var heroes = [Hero]()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
       let urlString = "https://api.opendota.com/api/heroStats"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print (error)
                return
            }
            guard let data = data else {return}
            do {
                self.heroes = try JSONDecoder().decode([Hero].self, from: data)
                
            }
            catch {
                print ("Parse error")
                
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }.resume()
        
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        cell.nameLabel.text = heroes[indexPath.row].localized_name.capitalized
        let defaultLink = "https://api.opendota.com"
        let completeLink = defaultLink + heroes[indexPath.row].img
        cell.imageView.downloadedFrom(link:completeLink)
        cell.imageView.layer.cornerRadius = cell.imageView.frame.height / 2
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }

}
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill){
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURlResponse = response as? HTTPURLResponse, httpURlResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {return}
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit){
        guard let url = URL(string:link) else {return}
        downloadedFrom(url: url, contentMode: contentMode)
    
}
}

