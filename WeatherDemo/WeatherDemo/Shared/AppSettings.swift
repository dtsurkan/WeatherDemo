//
//  AppSettings.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/22/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation

struct AppSettings {
    
    enum DefaultsKeys: String {
        case metricUnit = "Metric"
        case imperialUnit = "Imperial"
        case language = "Language"
    }
    
    // MARK: - Init
    
    var defaults: UserDefaults
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
    
    init() {
        self.defaults = UserDefaults.standard
    }
    
    // MARK: - Properties
    
    var metricUnit: Bool? {
        get {
            let key = defaults.bool(forKey: DefaultsKeys.metricUnit.rawValue)
            return key
        }
        set(newMetric) {
            defaults.set(newMetric, forKey: DefaultsKeys.metricUnit.rawValue)
        }
    }
    
    var imperialUnit: Bool? {
        get {
            let key = defaults.bool(forKey: DefaultsKeys.imperialUnit.rawValue) 
            return key
        }
        set(newMetric) {
            defaults.set(newMetric, forKey: DefaultsKeys.imperialUnit.rawValue)
        }
    }
    
    var language: String? {
        get {
            let key = defaults.string(forKey: DefaultsKeys.language.rawValue)
            return key
        }
        set(newLanguage) {
            defaults.set(newLanguage, forKey: DefaultsKeys.language.rawValue)
        }
    }
    
    var isMetricUnit: Bool {
        if let metricUnit = metricUnit {
            return metricUnit
        }
        
        return false
    }
    
    var isImperialUnit: Bool {
        if let imperialUnit = imperialUnit {
            return imperialUnit
        }
        
        return false
    }
    
}
