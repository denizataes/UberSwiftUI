//
//  UberMapViewRepresentable.swift
//  UberSwiftUI
//
//  Created by Deniz Ata Eş on 14.03.2023.
//

import Foundation
import MapKit
import SwiftUI

struct UberMapViewRepresentable: UIViewRepresentable{
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    func makeUIView(context: Context) -> some UIView{
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
    
}

extension UberMapViewRepresentable{
    
    class MapCoordinator: NSObject, MKMapViewDelegate{
        let parent: UberMapViewRepresentable
        
        init(parent: UberMapViewRepresentable){
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            parent.mapView.setRegion(region, animated: true)
        }
    }
    
}
