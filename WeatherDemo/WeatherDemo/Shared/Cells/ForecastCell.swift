//
//  ForecastCell.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/21/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import UIKit
import PINRemoteImage

final class ForecastCell: UICollectionViewCell {
    
    let separator: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor(red: 200/255.0, green: 199/255.0, blue: 204/255.0, alpha: 1).cgColor
        return layer
    }()
    
    lazy var cloudsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 15, y: (self.contentView.bounds.size.height - 20) / 2, width: 30, height: 20)
        self.contentView.addSubview(imageView)
        return imageView
    }()
    
    lazy var time: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.textColor = .black
        label.frame = CGRect(x: 60, y: (self.contentView.bounds.size.height - 30) / 2, width: 120, height: 30)
        label.textAlignment = .left
        self.contentView.addSubview(label)
        return label
    }()
    
    lazy var weatherData: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.textColor = UIColor(red: 111/255, green: 110/255, blue: 115/255, alpha: 1)
        label.frame = CGRect(x: self.contentView.bounds.size.width/2, y: (self.contentView.bounds.size.height - 30) / 2, width: self.contentView.bounds.size.width/2 - 15, height: 30)
        label.textAlignment = .right
        self.contentView.addSubview(label)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.addSublayer(separator)
        contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = contentView.bounds
        let height: CGFloat = 0.5
        let left: CGFloat = 15.0
        separator.frame = CGRect(x: left, y: bounds.height - height, width: bounds.width - left, height: height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cloudsImageView.image = nil
    }
    
    // MARK: - Public methods
    
    func fillWithForecastItem(item: ForecastItem?) {
        let imageURL = URL(string: openWeatherIconURL+(item?.weather.first?.icon)! + ".png" )
        cloudsImageView.pin_setImage(from: imageURL)
        time.text = item?.time
        let appSettings = AppSettings()
        if !appSettings.isImperialUnit {
            weatherData.text = NSLocalizedString((item?.weather.first?.main)!, comment: "") + " " + kelvinToCelsious(temp: item?.main.temp)
        } else {
            weatherData.text = NSLocalizedString((item?.weather.first?.main)!, comment: "")  + " " + kelvin(temp: item?.main.temp)
        }
        
    }
}
