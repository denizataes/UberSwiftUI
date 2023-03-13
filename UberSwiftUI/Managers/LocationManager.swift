//
//  LocationManager.swift
//  UberSwiftUI
//
//  Created by Deniz Ata Eş on 14.03.2023.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject{
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else{return}
        locationManager.stopUpdatingLocation()
    }
}
