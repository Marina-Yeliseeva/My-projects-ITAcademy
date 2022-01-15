//
//  CustomCollectionViewController.swift
//  StudentList
//
//  Created by Марина Елисеева on 14.01.22.
//

import UIKit

class CustomCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    private var collectionView: UICollectionView?
    private var dataSource: [[StudentObject]] {
        [men]
    }
    var men: [StudentObject] = DataSource.menArray
    override func viewDidLoad() {
        super.viewDidLoad()
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
        let flowLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 30
            layout.minimumLineSpacing = 30
            layout.sectionInset = UIEdgeInsets(top: 5, left:5, bottom: 5, right: 5)
            layout.itemSize = CGSize(width: (view.frame.size.width * 0.48) - 4,
                                           height: (view.frame.size.height * 0.275) - 4)
                    //collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            return layout
        }()
       
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        let student = dataSource[indexPath.section][indexPath.row]
        cell.myLabel.text = student.name
        DataSource.fetchGithubUserAvatar(student.login) { [weak cell] result in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        cell?.myImageView.image = image
                    }
                case .failure(let error):
                    print(error)
                }
            }
        return cell
    }
   
    
   }





