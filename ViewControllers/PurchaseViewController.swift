//
//  PurchaseViewController.swift
//  CookieApp
//
//  Created by Abdalla Abdelgadir on 2025-06-16.
//

import UIKit

class PurchaseViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!

    var cookie: Cookie!
    var selectedVariant: String?
    var selectedQuantity: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let cookie = cookie else {
            print("Cookie was not set")
            return
        }
        imageView.image = UIImage(named: cookie.imageName)
        nameLabel.text = cookie.name
        pickerView.dataSource = self
        pickerView.delegate = self
        updateTotal()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return cookie.variants == nil ? 1 : 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let variants = cookie.variants {
            return component == 0 ? variants.count : (variants[selectedVariantIndex()].stock)
        }
        return 10
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let variants = cookie.variants {
            return component == 0 ? variants[row].name : "\(row + 1)"
        }
        return "\(row + 1)"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if cookie.variants != nil && component == 0 {
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        }
        selectedVariant = cookie.variants != nil ? cookie.variants![pickerView.selectedRow(inComponent: 0)].name : nil
        selectedQuantity = pickerView.numberOfComponents == 1 ? pickerView.selectedRow(inComponent: 0) + 1 : pickerView.selectedRow(inComponent: 1) + 1
        updateTotal()
    }

    func selectedVariantIndex() -> Int {
        return pickerView.selectedRow(inComponent: 0)
    }

    func updateTotal() {
        let quantity = selectedQuantity
        let total = Double(quantity) * cookie.price
        totalLabel.text = String(format: "Total: $%.2f", total)
        buyButton.isEnabled = cookie.variants == nil || (cookie.variants![selectedVariantIndex()].stock >= quantity)
    }

    @IBAction func buyTapped(_ sender: UIButton) {
        let success = StoreManager.shared.purchase(cookie: cookie, variant: selectedVariant, quantity: selectedQuantity)
        let alert = UIAlertController(title: success ? "Success" : "Out of Stock", message: success ? "Purchase complete" : "Not enough stock", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            if success { self.navigationController?.popViewController(animated: true) }
        })
        present(alert, animated: true)
    }
}

