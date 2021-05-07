//
//  MapMaster2.swift
//  coffee-run-core
//
//  Created by Moses Kang on 5/6/21.
//

import Foundation
import MapKit
import SwiftUI

class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapMaster2
    
    init(_ control: MapMaster2){
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]){
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1500, longitudinalMeters: 1500)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
    
}

struct MapMaster2: UIViewRepresentable {
    
    let cafes: [Landmark]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapMaster2>) {
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.cafes.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}

