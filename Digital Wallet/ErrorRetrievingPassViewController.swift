//
//  ErrorRetrievingPassViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-22.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class ErrorRetrievingPassViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var errorReminderLabel: UILabel!
    @IBOutlet weak var backButtonOutlet: UIButton!
        
        var errorContent = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.masksToBounds = true
        mainLabel.layer.cornerRadius = 20.0
        
        backButtonOutlet.layer.masksToBounds = true
        backButtonOutlet.layer.cornerRadius = 5.0
        
        errorReminderLabel.text = errorContent
    }
}
