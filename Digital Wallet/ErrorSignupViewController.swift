//
//  ErrorSignupViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-20.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class ErrorSignupViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var singupButtonOutlet: UIButton!
    
    var errorContent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singupButtonOutlet.layer.masksToBounds = true
        singupButtonOutlet.layer.cornerRadius = 5.0
        
        errorLabel.text = errorContent
    }
}
