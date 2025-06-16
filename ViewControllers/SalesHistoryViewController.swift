//
//  SalesHistoryViewController.swift
//  CookieApp
//
//  Created by Abdalla Abdelgadir on 2025-06-16.
//

import UIKit

class SalesHistoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var purchases: [Purchase] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sales History"
        purchases = StoreManager.shared.currentUser?.purchaseHistory ?? []
        tableView.dataSource = self
    }

    @IBAction func logoutTapped(_ sender: UIBarButtonItem) {
        StoreManager.shared.logout()
        dismiss(animated: true)
    }
}

extension SalesHistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let purchase = purchases[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseCell", for: indexPath)
        var text = "\(purchase.cookieName)"
        if let variant = purchase.variant {
            text += " (\(variant))"
        }
        text += " x\(purchase.quantity)"
        cell.textLabel?.text = text
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        cell.detailTextLabel?.text = formatter.string(from: purchase.date)
        return cell
    }
}

