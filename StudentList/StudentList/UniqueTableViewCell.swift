//
//  UniqueTableViewCell.swift
//  StudentList
//
//  Created by Марина Елисеева on 30.11.21.
//

import UIKit

class UniqueTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
