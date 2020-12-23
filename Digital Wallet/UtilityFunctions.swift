//
//  UtilityFunctions.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-20.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import Foundation

// convert a numeric value to localized currency string
func formatAsCurrency(number: NSNumber) -> String {
    return NumberFormatter.localizedString(
        from: number, number: .currency)
}
