//
//  ViewController.swift
//  StudentList
//
//  Created by Марина Елисеева on 16.11.21.
//

import UIKit

class ViewController: UIViewController {
  


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var women = ["Букаренко Арина Олеговна",
                 "Ефименко Анастасия Владимировна",
                 "Пернацкая Алеся Юрьевна",
                 "Сандова Галина Александровна",
                 "Елисеева Марина Михайловна"
    ].sorted()
    
    var men =  ["Богданович Дмитрий Александрович",
               "Гришин Павел Андреевич",
               "Куклицкий Максим Сергеевич",
               "Лапин Николай Владимирович",
               "Малишевский Никита Валерьевич",
               "Матвеенко Сергей Александрови",
               "Мостовой Алексей Алексеевич",
               "Пачковский Михаил Тадеушевич",
               "Савков Александр Геннадьевич",
               "Симонов Владислав Дмитриевич",
               "Сысов Валерий Александрович",
               "Артимович Игорь Владимирович"
    ].sorted()
    
    var filteredMen:[String]!
    var filteredWomen:[String]!
    
//    lazy var sections = {
//        return [men, women]
//    }()
   
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        filteredMen = men
        filteredWomen = women
        
        
    }
    
}

extension ViewController: UITableViewDataSource,UISearchBarDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0: return filteredMen.count
        case 1: return filteredWomen.count
        default: break
        }
        
        return filteredMen.count + filteredWomen.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0: return "Мужчины \(men.count) человек"
        case 1: return "Женщины \(women.count) человек"
        default: break
        }
        return "\(section)"
        }
   
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        if indexPath.section == 0{
            cell.nameLabel.text = filteredMen[indexPath.row]
        }
        if indexPath.section == 1{
            cell.nameLabel.text = filteredWomen[indexPath.row]
        }
       
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMen = []
        filteredWomen = []
        if searchText == ""{
            filteredMen = men
            filteredWomen = women
        }
        for word in men{
            if word.lowercased().contains(searchText.lowercased()){
                filteredMen.append(word)
        }
        }
        for word in women{
            if word.lowercased().contains(searchText.lowercased()){
                filteredWomen.append(word)
        }
        }
      self.tableView.reloadData()
    }
 
}






