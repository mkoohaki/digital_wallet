//
//  RetrieveUsernameViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-11.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class RetrieveUsernameViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var reminderNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var retrievePassButtonOutlet: UIButton!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var submitButtonOutlet: UIButton!
    
    var lightPurpol = UIColor(red: 0.8399218917, green: 0.6679782271, blue: 0.9903358817, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.masksToBounds = true
        mainLabel.layer.cornerRadius = 20.0
        
        submitButtonOutlet.layer.masksToBounds = true
        submitButtonOutlet.layer.cornerRadius = 10.0
        
        retrievePassButtonOutlet.layer.masksToBounds = true
        retrievePassButtonOutlet.layer.cornerRadius = 5.0
        
        loginButtonOutlet.layer.masksToBounds = true
        loginButtonOutlet.layer.cornerRadius = 5.0

        usernameText.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: lightPurpol])
        
        passwordText.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: lightPurpol])
        
        reminderNameText.attributedPlaceholder = NSAttributedString(string: "Reminder Name", attributes: [NSAttributedString.Key.foregroundColor: lightPurpol])
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
       
        let reminderName = reminderNameText.text
        let password = passwordText.text
        var usernameIsExist = false
        
        let errorDetail:ErrorRetrievingViewController = self.storyboard?.instantiateViewController(withIdentifier: "errorReminderStoryboeard") as! ErrorRetrievingViewController

        if !reminderName!.isEmpty && !password!.isEmpty {
            
            for user in UsernamePasswordModel.shared.userAccount.values {

                if user[2] == reminderName && user[1] == password {
                    usernameText.text = "Username: " + user[0]
                    reminderNameText.text = reminderName
                    passwordText.text = password
                    usernameIsExist = true
                }
            }
            if !usernameIsExist {
                errorDetail.errorContent = "Remind name or password is not match"
                self.present(errorDetail, animated: true, completion: nil)
            }
        } else if reminderName!.isEmpty {
           errorDetail.errorContent = "Use the reminder name"
           self.present(errorDetail, animated: true, completion: nil)
        } else {
           errorDetail.errorContent = "Password is empty"
           self.present(errorDetail, animated: true, completion: nil)
        }
    }
}
