//
//  CustomCollectionViewCell.swift
//  StudentList
//
//  Created by Марина Елисеева on 14.01.22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    let identifier = "CustomCollectionViewCell"
    let myLabel = UILabel()
    let myImageView = UIImageView()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 5, y: contentView.frame.size.height - 55, width: contentView.frame.size.width - 10, height: 50)
        myImageView.frame = CGRect(x: 5, y: 5, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - myLabel.frame.size.height - 10)
                    
        
    }
    public func configure(label:String){
        myLabel.text = label
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
    }


}
