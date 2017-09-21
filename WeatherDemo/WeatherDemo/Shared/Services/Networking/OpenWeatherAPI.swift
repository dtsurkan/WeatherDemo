//
//  OpenWeatherAPI.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/21/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation
import Moya

enum OpenWeatherAPI {
    case currentWeather(lat: Double, long: Double)
    case forecast(lat: Double, long: Double)
}

// MARK: - TargetType

extension OpenWeatherAPI: TargetType {
   
    private var openWeatherAPIKey: String {
        return "34f5ef8a4d1054f493e92d21197990e9"
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding(destination: .queryString)
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    var path: String {
        switch self {
        case .currentWeather(let lat, let long):
            return "/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(openWeatherAPIKey)"
        case .forecast(let lat, let long):
            return "/data/2.5/forecast?lat=\(lat)&lon=\(long)&appid=\(openWeatherAPIKey)"
        }
    }
    
    var base: String { return  "http://api.openweathermap.org"  }
    var baseURL: URL { return URL(string: base)! }
    
    var parameters: [String: Any]? {
        switch self {
        case .currentWeather, .forecast:
            return [:]
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .currentWeather, .forecast:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return [:]
    }
}

