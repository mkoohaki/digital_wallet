//
//  SignupViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-11.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var repasswordText: UITextField!
    @IBOutlet weak var reminderNameText: UITextField!
    @IBOutlet weak var signupButtonOutlet: UIButton!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var passwordVisibleButtonOutlet: UIButton!
        
    var lightPurpol = UIColor(red: 0.8399218917, green: 0.6679782271, blue: 0.9903358817, alpha: 1)
    var closed_eye : UIImage? = UIImage(named: "closed_eye")
    var eye : UIImage? = UIImage(named: "eye")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.layer.masksToBounds = true
        mainLabel.layer.cornerRadius = 20.0
        
        loginButtonOutlet.layer.masksToBounds = true
        loginButtonOutlet.layer.cornerRadius = 5.0
        
        signupButtonOutlet.layer.masksToBounds = true
        signupButtonOutlet.layer.cornerRadius = 10.0
        
        usernameText.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: lightPurpol])
        
        passwordText.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: lightPurpol])
        
        repasswordText.attributedPlaceholder = NSAttributedString(string: "Repeate Password", attributes: [NSAttributedString.Key.foregroundColor: lightPurpol])
        
        reminderNameText.attributedPlaceholder = NSAttributedString(string: "Reminder Name", attributes: [NSAttributedString.Key.foregroundColor: lightPurpol])
    }
    
    @IBAction func passwordVisibleButton(_ sender: UIButton) {
        
        if passwordVisibleButtonOutlet.currentBackgroundImage == eye {
            passwordText.isSecureTextEntry = false
            passwordVisibleButtonOutlet.setBackgroundImage( closed_eye, for: .normal)

        } else {
            passwordText.isSecureTextEntry = true
            passwordVisibleButtonOutlet.setBackgroundImage( eye, for: .normal)
        }
    }

    @IBAction func signup(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let username = usernameText.text!
        let password = passwordText.text!
        let rePassword = repasswordText.text!
        let reminderName = reminderNameText.text!
        var usernameIsExist = false
        
        let errorDetail:ErrorSignupViewController = self.storyboard?.instantiateViewController(withIdentifier: "errorSignupStoryboard") as! ErrorSignupViewController
        
        if username.count >= 4 && password.count >= 6 && password == rePassword && !reminderName.isEmpty{
        
            for oldUsername in UsernamePasswordModel.shared.userAccount.values {
                if oldUsername[0] == username {
                    usernameIsExist = true
                }
            }
            if !usernameIsExist {
                let lastKeyNumber = UsernamePasswordModel.shared.userAccount.keys.max()!
                UsernamePasswordModel.shared.userAccount[lastKeyNumber+1] = [username, password, reminderName]
            }
            else {
                errorDetail.errorContent = "Username is used, try another"
                self.present(errorDetail, animated: true, completion: nil)
            }
        } else if username.count < 4 {
            errorDetail.errorContent = "Username must be longer than 4 characters"
            self.present(errorDetail, animated: true, completion: nil)
        } else if password.count < 6 {
            errorDetail.errorContent = "Password must be longer than 6 characters"
            self.present(errorDetail, animated: true, completion: nil)
        } else if reminderName.isEmpty {
            errorDetail.errorContent = "Select a reminder name for retrieving"
            self.present(errorDetail, animated: true, completion: nil)
        } else {
            errorDetail.errorContent = "Password is not match"
            self.present(errorDetail, animated: true, completion: nil)
        }
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        let login:LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "loginStoryboard") as! LoginViewController
        self.present(login, animated: true, completion: nil)
    }
}
