//
//  Meal.swift
//  TestTask
//
//  Created by Влад Тимчук on 23.06.2023.
//

import Foundation

struct Meal {
    var name: String
    var calories: Int
    var foodList: [String]
}

#if DEBUG
extension Meal {
    static var mealList = [
    Meal(name: "Сніданок", calories: 240, foodList: ["Вівсянка","Банан","Молоко"]),
    Meal(name: "Сніданок", calories: 240, foodList: ["Вівсянка","Банан","Молоко"]),
    Meal(name: "Сніданок", calories: 240, foodList: ["Вівсянка","Банан","Молоко"]),
    Meal(name: "Сніданок", calories: 240, foodList: ["Вівсянка","Банан","Молоко"])
    ]
}
#endif
