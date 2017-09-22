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
        segment.insertSegment(withTitle: "Metric", at: 0, animated: false)
        segment.insertSegment(withTitle: "Imperial", at: 1, animated: false)
        segment.selectedSegmentIndex = 0
        self.contentView.addSubview(segment)
        return segment
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .none
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        segmentControl.frame = CGRect(x: 14, y: 7, width: self.contentView.frame.size.width - 28, height: self.contentView.frame.size.height - 14)
        super.layoutSubviews()
    }
    
    func fillWithDelegate(delegate: SettingsUnitsCellDelegate) {
        segmentControl.addTarget(delegate, action: #selector(delegate.segmentDidChange(segment:)), for: .valueChanged)
    }

}

@objc protocol SettingsUnitsCellDelegate {
    
    @objc func segmentDidChange(segment: UISegmentedControl)
    
}
