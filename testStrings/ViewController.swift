//
//  ViewController.swift
//  testStrings
//
//  Created by d.bondarenko on 03.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension ViewController {
    @IBAction func actionButton(_ sender: Any) {
        if isValidNumber(phoneNumber.text ?? "") && isValidEmail(email.text ?? "") && isValidName(firstName.text ?? "") && isValidName(lastName.text ?? "") {
            getAlert(text: "Valid input", message: "true")
        }
    }

    func getAlert(text: String, message: String) {
        let alert = UIAlertController(title: text, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default) { _ in
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: email) {
            return true
        } else {
            getAlert(text: "invalid Input", message: "error in Email")
            return false
        }
    }

    func isValidNumber(_ number: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,11}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if phoneTest.evaluate(with: number) {
            return true
        } else {
            getAlert(text: "Invalid Input", message: "error in Number")
            return false
        }
    }

    func isValidName(_ name: String) -> Bool {
        let userName = name.trimmingCharacters(in: CharacterSet.whitespaces)
        let regex =  "^[a-zA-Z]{4,}(?: [$a-zA-Z]+)?(?: [a-zA-Z]+)?"
        let predicate = NSPredicate(format:"SELF MATCHES %@",regex)
        if predicate.evaluate(with: userName) {
            return true
        } else {
            getAlert(text: "invalid Input", message: "error in First or last name")
            return false
        }
    }
}
