//
//  Food.swift
//  TestTask
//
//  Created by Влад Тимчук on 16.06.2023.
//

import Foundation

struct Food {
    var name: String
    var weight: Int
    var calories: Int
    var addedDate: String
}

#if DEBUG
extension Food {
    static var foodList = [
        Food(name: "Вівсянка", weight: 230, calories: 140, addedDate: "Вчора"),
        Food(name: "Банан", weight: 250, calories: 160, addedDate: "Вчора"),
        Food(name: "Вівсянка", weight: 230, calories: 140, addedDate: "Вчора"),
        Food(name: "Вівсянка", weight: 230, calories: 140, addedDate: "Вчора"),
        Food(name: "Вівсянка", weight: 230, calories: 140, addedDate: "Вчора"),
        Food(name: "Вівсянка", weight: 230, calories: 140, addedDate: "Вчора")
    ]
}
#endif
