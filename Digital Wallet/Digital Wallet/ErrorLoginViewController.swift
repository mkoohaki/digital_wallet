//
//  ErrorLoginViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-21.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class ErrorLoginViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var errorLoginLabel: UILabel!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    var errorContent = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mainLabel.layer.masksToBounds = true
        mainLabel.layer.cornerRadius = 20.0
        
        loginButtonOutlet.layer.masksToBounds = true
        loginButtonOutlet.layer.cornerRadius = 5.0
        
        errorLoginLabel.text = errorContent
    }
}
