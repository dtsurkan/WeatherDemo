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
        windLabel.text = String(displayWeather.weather.wind.speed) + " m/s"
        visibilityLabel.text = String(displayWeather.weather.visibility) + " m"
        temparatureLabel.text = kelvinToCelsious(temp: displayWeather.weather.main.temp)
        mistLabel.text = displayWeather.weather.weather.first?.main
        sunriseTimeLabel.text = intervalToTime(interval: displayWeather.weather.sys.sunrise!)
        sunsetTimeLabel.text = intervalToTime(interval: displayWeather.weather.sys.sunset!)
       
        
        let imageURL = URL(string: openWeatherIconURL+(displayWeather.weather.weather.first?.icon)! + ".png")
        imageView.pin_setImage(from: imageURL)
    }
}
