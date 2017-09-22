//
//  HeaderView.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/22/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import UIKit
import PINRemoteImage

class HeaderView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var temparatureLabel: UILabel!
    @IBOutlet weak var mistLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Methods
    
    func fillIn(displayWeather: Main.CurrentWeaher.ViewModel.DisplayedWeather) {
        let appSettings = AppSettings()
        if !appSettings.isImperialUnit {
            windLabel.text = String(displayWeather.weather.wind.speed) + " " +  NSLocalizedString("m/s", comment: "")
            visibilityLabel.text = String(displayWeather.weather.visibility) + " " + NSLocalizedString("m", comment: "")
            temparatureLabel.text = kelvinToCelsious(temp: displayWeather.weather.main.temp)
        } else {
            windLabel.text = String(displayWeather.weather.wind.speed * milesFactor) + " " + NSLocalizedString("miles/h", comment: "")
            visibilityLabel.text = String(displayWeather.weather.visibility * milesFactor) + " " + NSLocalizedString( "miles", comment: "")
            temparatureLabel.text = kelvin(temp: displayWeather.weather.main.temp)
        }
        
        
        mistLabel.text =  NSLocalizedString((displayWeather.weather.weather.first?.main)!, comment: "") 
        sunriseTimeLabel.text = intervalToTime(interval: displayWeather.weather.sys.sunrise!)
        sunsetTimeLabel.text = intervalToTime(interval: displayWeather.weather.sys.sunset!)
       
        
        let imageURL = URL(string: openWeatherIconURL+(displayWeather.weather.weather.first?.icon)! + ".png")
        imageView.pin_setImage(from: imageURL)
    }
}
