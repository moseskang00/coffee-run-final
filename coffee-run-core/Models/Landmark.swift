//
//  Landmark.swift
//  coffee-run-core
//
//  Created by Moses Kang on 5/4/21.
//

import Foundation
import MapKit

struct Landmark {
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.title ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
