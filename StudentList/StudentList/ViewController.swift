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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return men.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Мужчины \(men.count)"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        cell.nameLabel.text = men[indexPath.row]
//        if indexPath.section == 0{
//       cell.nameLabel.text = men[indexPath.row]
//        }
//        else {
//            cell.nameLabel.text = men[indexPath.row].append.women[indexPath.row]       }
        return cell
    }
   
}





