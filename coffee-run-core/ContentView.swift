//
//  ContentView.swift
//  coffee-run-core
//
//  Created by Moses Kang on 4/20/21.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    @State private var items: [FavoriteItems] = [FavoriteItems]()
    
    var body: some View {
        Home(coreDM: coreDM)
            .onAppear(perform: {
                items = coreDM.getAllOrders()
                print(items.count)
                if items.count == 0{
                    print("enter")

                    coreDM.saveOrder(drink: "Tap Water", cost: 1.00, cal: "0", carb: "0 g", pro: "0 g", pot: "0 mg", sod: "0 mg", cho: "0 mg", fat: "0 g", caf: "0 mg", img: UIImage(named: "Tap Water")!)
                    coreDM.saveOrder(drink: "Sprite", cost: 1.50, cal: "192", carb: "49 g", pro: "0.2 g", pot: "5 mg", sod: "44 mg", cho: "0 mg", fat: "0.1 g", caf: "0 mg", img: UIImage(named: "Sprite")!)
                    coreDM.saveOrder(drink: "Black Coffee", cost: 2.00, cal: "2.4", carb: "0 g", pro: "0.3 g", pot: "116 mg", sod: "4.7 mg", cho: "0 mg", fat: "0.1 g", caf: "94.8 mg", img: UIImage(named: "Black Coffee")!)

                }
                
                //debugging
                else {
                    for o in items{
                        print(o.drinkName)
                    }
                }
                
                
            })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
