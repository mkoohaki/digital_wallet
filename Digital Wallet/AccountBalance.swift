//
//  AccountBalance.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-23.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class AccountBalance: NSObject {
    
    static let shared: AccountBalance = AccountBalance()
    
    var debitAccountLimit: Double = 1000.0
    var creditAccountLimit: Double = 2000.0
    var debitAccountBalance: Double = 0.0
    var creditAccountBalance: Double = 0.0
}
