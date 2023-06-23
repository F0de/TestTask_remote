//
//  Model.swift
//  TestTask
//
//  Created by Влад Тимчук on 16.06.2023.
//

import Foundation

struct Product {
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

#if DEBUG
extension Product {
    static var data = [
    Product(name: "Вівсянка", weight: 230, calories: 140, addedDate: "Сьогодні"),
    Product(name: "Гречка", weight: 250, calories: 160, addedDate: "Вчора")
//    Product(name: "Вівсянка", weight: 230, calories: 140, addedDate: "16")
    ]
}
#endif
