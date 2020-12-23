//
//  UsernamePasswordModel.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-22.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class UsernamePasswordModel: NSObject {
    
    static let shared: UsernamePasswordModel = UsernamePasswordModel()
    
    var userAccount: Dictionary<Int, [String]> = [0: ["", "", ""]]
}
