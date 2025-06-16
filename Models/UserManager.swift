//
//  UserManager.swift
//  CookieApp
//
//  Created by Abdalla Abdelgadir on 2025-06-16.
//

class UserManager {
    static let shared = UserManager()
    private init() {}

    var currentUser: String? = nil
}



