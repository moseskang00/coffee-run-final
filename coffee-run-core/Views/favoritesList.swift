//
//  ListView.swift
//  ASU_UTO_Coding_Challenge_1
//
//  Created by Moses Kang on 3/31/21.
//

import SwiftUI

struct favoritesList: View {
    let coreDM: CoreDataManager
    @State var firstName = ""
    @State var lastName = ""
    @State private var orders: [FavoriteItems] = [FavoriteItems]()
    @State var searchText = ""
    
    var body: some View {
        NavigationView{
            VStack{
                if orders.count != 0 {
                    VStack{
                        List{
                            ForEach(orders, id:\.self){ order in
                                NavigationLink(
                                    destination: ItemDetails(currentOrder: order),
                                    label: {
                                        Text(order.drinkName ?? "Unnamed Drink")
                                    })
                            }.onDelete(perform: { indexSet in
                                indexSet.forEach{index in
                                    let orderr = orders[index]
                                    coreDM.deleteOrder(order: orderr)
                                    orders = coreDM.getAllOrders()
                                }
                            })
                        }
                        .onAppear(perform: {
                            orders = coreDM.getAllOrders()
                        })
                        
                    }
                } else {
                    Text("No Favorite Items were found")
                }
                NavigationLink(
                    destination: AddDrinker(coreDM: coreDM),
                    label: {
                        Text("Add a New Drink")
                    })
                    .frame(width: 200, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(15)
                    .padding(5)
                    .font(.custom("Helvetica", size: 16))
                
                
            }.navigationBarTitle("Favorite Drinks List")
        }
        .onAppear(perform: {
            orders = coreDM.getAllOrders()
            print(orders.count)
        })
        
        
        
    }
}

struct favoritesList_Previews: PreviewProvider {
    static var previews: some View {
        favoritesList(coreDM: CoreDataManager())
    }
}

/*
 
 */
