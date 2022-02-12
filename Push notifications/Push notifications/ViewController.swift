//
//  ViewController.swift
//  Push notifications
//
//  Created by Марина Елисеева on 10.02.22.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UIApplicationDelegate  {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    let notificationCenter = UNUserNotificationCenter.current()
   
    @IBOutlet weak var subtitleText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var switchBut: UISwitch!
    @IBAction func switchButton(_ sender: Any) {
       if ((sender as AnyObject).isOn == true) {
           appDelegate?.registerForPushNotifications()
          
           }
       else { let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let SecondVC = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        present(SecondVC, animated: true, completion: nil)
                 }
           }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchBut.isOn = false
       
    }
//    func registerForPushNotifications() {
//      notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) {
//        (permissionGranted, error) in
//          if !permissionGranted{
//              print ("Permission denied")
//          } else { return }
//          self.notificationCenter.getNotificationSettings { (settings) in
//             if settings.authorizationStatus == .authorized {
//                 self.scheduleNotifications()
//              }
//              else {return}
//          }
//
//      }
//
//    }

    func scheduleNotifications() {
    let title = titleText.text!
    let subtitle = subtitleText.text!
    let date = datePicker.date
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = subtitle
    content.sound = UNNotificationSound.default
    content.badge = 1
    let identifier = "identifier"
    let dateComp = Calendar.current.dateComponents([.hour, .minute], from: date)
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: true)
    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        appDelegate?.notificationCenter.add(request) { (error) in
            if error != nil {
                print ("ERROR")
                return
            }
        }
        let ac = UIAlertController(title: titleText.text, message: subtitleText.text! + formattedDate(date: date) , preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
        }))
        self.present(ac, animated: true)
    }
    func formattedDate (date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }


}


