//
//  ListView.swift
//  ASU_UTO_Coding_Challenge_1
//
//  Created by Moses Kang on 3/31/21.
//

import SwiftUI

struct ListView: View {
    @State var searchText = ""
    @State var totalCost = 0.0
    @State var currentOrders: [String] = []
    @State var currentPrice: [Double] = []
    var getOrders = getDrinkInformation()
    
    var body: some View {
        VStack{
            if currentOrders.count != 0 {
                VStack{
                    List{
                        ForEach(currentOrders, id:\.self){ order in
                            Text(order)
                        }.onDelete(perform: { indexSet in
                            indexSet.forEach{index in
                                currentOrders.remove(at: index)
                                currentPrice.remove(at: index)
                                self.saveOrder()
                                totalCost = 0.0
                                currentPrice = getOrders.getPrice()
                                for order in currentPrice{
                                    totalCost += order
                                }
                            }
                        })
                    }
                    .onAppear(perform: {
                        currentPrice = getOrders.getPrice()
                        for order in currentPrice{
                            totalCost += order
                        }
                    })
                    
                    //Calculates final Cost
                    HStack{
                        Spacer()
                        Text("Total Cost:")
                        Spacer()
                        Text("$" + String(format: "%.2f", totalCost))
                            .padding(20)
                        Spacer()
                    }
                }
            } else {
                Text("Welcome to Coffee Run!")
                Text("To begin please add a drink from the drinks list")
            }
            
        }
        .onAppear(perform: {
            //using user defaults to get currentOrders
            currentOrders = getOrders.getDrinks()
            currentPrice = getOrders.getPrice()
            getOrders.setCosts(cost: currentPrice)
            getOrders.setDrinks(drinks: currentOrders)
        })
    }
    
    func saveOrder(){
        getOrders.setDrinks(drinks: currentOrders)
        getOrders.setCosts(cost: currentPrice)
        currentOrders = getOrders.getDrinks()
        print(currentOrders)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

/*
 
 */
