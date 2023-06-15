//
//  Model.swift
//  TestTask
//
//  Created by Влад Тимчук on 16.06.2023.
//

import Foundation

struct Product {
    var id: String
    var name: String
    var weight: Int
    var calories: Int
    var addedDate: String
}

class ProductList {
    var products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
}
