//
//  LocationService.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/21/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate: class {
    func locationDidUpdate(_ service: LocationService, location: CLLocation)
}

class LocationService: NSObject {
    
    // MARK: - shared instance
    static let shared = LocationService()
    
    
    // MARK: - Properties
    weak var delegate: LocationServiceDelegate?
    var lastLocation: CLLocation?
    
    fileprivate let locationManager = CLLocationManager()
    
    
    // MARK: - Init
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    // MARK: - Methods
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        locationManager.stopUpdatingHeading()
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationService : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            lastLocation = location
            delegate?.locationDidUpdate(self, location: location);
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error finding location: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
}
