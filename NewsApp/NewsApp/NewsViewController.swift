//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Марина Елисеева on 22.02.22.
//

import UIKit
import Kingfisher


class NewsViewController: UIViewController {
    var articles:[Article] = []
    @IBOutlet weak var newsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.dataSource = self
        NetworkManager.shared.getArticles(from: Date()) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self.articles = articles
                    self.newsTableView.reloadData()
                case .failure(let error):
                    self.showError(error)
                }
            }
        }
    }
    
    private func showError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else { return UITableViewCell() }
        let article = articles[indexPath.row]
        cell.newsTitleLabel.text = article.title
        cell.newsDescriptionLabel.text = article.description
        //        if let urlToImage = article.urlToImage,
        //            let url = URL(string: urlToImage) {
        //            DispatchQueue.global(qos: .background).async { [weak cell] in
        //                if let data = try? Data(contentsOf: url) {
        //                    let image = UIImage(data: data)
        //                    DispatchQueue.main.async {
        //                        cell?.newsImageView.image = image
        //                    }
        //                }
        //            }
        //        }
        let placeholderImage = UIImage(named: "placeholder")
        let processor = DownsamplingImageProcessor(size: cell.newsImageView.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        cell.newsImageView.kf.indicatorType = .activity
        if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
            cell.newsImageView.kf.setImage(
                with: url,
                placeholder: placeholderImage,
                options: [
                    .processor(processor),
                    .loadDiskFileSynchronously,
                    .cacheOriginalImage,
                    .transition(.fade(0.25)),
                ],
                progressBlock: { receivedSize, totalSize in
                    // Progress updated
                },
                completionHandler: { result in
                    // Done
                }

            )
        } else {
            cell.newsImageView.image = placeholderImage
        }
        return cell
    }
}


