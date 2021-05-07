//
//  MapView2.swift
//  coffee-run-core
//
//  Created by Moses Kang on 5/6/21.
//

import SwiftUI
import MapKit

struct MapView2: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var search: String = "Cafes"
    @State private var cafes: [Landmark] = [Landmark]()
    
    
    //MARK: function to get nearby locations.
    private func getNearBy() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let searchh = MKLocalSearch(request: request)
        searchh.start { (response, error) in
            if let response = response {
                
                let mapItems2 = response.mapItems
                self.cafes = mapItems2.map {
                    Landmark(placemark: $0.placemark)
                }
            }
        }
        print(cafes)
    }
    
    //MARK: Main view
    var body: some View {
        ZStack(alignment: .bottom) {
            MapMaster2(cafes: cafes)
            Button(action: {
                self.getNearBy()
                print(cafes)
            }, label: {
                Text("Get Local Cafes")
                    .frame(width: 200, height:50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(20)
            })
        }
    }
}

struct MapView2_Previews: PreviewProvider {
    static var previews: some View {
        MapView2()
    }
}
