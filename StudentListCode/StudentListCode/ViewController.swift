//
//  ViewController.swift
//  StudentListCode
//
//  Created by Марина Елисеева on 18.11.21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var myTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTableView)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTableView.frame = view.bounds
    }
    let identifier = "Mycell"
    var array = ["1","2","3","4"]
    
    
    
//   MARK: - способ 2
//    createTable()
//    }
//    func createTable(){
//
//        self.myTableView = UITableView(frame: view.bounds, style: UITableView.Style.plain)
//            myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
//        self.myTableView.delegate = self
//        self.myTableView.dataSource = self
//
//        myTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//
//        view.addSubview(myTableView)
//        }
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let number = array [indexPath.row]
        cell.textLabel?.text = number
        cell.accessoryType = .detailButton
        return cell
           }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               return 70.0
           }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print ("My name is")
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
        print ("cell tapped")
        
    }
    
    
    }
    
    




