//
//  SaveStudent.swift
//  StudentList
//
//  Created by Марина Елисеева on 6.12.21.
//

import Foundation
class SaveStudent{
    let userDefaults = UserDefaults.standard
    
    func saveData(arrayStudentList: [String]?){
        userDefaults.set(arrayStudentList, forKey: "Student")
        
    }
    
    func readData() -> [String] {
        if let arrayStudentList = userDefaults.object(forKey: "Student") as? [String]{
            return arrayStudentList
        }
        return []
        
    }
    
}
