//
//  ShopItem.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import Foundation

enum grocery : String, CaseIterable{
    case brocoli = "Brocoli"
    case banana = "Banana"
    case avacodo = "Avacodo"
    case chicken = "Chicken"
    case water = "Water"
}

class ShopItem {
    // name: stores grocery item name,
    // hint: lowercased version of this value can be used access the relavent asset
    var name: String
    
    // price: stores grocery item price
    var price: Double
    
    // quantity: stores how many items user wants purchase
    var quantity: Int
    
    var image : String
    
    init(name: String, price: Double, quantity: Int, image : String) {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.image = image.lowercased()
    }
}
