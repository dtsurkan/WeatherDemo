//
//  SettingsUnitsCell.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/22/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import UIKit

class SettingsUnitsCell: UITableViewCell {

    lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: dynamicLocalizableString("Metric"), at: 0, animated: false)
        segment.insertSegment(withTitle: dynamicLocalizableString("Imperial"), at: 1, animated: false)
        self.contentView.addSubview(segment)
        return segment
    }()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .none
        self.selectionStyle = .none
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.localizeUI),
                                               name: NSNotification.Name(rawValue:DynamicLanguageServiceDidDetectLanguageSwitchNotificationKey),
                                               object: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        segmentControl.frame = CGRect(x: 14, y: 7, width: self.contentView.frame.size.width - 28, height: self.contentView.frame.size.height - 14)
        let appSettings = AppSettings()
        if appSettings.isMetricUnit { segmentControl.selectedSegmentIndex = 0
        } else {segmentControl.selectedSegmentIndex = 1 }
        super.layoutSubviews()
    }
    
    func fillWithDelegate(delegate: SettingsUnitsCellDelegate) {
        segmentControl.addTarget(delegate, action: #selector(delegate.segmentDidChange(segment:)), for: .valueChanged)
    }

}

// MARK: - Localizable
extension SettingsUnitsCell: Localizable {
    
    @objc func localizeUI() {
        segmentControl.setTitle(dynamicLocalizableString("Metric"), forSegmentAt: 0)
        segmentControl.setTitle(dynamicLocalizableString("Imperial"), forSegmentAt: 1)
    }
}

@objc protocol SettingsUnitsCellDelegate {
    
    @objc func segmentDidChange(segment: UISegmentedControl)
    
}
