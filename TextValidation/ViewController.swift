//
//  ViewController.swift
//  TextValidation
//
//  Created by Jordan Fraughton on 2/14/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usernameLabel: UITextField!
    @IBOutlet var passwordLabel: UITextField!

    @IBOutlet var validationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func validateUsername(_ username: String) -> Bool {
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"

        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)

        if !emailValidationPredicate.evaluate(with: username) {
            validationLabel.text = "Please enter a valid email"
            validationLabel.textColor = .red
            return false
        }
        return true
    }

    func validatePassword(_ password: String) {
        guard let password = passwordLabel.text else { return }
        guard password.count > 7 else {
            validationLabel.text = "Hey bro, you need 8 or more characters in your password."
            validationLabel.textColor = .red
            return
        }

        guard password.contains(where: {$0.isPunctuation}) else {
            validationLabel.text = "Hey bro, put a special characters in there"
            validationLabel.textColor = .red
            return
        }

        validationLabel.text = "Account created"
        validationLabel.textColor = .green
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let username = usernameLabel.text, let password = passwordLabel.text else { return
        }
        if validateUsername(username) {
            validatePassword(password)
        }
    }
}

