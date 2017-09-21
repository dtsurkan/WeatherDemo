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
}


