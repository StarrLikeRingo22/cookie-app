//
//  ItemListViewController.swift
//  CookieApp
//
//  Created by Abdalla Abdelgadir on 2025-06-16.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var cookieTableView: UITableView!
    var cookies = StoreManager.shared.cookies

    override func viewDidLoad() {
        super.viewDidLoad()
        cookieTableView.dataSource = self
        cookieTableView.delegate = self
    }
    
    @IBAction func logoutTapped(_ sender: UIBarButtonItem) {
        StoreManager.shared.logout()
        dismiss(animated: true)
    }
}

extension ItemListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cookieCell = tableView.dequeueReusableCell(withIdentifier: "cookieCell", for: indexPath) as! CookieCell
        let cookie = cookies[indexPath.row]
        cookieCell.cookieName.text = cookie.name
        cookieCell.cookiePrice.text = String(format: "$%.2f", cookie.price)
        cookieCell.cookieImage.image = UIImage(named: cookie.imageName)
        return cookieCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cookie = cookies[indexPath.row]
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PurchaseViewController") as? PurchaseViewController {
            vc.cookie = cookie
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


