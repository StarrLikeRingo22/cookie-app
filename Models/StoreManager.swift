//
//  StoreManager.swift
//  CookieApp
//
//  Created by Abdalla Abdelgadir on 2025-06-16.
//

import Foundation

class StoreManager {
    static let shared = StoreManager()
    
    var users: [User] = []
    var cookies: [Cookie] = []
    var currentUser: User?
    
    private var purchaseHistory: [String: [Purchase]] = [
        "alice": [],
        "bob": [],
        "charlie": []
    ]
    
    private init() {
        users = [
            User(username: "alice", password: "wonderland"),
            User(username: "bob", password: "builder"),
            User(username: "charlie", password: "chocolate")
        ]
        cookies = [
            Cookie(
                name: "Chocolate Chip",
                imageName: "chocolate_chip", // must match Asset Catalog image
                price: 2.99,
                variants: [
                    CookieVariant(name: "Dark Chocolate", stock: 10),
                    CookieVariant(name: "Milk Chocolate", stock: 8)
                ]
            ),
            Cookie(
                name: "Gingerbread",
                imageName: "gingerbread",
                price: 1.99,
                variants: nil
            ),
            Cookie(
                name: "Oatmeal Raisin",
                imageName: "oatmeal_raisin",
                price: 2.49,
                variants: nil
            ),
            Cookie(
                name: "Macadamia Nut",
                imageName: "macadamia_nut",
                price: 3.49,
                variants: [
                    CookieVariant(name: "White Chocolate", stock: 6),
                    CookieVariant(name: "No Chocolate", stock: 4)
                ]
            ),
            Cookie(
                name: "Peanut Butter",
                imageName: "peanut_butter",
                price: 2.29,
                variants: nil
            )
        ]
    }
    
    func login(username: String, password: String) -> Bool {
        if let user = users.first(where: { $0.username == username && $0.password == password }) {
            currentUser = user
            return true
        }
        return false
    }
    
    func logout() {
        currentUser = nil
    }
    
    func purchase(cookie: Cookie, variant: String?, quantity: Int) -> Bool {
        guard let currentUser = currentUser else { return false }
        
        if let i = cookies.firstIndex(where: { $0.name == cookie.name }) {
            var selectedCookie = cookies[i]
            if let variantName = variant, var variants = selectedCookie.variants {
                if let vi = variants.firstIndex(where: { $0.name == variantName }) {
                    if variants[vi].stock >= quantity {
                        variants[vi].stock -= quantity
                        cookies[i].variants = variants
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
            
            let newPurchase = Purchase(
                cookieName: selectedCookie.name,
                variant: variant,
                quantity: quantity,
                date: Date()
            )
            
            currentUser.purchaseHistory.append(newPurchase)
            return true
        }
        
        return false
    }

    
    func getHistoryForCurrentUser() -> [Purchase] {
               guard let username = UserManager.shared.currentUser else { return [] }
               return purchaseHistory[username] ?? []
           }
}

