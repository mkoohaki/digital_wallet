//
//  LoginViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-11.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var retrievingButtonOutlet: UIButton!
    @IBOutlet weak var signupButtonOutlet: UIButton!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var passwordVisibleButtonOutlet: UIButton!
        
    var closed_eye : UIImage? = UIImage(named: "closed_eye")
    var eye : UIImage? = UIImage(named: "eye")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.masksToBounds = true
        mainLabel.layer.cornerRadius = 20.0
        
        
        retrievingButtonOutlet.layer.masksToBounds = true
        retrievingButtonOutlet.layer.cornerRadius = 5.0
        
        signupButtonOutlet.layer.masksToBounds = true
        signupButtonOutlet.layer.cornerRadius = 5.0
        
        loginButtonOutlet.layer.masksToBounds = true
        loginButtonOutlet.layer.cornerRadius = 10.0
        
        usernameText.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        passwordText.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
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
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        let username = usernameText.text!
        let password = passwordText.text!
        
        let errorDetail:ErrorLoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "errorLoginStoryboard") as! ErrorLoginViewController
        
        if !username.isEmpty && !password.isEmpty {
            
            for user in UsernamePasswordModel.shared.userAccount.values {

                if user[0] == username {
                    if user[1] == password {
                        let home = UIStoryboard(name: "Main", bundle: nil)
                        let tabBarStoryboard = storyboard!.instantiateViewController(identifier: "tabBarStoryboard")
                        // This is to get the SceneDelegate object from your view controller
                        // then call the change root view controller function to change to main tab bar
                        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBarStoryboard)
                    }
                }
            }
            
            errorDetail.errorContent = "Username or password is wrong"
            self.present(errorDetail, animated: true, completion: nil)
            
        } else if username.isEmpty {
            errorDetail.errorContent = "Use the username"
            self.present(errorDetail, animated: true, completion: nil)
        } else{
            errorDetail.errorContent = "Password is empty"
            self.present(errorDetail, animated: true, completion: nil)
        }
    }
}
