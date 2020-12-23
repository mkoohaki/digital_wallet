//
//  RowTableViewCell.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-18.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class RowTableViewCell: UITableViewCell {

    @IBOutlet weak var purchaseDescriptionLabel: UILabel!
    @IBOutlet weak var purchaseTypeLabel: UILabel!
    @IBOutlet weak var purchaseSourceLabel: UILabel!
    @IBOutlet weak var purchasePriceLabel: UILabel!
    @IBOutlet weak var purchaseLocationLabel: UILabel!
    @IBOutlet weak var purchaseTimeLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        purchaseDescriptionLabel.layer.masksToBounds = true
        purchaseDescriptionLabel.layer.cornerRadius = 10.0
    }
}
