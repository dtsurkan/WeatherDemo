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
    
    // MARK: - Properties
    
    var displayWeather: Main.CurrentWeaher.ViewModel.DisplayedWeather?
    
    // MARK: - Outlets
    
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var temparatureLabel: UILabel!
    @IBOutlet weak var mistLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var visibilityTitleLabel: UILabel!
    @IBOutlet weak var windTitleLabel: UILabel!
    
    
    // MARK: - deinit
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.localizeUI),
                                               name: NSNotification.Name(rawValue:DynamicLanguageServiceDidDetectLanguageSwitchNotificationKey),
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Methods
    
    func fillIn(displayWeather: Main.CurrentWeaher.ViewModel.DisplayedWeather) {
        self.displayWeather = displayWeather
        let appSettings = AppSettings()
        if !appSettings.isImperialUnit {
            windLabel.text = String(displayWeather.weather.wind.speed) + " " +  dynamicLocalizableString("m/s")
            visibilityLabel.text = String(displayWeather.weather.visibility) + " " + dynamicLocalizableString("m")
            temparatureLabel.text = kelvinToCelsious(temp: displayWeather.weather.main.temp)
        } else {
            windLabel.text = String(displayWeather.weather.wind.speed * milesFactor) + " " + dynamicLocalizableString("miles/h")
            visibilityLabel.text = String(displayWeather.weather.visibility * milesFactor) + " " + dynamicLocalizableString( "miles")
            temparatureLabel.text = kelvin(temp: displayWeather.weather.main.temp)
        }
        
        mistLabel.text =  NSLocalizedString((displayWeather.weather.weather.first?.main)!, comment: "") 
        sunriseTimeLabel.text = intervalToTime(interval: displayWeather.weather.sys.sunrise!)
        sunsetTimeLabel.text = intervalToTime(interval: displayWeather.weather.sys.sunset!)
        let imageURL = URL(string: openWeatherIconURL+(displayWeather.weather.weather.first?.icon)! + ".png")
        imageView.pin_setImage(from: imageURL)
        sunriseLabel.text = dynamicLocalizableString("Sunrise:")
        sunsetLabel.text = dynamicLocalizableString("Sunset:")
        visibilityTitleLabel.text = dynamicLocalizableString("Visibility:")
        windTitleLabel.text = dynamicLocalizableString("Wind:")
    }
}

// MARK: - Localizable
extension HeaderView: Localizable {
    
    @objc func localizeUI() {
        let appSettings = AppSettings()
        if !appSettings.isImperialUnit {
            windLabel.text = String(describing: displayWeather?.weather.wind.speed) + " " +  dynamicLocalizableString("m/s")
            visibilityLabel.text = String(describing: displayWeather?.weather.visibility) + " " + dynamicLocalizableString("m")
        } else {
            windLabel.text = String((displayWeather?.weather.wind.speed)! * milesFactor) + " " + dynamicLocalizableString("miles/h")
            visibilityLabel.text = String((displayWeather?.weather.visibility)! * milesFactor) + " " + dynamicLocalizableString("miles")
        }
        
        mistLabel.text =  dynamicLocalizableString((displayWeather?.weather.weather.first?.main)!)
        sunriseLabel.text = dynamicLocalizableString("Sunrise:")
        sunsetLabel.text = dynamicLocalizableString("Sunset:")
        visibilityTitleLabel.text = dynamicLocalizableString("Visibility:")
        windTitleLabel.text = dynamicLocalizableString("Wind:")
    }
}
