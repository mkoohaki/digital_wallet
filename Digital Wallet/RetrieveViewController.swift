//
//  RetrieveViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-11.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class RetrieveViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.layer.masksToBounds = true
        mainLabel.layer.cornerRadius = 20.0
        
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 5.0
    }
}
