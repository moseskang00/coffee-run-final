//
//  CoreDataManager.swift
//  coffee-run-core
//
//  Created by Moses Kang on 4/20/21.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "FavoriteList")
        persistentContainer.loadPersistentStores{(description, error) in
            if let error = error {
                fatalError("Core Data Store failed")
            }
            
        }
    }
    
    //function used to add a drink to core data
    func saveOrder(drink: String, cost: Double, cal: String, carb: String, pro: String, pot: String, sod: String, cho: String, fat: String, caf: String, img: UIImage){
        let item = FavoriteItems(context: persistentContainer.viewContext)
        item.drinkName = drink
        item.cost = cost
        item.calories = cal
        item.carbs = carb
        item.protien = pro
        item.potassium = pot
        item.sodium = sod
        item.cholesterol = cho
        item.totalFat = fat
        item.caffine = caf
        item.image = img.jpegData(compressionQuality: 1.0) ?? UIImage(named: "default")?.jpegData(compressionQuality: 1.0)
        
        do {
            try persistentContainer.viewContext.save()
            print("oppa")
        } catch {
            print("Failed to save Drink \(error)")
        }
    }
    
    func deleteOrder(order: FavoriteItems){
        persistentContainer.viewContext.delete(order)
        do {
            try persistentContainer.viewContext.save()
            print("deleted")
        } catch {
            print("failed to delete Drink \(error)")
        }
        
    }
    
    func getAllOrders() -> [FavoriteItems]{
        let fetchRequest: NSFetchRequest<FavoriteItems> = FavoriteItems.fetchRequest()
        
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func finalizeCore(){
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("failed to save Drink")
            print(error)
        }
    }
}
