//
//  BankViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-12.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class BankViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var debitBalanceLabel: UITextField!
    @IBOutlet weak var creditBalanceLabel: UITextField!
    @IBOutlet weak var debitLimitLabel: UILabel!
    @IBOutlet weak var creditLimitLabel: UILabel!
    @IBOutlet weak var debitAccountText: UITextField!
    @IBOutlet weak var creditAccountText: UITextField!
    @IBOutlet weak var payBalanceButtonOutlet: UIButton!
    @IBOutlet weak var submitButtonOutlet: UIButton!
    @IBOutlet weak var logoutButtonOutlet: UIButton!
    
    var debitAccountBalance = 0.0
    var creditAccountBalance = 0.0
    var totalCreditSpendMoney = 0.0
    var newDebitLimit = 0.0
    var newCreditLimit = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.masksToBounds = true
        mainLabel.layer.cornerRadius = 20.0

        debitAccountText.text = ""
        debitAccountText.layer.masksToBounds = true
        debitAccountText.layer.cornerRadius = 10.0

        creditAccountText.text = ""
        creditAccountText.layer.masksToBounds = true
        creditAccountText.layer.cornerRadius = 10.0
        
        payBalanceButtonOutlet.layer.masksToBounds = true
        payBalanceButtonOutlet.layer.cornerRadius = 10.0
        
        submitButtonOutlet.layer.masksToBounds = true
        submitButtonOutlet.layer.cornerRadius = 10.0
        
        logoutButtonOutlet.layer.masksToBounds = true
        logoutButtonOutlet.layer.cornerRadius = 5.0
        
        debitBalanceLabel.text = String(formatAsCurrency(number: NSNumber(value: AccountBalance.shared.debitAccountBalance)))
        creditBalanceLabel.text = String(formatAsCurrency(number: NSNumber(value: AccountBalance.shared.creditAccountBalance)))
        debitLimitLabel.text = "/" + String(formatAsCurrency(number: NSNumber(value: AccountBalance.shared.debitAccountLimit)))
        creditLimitLabel.text = "/" + String(formatAsCurrency(number: NSNumber(value: AccountBalance.shared.creditAccountLimit)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        debitBalanceLabel.text = String(formatAsCurrency(number: NSNumber(value: AccountBalance.shared.debitAccountBalance)))
        creditBalanceLabel.text = String(formatAsCurrency(number: NSNumber(value: AccountBalance.shared.creditAccountBalance)))
        debitLimitLabel.text = "/" + String(formatAsCurrency(number: NSNumber(value: AccountBalance.shared.debitAccountLimit)))
        creditLimitLabel.text = "/" + String(formatAsCurrency(number: NSNumber(value: AccountBalance.shared.creditAccountLimit)))
    }

    @IBAction func submitButton(_ sender: UIButton) {
        
        if !debitAccountText.text!.isEmpty {
            newDebitLimit = Double(debitAccountText.text!)!
        } else {
            newDebitLimit = AccountBalance.shared.debitAccountLimit
        }
        
        if !creditAccountText.text!.isEmpty {
            newCreditLimit = Double(creditAccountText.text!)!
        } else {
            newCreditLimit = AccountBalance.shared.creditAccountLimit
        }
        
        if newDebitLimit >= 0 && newCreditLimit >= 0 && newDebitLimit >= AccountBalance.shared.debitAccountBalance && newCreditLimit >= AccountBalance.shared.creditAccountBalance {
            
            debitLimitLabel.text = "/" + String(formatAsCurrency(number: NSNumber(value: newDebitLimit)))
            creditLimitLabel.text = "/" + String(formatAsCurrency(number: NSNumber(value: newCreditLimit)))
                
            AccountBalance.shared.debitAccountLimit = newDebitLimit
            AccountBalance.shared.creditAccountLimit = newCreditLimit
            
            debitAccountText.text = ""
            creditAccountText.text = ""
        }else if (newDebitLimit < 0 || newDebitLimit < AccountBalance.shared.debitAccountBalance) && (newCreditLimit < 0 || newCreditLimit < AccountBalance.shared.creditAccountBalance){
            debitAccountText.text = "Error"
            creditAccountText.text = "Error"
        } else if newCreditLimit < 0 || newCreditLimit < AccountBalance.shared.creditAccountBalance {
            debitAccountText.text = ""
            creditAccountText.text = "Error"
        } else {
            debitAccountText.text = "Error"
            creditAccountText.text = ""
        }
    }
    
    @IBAction func payBalanceButton(_ sender: UIButton) {
        
        debitBalanceLabel.text = String(formatAsCurrency(number: NSNumber(value: 0)))
        creditBalanceLabel.text = String(formatAsCurrency(number: NSNumber(value: 0)))
        
        AccountBalance.shared.debitAccountBalance = 0
        AccountBalance.shared.creditAccountBalance = 0
    }
    
    // Here after clicking this button, we will navigate to Login Page
    @IBAction func logoutButton(_ sender: Any) {
        
        let login = self.storyboard?.instantiateViewController(withIdentifier: "loginStoryboard") as! LoginViewController
        // navigating to SecondViewController
        self.navigationController?.pushViewController(login, animated: true)
    }
}

