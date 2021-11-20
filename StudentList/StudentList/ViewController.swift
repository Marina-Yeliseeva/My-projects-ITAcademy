//
//  ViewController.swift
//  StudentList
//
//  Created by Марина Елисеева on 16.11.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var women = ["Букаренко Арина Олеговна",
                 "Ефименко Анастасия Владимировна",
                 "Пернацкая Алеся Юрьевна",
                 "Сандова Галина Александровна",
                 "Елисеева Марина Михайловна"
    ].sorted()
    
    var men = ["Aртимович Игорь Владимирович",
               "Богданович Дмитрий Александрович",
               "Гришин Павел Андреевич",
               "Куклицкий Максим Сергеевич",
               "Лапин Николай Владимирович",
               "Малишевский Никита Валерьевич",
               "Матвеенко Сергей Александрови",
               "Мостовой Алексей Алексеевич",
               "Пачковский Михаил Тадеушевич",
               "Савков Александр Геннадьевич",
               "Симонов Владислав Дмитриевич",
               "Сысов Валерий Александрович"
    ].sorted()
    
    lazy var sections = {
        return [men, women]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
        
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
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        if indexPath.section == 0{
            cell.nameLabel.text = sections[indexPath.section][indexPath.row]
        }
        if indexPath.section == 1{
            cell.nameLabel.text = sections[indexPath.section][indexPath.row]
        }
       
        return cell
    }
   
}





