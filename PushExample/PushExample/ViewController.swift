//
//  ViewController.swift
//  PushExample
//
//  Created by Nickolai Nikishin on 12.02.22.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    enum ViewState {
        case nonDetermined
        case authorised
        case denied
    }
    enum TextFieldState {
        case noTitle
        case noSubtitle
        case noTextFields
        case everythingIsOk
    }

   var textFieldState: TextFieldState = .noTextFields
    
    var viewState: ViewState = .nonDetermined {
        didSet {
            updateViewState()
        }
    }
    
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var subtitleStackView: UIStackView!
    @IBOutlet weak var titleStackView: UIStackView!
    @IBOutlet weak var datePickerStackView: UIStackView!
    
    @IBOutlet weak var containerViewRegular: UIView!
    @IBOutlet weak var notificationsSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subTitleTextField: UITextField!
    
    @IBOutlet weak var containerViewDisabled: UIView!
    
    // MARK: ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = NSLocalizedString("title", comment: "")
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        containerViewRegular.addGestureRecognizer(tap)
        
        titleTextField.delegate = self
        subTitleTextField.delegate = self
        
        updateViewState()
        getNotificationSettingsIfNeeded()
        addObservers()
    }
    
    // MARK: Application Lifecycle notifications
    
    func addObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationDidBecomeActive),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
    }
    
    @objc fileprivate func applicationDidBecomeActive() {
        getNotificationSettingsIfNeeded()
    }
    
    // MARK: User notifications handling
    
    func requestNotificationAuthorization() {
        let nc = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        nc.requestAuthorization(options: options) { [weak self] granted, _ in
            DispatchQueue.main.async {
                self?.viewState = granted ? .authorised : .denied
            }
        }
    }
    
    func getNotificationSettingsIfNeeded() {
        if notificationsSwitch.isOn {
            getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
            
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch settings.authorizationStatus {
                case .notDetermined:
                    self.viewState = .nonDetermined
                    self.requestNotificationAuthorization()
                case .authorized: self.viewState = .authorised
                case .denied: self.viewState = .denied
                default:
                    print("unhandled \(settings.authorizationStatus)")
                }
            }
        }
    }
    
    // MARK: Functions
    
    func updateViewState() {
        switch viewState {
        case .nonDetermined:
            containerViewRegular.isHidden = false
            containerViewDisabled.isHidden = true
        case .authorised:
            containerViewRegular.isHidden = false
            containerViewDisabled.isHidden = true
        case .denied:
            containerViewRegular.isHidden = true
            containerViewDisabled.isHidden = false
        }
        
        let isHidden = !(notificationsSwitch.isOn && viewState == .authorised)
        datePickerStackView.isHidden = isHidden
        titleStackView.isHidden = isHidden
        subtitleStackView.isHidden = isHidden
        applyButton.isHidden = isHidden
    }
    
    func createNotifications() {
    let title = titleTextField.text!
    let subtitle = subTitleTextField.text!
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
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print ("ERROR")
                return
            }
        }
        let ac = UIAlertController(title: titleTextField.text, message: subTitleTextField.text! + formattedDate(date: date) , preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
        }))
        self.present(ac, animated: true)
    }
    
    func formattedDate (date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    private func scheduleNotificationsIfNeeded() {
        guard let title = titleTextField.text, !title.isEmpty else {
            titleTextField.shake()
            return
        }
        
        guard let subtitle = subTitleTextField.text, !subtitle.isEmpty else {
            subTitleTextField.shake()
            return
        }
        
        saveNotificationSettings()
        NotificationsManager.shared.scheduleNotifications()
    }
    
    private func saveNotificationSettings() {
        NotificationsManager.shared.saveNotificationSettings(title: titleTextField.text, subtitle: subTitleTextField.text, time: datePicker.date, isEnabled: notificationsSwitch.isOn)
    }
    
    
    // MARK: IBActions
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        print("date is \(datePicker.date)")
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        print("switch is \(notificationsSwitch.isOn)")
        if notificationsSwitch.isOn == false {
            print ("OFF")
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
        updateViewState()
        getNotificationSettingsIfNeeded()
    }
    
    @IBAction func applyButtonTapped(_ sender: Any) {
        if titleTextField.text!.isEmpty == true {
            titleTextField.layer.borderColor = UIColor.red.cgColor
            titleTextField.layer.borderWidth = 2.0
        }
        else if subTitleTextField.text!.isEmpty == true {
            subTitleTextField.layer.borderColor = UIColor.red.cgColor
            subTitleTextField.layer.borderWidth = 2.0
        }
        else {
            createNotifications()
        }
        scheduleNotificationsIfNeeded()
    }
    
   

    @IBAction func settingsButtonTapped(_ sender: Any) {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)") // Prints true
            })
        }
       
    }
    
    @IBAction func textFieldTitleDidChange(_ textField: UITextField) {
        print("\(#function) \(textField.text)")
    titleTextField.layer.borderWidth = 0.0
    titleTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func textFieldSubTitleDidChange(_ textField: UITextField) {
        print("\(#function) \(textField.text)")
        subTitleTextField.layer.borderWidth = 0.0
        subTitleTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        switch textField {
        case titleTextField:
            subTitleTextField.becomeFirstResponder()
        case subTitleTextField:
            titleTextField.becomeFirstResponder()
        default:
            titleTextField.resignFirstResponder()
        }

        return true
    }
       
}
extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

