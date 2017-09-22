//
//  DateExtentions.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/22/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation

extension Date: Comparable {
    public static func <(a: Date, b: Date) -> Bool{
        return a.compare(b) == ComparisonResult.orderedAscending
    }
    static public func ==(a: Date, b: Date) -> Bool {
        return a.compare(b) == ComparisonResult.orderedSame
    }
}

