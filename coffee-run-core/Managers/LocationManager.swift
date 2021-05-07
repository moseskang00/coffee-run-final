//
//  LocationManager.swift
//  coffee-run-core
//
//  Created by Moses Kang on 5/6/21.
//

import Foundation
import MapKit
import SwiftUI

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    var location: CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}


extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    func locationManager(_manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.last else {
            return
        }
        self.location = location
    }
}
