//
//  HomeViewController.swift
//  Digital Wallet
//
//  Created by Meisam Koohaki on 2020-07-12.
//  Copyright © 2020 Meisam Koohaki. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var purchaseListTable: UITableView!
    @IBOutlet weak var logoutButtonOutlet: UIButton!
    
    var purchasePrices: [String] = []
    var purchaseDescription: [String] = []
    var purchaseTypes: [String] = []
    var purchaseSources: [String] = []
    var purchaseLocations: [String] = []
    var purchaseTimes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.masksToBounds = true
        mainLabel.layer.cornerRadius = 20.0
        
        logoutButtonOutlet.layer.masksToBounds = true
        logoutButtonOutlet.layer.cornerRadius = 5.0
                
        setupPurchaseListTable()
    }
    
    func setupPurchaseListTable() {
        
        let nib = UINib(nibName: "RowTableViewCell", bundle: nil)
        purchaseListTable.register(nib, forCellReuseIdentifier: "RowTableViewCell")
        
        purchaseListTable.delegate = self
        purchaseListTable.dataSource = self
        
        purchasePrices = PurchaseListModel.shared.purchasePrices
        purchaseDescription = PurchaseListModel.shared.purchaseDescription
        purchaseTypes = PurchaseListModel.shared.purchaseTypes
        purchaseSources = PurchaseListModel.shared.purchaseSources
        purchaseLocations = PurchaseListModel.shared.purchaseLocations
        purchaseTimes = PurchaseListModel.shared.purchaseTimes
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("You Tapped me!")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PurchaseListModel.shared.purchasePrices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RowTableViewCell", for: indexPath) as! RowTableViewCell

        cell.purchasePriceLabel.text = formatAsCurrency(number: Double(purchasePrices[indexPath.row])! as NSNumber)
        cell.purchaseDescriptionLabel.text = purchaseTypes[indexPath.row]
        cell.purchaseTypeLabel.text = purchaseTypes[indexPath.row]
        cell.purchaseSourceLabel.text = purchaseSources[indexPath.row]
        cell.purchaseLocationLabel.text = purchaseLocations[indexPath.row]
        cell.purchaseTimeLabel.text = purchaseTimes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            
            tableView.beginUpdates()
            
            if PurchaseListModel.shared.purchaseSources[indexPath.row] == "debit" {
                AccountBalance.shared.debitAccountBalance -= Double(PurchaseListModel.shared.purchasePrices[indexPath.row])!
               } else {
                   AccountBalance.shared.creditAccountBalance -= Double(PurchaseListModel.shared.purchasePrices[indexPath.row])!
               }
            
            PurchaseListModel.shared.purchasePrices.remove(at: indexPath.row)
            PurchaseListModel.shared.purchaseDescription.remove(at: indexPath.row)
            PurchaseListModel.shared.purchaseTypes.remove(at: indexPath.row)
            PurchaseListModel.shared.purchaseSources.remove(at: indexPath.row)
            PurchaseListModel.shared.purchaseLocations.remove(at: indexPath.row)
            PurchaseListModel.shared.purchaseTimes.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)

            tableView.endUpdates()
        }
    }
    
    // Here after clicking this button, we will navigate to Login Page
    @IBAction func logoutButton(_ sender: Any) {
        
        let login = self.storyboard?.instantiateViewController(withIdentifier: "loginStoryboard") as! LoginViewController
        // navigating to SecondViewController
        self.navigationController?.pushViewController(login, animated: true)
    }
}
