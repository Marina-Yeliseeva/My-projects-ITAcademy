//
//  SelectStudentViewController.swift
//  StudentList
//
//  Created by Марина Елисеева on 24.11.21.
//

import UIKit

class SelectStudentViewController: UIViewController {

    var arrayStudentList: [String] = []

    override func viewDidLoad() {
           super.viewDidLoad()

       }
   
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var studentName: UIButton!
    
    
    @IBAction func sortButton(_ sender: Any) {
        if tableView.isEditing{
            tableView.isEditing = false
        }
        else{
            tableView.isEditing = true
            
        }
        }
    
    @IBAction func studentButton(_ sender: Any) {
       
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.delegate2 = self
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
}

extension SelectStudentViewController: ViewControllerDelegate {
func didSelectStudent(_ student: String) {
    //studentName.setTitle(student, for: .normal)
}
}

extension SelectStudentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     arrayStudentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // arrayStudentList = Array(setStudentList).sorted()
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniqueTableViewCell", for: indexPath) as! UniqueTableViewCell
        cell.nameLabel.text = arrayStudentList[indexPath.row]
        return cell
    }

  
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if arrayStudentList.count == 0 {
            return nil
        }

        return "Students \(arrayStudentList.count) person"
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        arrayStudentList.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
     // MARK: - Delete Row

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                arrayStudentList.remove(at: indexPath.row)
                tableView.reloadData()
             
            }
    }
    
}
    // MARK: - Sort Row
//    func tableView(UITableView, targetIndexPathForMoveFromRowAt: IndexPath, toProposedIndexPath: IndexPath) -> IndexPath
//}
    // MARK: - Delete Row 2 ?????
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)-> UISwipeActionsConfiguration? {
//            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
//                self.kids.remove(at: indexPath.row)
//                completionHandler(true)
//            }
//            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
//            configuration.performsFirstActionWithFullSwipe = true
//            return configuration
//    }
// MARK: - alert
extension SelectStudentViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = arrayStudentList[indexPath.row]
        let alert = UIAlertController(title: user, message:  "Студент", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { _ in
            self.arrayStudentList.remove(at: indexPath.row)
            tableView.reloadData()
        }))
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
       // alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
     present(alert, animated: true, completion: nil)
    }
}
extension SelectStudentViewController: StudentUniqueProtocol{
    func didSelectUniqueStudent(_ name: String) {
        
    if arrayStudentList.contains(name){
            tableView.reloadData()
    }
    else {arrayStudentList.append(name)
    }
    tableView.reloadData()
    dismiss(animated: true, completion: nil)
    }
    }



