//
//  PurchaseListModel.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-22.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class PurchaseListModel: NSObject {
    
    static let shared: PurchaseListModel = PurchaseListModel()
    
    //I wanted to create this format, but the dictionery does not follow priority of Key - There was a way for using this, but I did not have time to find that insgtead that time I spended just for this
    //var purchaseList: Dictionary<Int, [String]> = [0: ["", "", "", "", "", ""]]
    
    var purchasePrices: [String] = []
    var purchaseDescription: [String] = []
    var purchaseTypes: [String] = []
    var purchaseSources: [String] = []
    var purchaseLocations: [String] = []
    var purchaseTimes: [String] = []
}
