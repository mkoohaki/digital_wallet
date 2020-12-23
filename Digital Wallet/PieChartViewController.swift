//
//  PieChartViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-12.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var logoutButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.masksToBounds = true
        mainLabel.layer.cornerRadius = 20.0

        logoutButtonOutlet.layer.masksToBounds = true
        logoutButtonOutlet.layer.cornerRadius = 5.0
    }
    
    // Here after clicking this button, we will navigate to Login Page
    @IBAction func logoutButton(_ sender: Any) {
        
        let login = self.storyboard?.instantiateViewController(withIdentifier: "loginStoryboard") as! LoginViewController
        // navigating to SecondViewController
        self.navigationController?.pushViewController(login, animated: true)
    }
}
