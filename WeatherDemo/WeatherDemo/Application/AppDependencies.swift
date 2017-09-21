//
//  AppDependencies.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/21/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    
    let locationService = LocationService.shared
    
    func setupDependenciesForApplication(_ app: UIApplication, launchOptions: [AnyHashable: Any]?) {
        
        // ask permissions to use user location
        checkLocationStatus()
    }
    
    // MARK: - Internal
    
    private func checkLocationStatus() {
//        switch PermissionScope().statusLocationAlways() {
//        case .authorized:
//            self.locationService.startUpdatingLocation()
//            return
//        case .disabled, .unauthorized:
//            // bummer
//            return
//        case .unknown:
//            askToUseLocation()
//        }
        
        locationService.requestLocation()
        locationService.startUpdatingLocation()
    }
    
    private func askToUseLocation() {
//        let pscope = PermissionScope()
//        pscope.addPermission(LocationAlwaysPermission(), message: "We use this to track\r\nwhere you live")
//
//        pscope.show({ finished, results in
//            if results.first?.status == .authorized {
//                self.locationService.startUpdatingLocation()
//            }
//        }) { results in
//            debugPrint("thing was cancelled")
//        }
    }
}


