//
//  Home.swift
//  coffee-run-v2
//
//  Created by Moses Kang on 4/16/21.
//

import SwiftUI

struct Home: View {
    let coreDM: CoreDataManager
    @State var selectedIndex = 1
    let tabBarImageNames = ["map.fill", "book", "star.fill"]
    
    var body: some View {
        VStack{
            ZStack{
                switch selectedIndex {
                case 0:
                    MapView2()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                case 1:
                    NavigationView {
                        VStack{
                            ListView()
                        }.navigationTitle("Coffee Run!")
                    }
                    //ListView(coreDM: coreDM)
                default:
                    Text("default")
                    VStack{
                        favoritesList(coreDM: coreDM)
                        //AddDrinker(coreDM: coreDM)
                        //favoriteList()
                        //navigationLink
                    }
                }
            }
            Spacer()

            HStack {
                ForEach(0..<3) { num in
                    Button(action: {
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        Image(systemName: tabBarImageNames[num])
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(selectedIndex == num ? Color(.systemGreen) : .init(white: 0.8))
                        Spacer()
                    })
                }
            }
            
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(coreDM: CoreDataManager())
    }
}
