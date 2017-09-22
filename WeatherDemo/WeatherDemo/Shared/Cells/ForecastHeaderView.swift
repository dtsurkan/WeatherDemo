//
//  ForecastHeaderView.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/21/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import UIKit

final class ForecastHeaderView: UICollectionViewCell {
    
    @IBOutlet private weak var dayLabel: UILabel!
    
    var day: String? {
        get {
            return dayLabel.text
        }
        set {
            dayLabel.text = newValue
        }
    }
    
}
