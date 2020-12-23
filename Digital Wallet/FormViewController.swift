//
//  FormViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-12.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var typeText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var sourceSegmented: UISegmentedControl!
    @IBOutlet weak var timeText: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var logoutButtonOutlet: UIButton!
    
    var sourceMoney = "debit"
    
    var paceholderColor = UIColor(red: 0.8544983268, green: 0.7246550918, blue: 0.7270756364, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.masksToBounds = true
        mainLabel.layer.cornerRadius = 20.0
        
        priceText.text = ""
        priceText.layer.masksToBounds = true
        priceText.layer.cornerRadius = 10.0
        priceText.attributedPlaceholder = NSAttributedString(string: "Price", attributes: [NSAttributedString.Key.foregroundColor: paceholderColor])
        
        descriptionText.text = ""
        descriptionText.layer.masksToBounds = true
        descriptionText.layer.cornerRadius = 10.0
        descriptionText.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [NSAttributedString.Key.foregroundColor: paceholderColor])
       
        typeText.text = ""
        typeText.layer.masksToBounds = true
        typeText.layer.cornerRadius = 10.0
        typeText.attributedPlaceholder = NSAttributedString(string: "Type", attributes: [NSAttributedString.Key.foregroundColor: paceholderColor])
      
        locationText.text = ""
        locationText.layer.masksToBounds = true
        locationText.layer.cornerRadius = 10.0
        locationText.attributedPlaceholder = NSAttributedString(string: "Location", attributes: [NSAttributedString.Key.foregroundColor: paceholderColor])
        
        sourceSegmented.layer.masksToBounds = true
        sourceSegmented.layer.cornerRadius = 10.0
        
        timeText.text = ""
        timeText.layer.masksToBounds = true
        timeText.layer.cornerRadius = 10.0
        timeText.attributedPlaceholder = NSAttributedString(string: "Time", attributes: [NSAttributedString.Key.foregroundColor: paceholderColor])
        
        submitButton.layer.masksToBounds = true
        submitButton.layer.cornerRadius = 20.0

        logoutButtonOutlet.layer.masksToBounds = true
        logoutButtonOutlet.layer.cornerRadius = 5.0

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(datePicker:)), for: UIControl.Event.valueChanged)
        timeText.inputView = datePicker
        
        // At the end of project I just learned how to manage and classified the colors, then I cannot do it for the old works
        datePicker.layer.masksToBounds = true
        datePicker.backgroundColor = UIColor(named: "formBackground")
        datePicker.setValue(UIColor(named: "homeBackground"), forKey:"textColor")
    }
    
    @IBAction func sourceMoneyController(_ sender: Any) {
        if sourceMoney == "credit" {
            sourceMoney = "debit"
        } else {
            sourceMoney = "credit"
        }
    }
    
    @IBAction func submitButton(_ sender: UIButton) {

        let price = priceText.text!
        let description = descriptionText.text!
        let type = typeText.text!
        let location = locationText.text!
        let time = timeText.text!
        
        var newBalance = 0.0
        
        if !price.isEmpty {
            if sourceMoney == "debit" {
                newBalance = AccountBalance.shared.debitAccountLimit - (AccountBalance.shared.debitAccountBalance + Double(price)!)
            } else {
                newBalance = AccountBalance.shared.creditAccountLimit - (AccountBalance.shared.creditAccountBalance + Double(price)!)
            }
        }
        
        if !price.isEmpty && !description.isEmpty && !type.isEmpty && price != "---------PRICE error" && description != "---DESCRIPTION error" && type != "----------TYPE error" && newBalance >= 0 {
            
            PurchaseListModel.shared.purchasePrices.append(price)
            PurchaseListModel.shared.purchaseDescription.append(description)
            PurchaseListModel.shared.purchaseTypes.append(type)
            PurchaseListModel.shared.purchaseSources.append(sourceMoney)
            PurchaseListModel.shared.purchaseLocations.append(location)
            PurchaseListModel.shared.purchaseTimes.append(time)
            
            priceText.text = ""
            descriptionText.text = ""
            typeText.text = ""
            locationText.text = ""
            timeText.text = ""
            
            if sourceMoney == "debit" {
                AccountBalance.shared.debitAccountBalance += Double(price)!
            } else {
                AccountBalance.shared.creditAccountBalance += Double(price)!
            }
        } else if price.isEmpty {
            priceText.text = "---------PRICE error"
        } else if description.isEmpty {
            descriptionText.text = "---DESCRIPTION error"
        } else if type.isEmpty{
            typeText.text = "----------TYPE error"
        } else if newBalance < 0 {
            priceText.text = "No enough money error"
        }
    }
    
    @objc func datePickerValueChanged(datePicker: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        timeText.text = formatter.string(from: datePicker.date)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // Here after clicking this button, we will navigate to Login Page
    @IBAction func logoutButton(_ sender: Any) {
        
        let login = self.storyboard?.instantiateViewController(withIdentifier: "loginStoryboard") as! LoginViewController
        // navigating to SecondViewController
        self.navigationController?.pushViewController(login, animated: true)
        
        
//        UIStoryboard.self; *storyboard = [UIStoryboard, storyboardWithName,:@"Main" bundle:nil];
//        UIViewController *login = [storyboard instantiateViewControllerWithIdentifier:@"Login"];
//        [self.navigationController setViewControllers:@[login] animated:true];
    
    }
}
