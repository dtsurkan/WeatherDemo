//
//  Weather.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/21/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation

struct WeatherModel: Decodable {
    var name: String
    var id: Int
    var dt: Int
    var cod: Int
    var base: String
    var visibility: Int
    var clouds: Clouds
    var rain: Rain?
    var wind: Wind
    var main: WeatherMain
    var weather: [Weather]
    var sys: Sys
    var coord: Coordinates
}

struct Sys: Decodable {
    var country: String?
    var sunrise: Int?
    var sunset: Int?
    var pod: String?
}

struct Weather: Decodable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
//    var iconURL: String = "http://openweathermap.org/img/w"
}

struct WeatherMain: Decodable {
    var temp: Float?
    var humidity: Float?
    var pressure: Float?
    var tempMin: Float?
    var tempMax: Float?
    var grndLevel: Float?
    var seaLevel: Float?
    var tempKf: Float
    
    enum CodingKeys : String, CodingKey {
        case temp
        case humidity
        case pressure
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case grndLevel = "grnd_level"
        case seaLevel = "sea_level"
        case tempKf = "temp_kf"
    }
}

struct Wind: Decodable {
    var speed: Float
    var deg: Float?
}

struct Rain: Decodable {
    var h: Int?
    
    enum CodingKeys : String, CodingKey {
        case h = "3h"
    }
}

struct Clouds: Decodable {
    var all: Int
}

struct Coordinates: Decodable {
    var lon: Double
    var lat: Double
}


