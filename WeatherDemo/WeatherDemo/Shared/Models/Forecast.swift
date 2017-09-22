//
//  Forecast.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/21/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation

struct ForecastModel: Decodable {
    var city: City
    var list: [ForecastItem]
}

struct City: Decodable {
    var coord: Coordinates?
    var country: String
    var id: Int
    var name: String
    var population: Int
}

struct ForecastItem: Decodable {
    var dt: Int
    var dt_txt: String
    var clouds: Clouds
//    var rain: Rain?
    var sys: Sys
    var weather: [Weather]
    var wind: Wind
    var main: WeatherMain
    
    var dayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let date = dateFormatter.date(from: dt_txt)
        dateFormatter.dateFormat = "EEEE dd"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date!)
    }
    
    var dayNumber: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let date = dateFormatter.date(from: dt_txt)
        dateFormatter.dateFormat = "dd"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date!)
    }
    
    var time: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let date = dateFormatter.date(from: dt_txt)
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date!)
    }
}


