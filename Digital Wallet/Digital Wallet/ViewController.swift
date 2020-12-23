//
//  ViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-11.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.masksToBounds = true
        mainLabel.layer.cornerRadius = 20.0
        
        mainLabel.text = "  Created By:\n    Meisam Koohaki\n    Haidder Malik\n Professor:\n    Sujjet Lohan\n Mobile Development Using Swift\n    Georgian College"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.performSegue(withIdentifier: "protectedToLogin", sender: self)
    }
}

