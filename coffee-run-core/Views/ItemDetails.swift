//
//  ItemDetails.swift
//  coffee-run-core
//
//  Created by Moses Kang on 5/4/21.
//

import SwiftUI

struct ItemDetails: View {
    
    let currentOrder: FavoriteItems
    var getOrders = getDrinkInformation()
    @Environment(\.presentationMode) var presentation

    @State private var image: UIImage?
    @State private var placeholder = "placeholder"

    var body: some View {
        ScrollView(.vertical){
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    Text(currentOrder.drinkName ?? "")
                        .font(.system(size: 28))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("$" + String(format: "%.2f", currentOrder.cost))
                        .font(.system(size: 28))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                Divider().frame(width: 250)
                    .background(Color.green)
                VStack {
                    Image(uiImage:UIImage(data: currentOrder.image!) ?? UIImage(named: placeholder)!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                
                GroupBox(label:
                            HStack{
                                Text("Calories")
                            }, content: {
                                Text(currentOrder.calories ?? "").font(.system(size:24))
                })
                    .padding()
                GroupBox(label:
                            HStack{
                                Spacer()
                                Text("Total Fat").frame(width: 100)
                                Divider().frame(height:25)
                                Text("Carbs").frame(width: 100)
                                Divider().frame(height:25)
                                Text("Protein").frame(width: 100)
                                Spacer()
                            }, content: {
                                HStack{
                                    Spacer()
                                    Text(currentOrder.totalFat ?? "").frame(width: 100)
                                        .font(.system(size:20))
                                    Divider().frame(height:25)
                                    Text(currentOrder.carbs ?? "").frame(width: 100)
                                        .font(.system(size:20))
                                    Divider().frame(height:25)
                                    Text(currentOrder.protien ?? "").frame(width: 100)
                                        .font(.system(size:20))
                                    Spacer()
                                }
                }) .padding()
                GroupBox(label:
                            HStack{
                                Spacer()
                                Text("Potassium").frame(width: 100)
                                Spacer()
                                Divider().frame(height:25)
                                Spacer()
                                Text("Sodium").frame(width: 100)
                                Spacer()
                            }, content: {
                                HStack{
                                    Spacer()
                                    Text(currentOrder.potassium ?? "").frame(width: 100)
                                    Spacer()
                                    Divider().frame(height:25)
                                    Spacer()
                                    Text(currentOrder.sodium ?? "").frame(width: 100)
                                    Spacer()
                                }
                }) .padding()
                GroupBox(label:
                            HStack{
                                Spacer()
                                Text("Cholesterol").frame(width: 100)
                                Spacer()
                                Divider().frame(height:25)
                                Spacer()
                                Text("Caffine").frame(width: 100)
                                Spacer()
                            }, content: {
                                HStack{
                                    Spacer()
                                    Text(currentOrder.cholesterol ?? "").frame(width: 100)
                                    Spacer()
                                    Divider().frame(height:25)
                                    Spacer()
                                    Text(currentOrder.caffine ?? "").frame(width: 100)
                                    Spacer()
                                }
                }) .padding()
                

                Spacer()
                Button(action: {
                    var currentList = getOrders.getDrinks()
                    currentList.append(currentOrder.drinkName ?? "")
                    var currentMoney = getOrders.getPrice()
                    currentMoney.append(currentOrder.cost)
                    getOrders.setDrinks(drinks: currentList)
                    getOrders.setCosts(cost: currentMoney)
                    currentList = getOrders.getDrinks()
                    print(image)
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    Text("Add to Coffee Run!")
                }).frame(width: 200, height: 50, alignment: .center)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(15)
                .font(.custom("Helvetica", size: 16))
            }.navigationTitle("Nutritional Facts")
        }
        
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(currentOrder: FavoriteItems())
    }
}
