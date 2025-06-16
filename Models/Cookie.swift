//
//  Cookie.swift
//  CookieApp
//
//  Created by Abdalla Abdelgadir on 2025-06-16.
//

struct CookieVariant {
    let name: String
    var stock: Int
}

class Cookie {
    let name: String
    let imageName: String
    let price: Double
    var variants: [CookieVariant]?

    init(name: String, imageName: String, price: Double, variants: [CookieVariant]?) {
        self.name = name
        self.imageName = imageName
        self.price = price
        self.variants = variants
    }
}

