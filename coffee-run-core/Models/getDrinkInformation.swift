//
//  getDrinkInformation.swift
//  coffee-run-core
//
//  Created by Moses Kang on 5/5/21.
//

import Foundation

class getDrinkInformation {
    let userDefaults = UserDefaults.standard
    
    //functions for drink set and get
    func getDrinks() -> [String] {
        var orders: [String] = self.userDefaults.object(forKey: "items") as? [String] ?? []
        return orders
    }
    func setDrinks(drinks: [String]){
        userDefaults.set(drinks, forKey: "items")
    }
    
    //functions for price set and get
    func getPrice() -> [Double] {
        var prices: [Double] = self.userDefaults.object(forKey: "costs") as? [Double] ?? []
        return prices
    }
    func setCosts(cost: [Double]){
        userDefaults.set(cost, forKey: "costs")
    }


}
