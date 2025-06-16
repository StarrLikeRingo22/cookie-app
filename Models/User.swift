//
//  User.swift
//  CookieApp
//
//  Created by Abdalla Abdelgadir on 2025-06-16.
//

class User {
    let username: String
    let password: String
    var purchaseHistory: [Purchase] = []

    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
