//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Марина Елисеева on 22.02.22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    override func prepareForReuse() {
        newsImageView.image = nil
    }
    
    override func awakeFromNib() {
           super.awakeFromNib()
       }

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
       }
}
