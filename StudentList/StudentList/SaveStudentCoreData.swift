//
//  SaveStudentCoreData.swift
//  StudentList
//
//  Created by Марина Елисеева on 12.12.21.
//

import CoreData
import Foundation
import UIKit

class SaveStudentCoreData {
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    // MARK: - Core Data Stack
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    // MARK: - Core Data Saving support
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveData(arrayStudentList: [String]?){
        
        guard let arrayStudentList = arrayStudentList else {
            return
        }
        for name in arrayStudentList {
            saveStudent(name: name)
            
        }
    }
    
    private func saveStudent(name: String) {
        
        let student = StudentsToSave(context: context)
        student.name = name
        var array:[String] = []
        
    }
    
    func readData() -> [String] {
        //let fetchRequest: NSFetchRequest<StudentsToSave> = StudentsToSave.fetchRequest()
        
        
        let fetchRequest = NSFetchRequest<StudentsToSave>(entityName: "StudentsToSave")
        var array:[String] = []
        if let result = try? context.fetch(fetchRequest) {
            for object in result {
                if let name = object.name {
                    array.append(name)
                }
            }
        }
        return(array)
        
    }
  
    
   
    
    
    //  MARK: -  func clearData() {
    //        let fetchRequest: NSFetchRequest<StudentsToSave> = StudentsToSave.fetchRequest()
    //
    //        if let objects = try? context.fetch(fetchRequest) {
    //            for object in objects {
    //                context.delete(object)
    //            }
    //        }
    //
    //
    //
    //    }
    
}


