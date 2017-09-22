//
//  Consts.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/22/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation

let openWeatherIconURL: String = "http://openweathermap.org/img/w/"
let milesFactor: Float = 0.00062137

func kelvinToCelsious(temp: Float?) -> String {
    if let temp = temp {
        return String(format: "%.0f °C", temp - 273.15)
    }
    return "0"
}

func kelvin(temp: Float?) -> String {
    if let temp = temp {
        return String(format: "%.0f F", temp)
    }
    return "0"
}

func intervalToTime(interval: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(interval))
    let dayTimePeriodFormatter = DateFormatter()
    dayTimePeriodFormatter.dateFormat = "hh:mm a"
    let dateStr = dayTimePeriodFormatter.string(from: date)
    return dateStr
}
