//
//  Date+FormattedDateStrings.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 11/02/24.
//

import Foundation

extension Date {
    var integerBasedDayOfWeek: Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)

        var adjustedWeekday = weekday - calendar.firstWeekday
        if adjustedWeekday < 0 {
            adjustedWeekday += 7
        }

        return adjustedWeekday
    }

    var current24HourTimeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}
