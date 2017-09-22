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
    
    // MARK: - Init/Deinit
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
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
    
}

// MARK: - Localizable
extension ForecastHeaderView: Localizable {
    
    @objc func localizeUI() {
        dayLabel.text = dynamicLocalizableString(dayLabel.text!.lowercased()).uppercased()
    }
}
