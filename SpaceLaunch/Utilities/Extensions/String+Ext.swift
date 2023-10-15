//
//  String+Ext.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation


extension String {
    func utcToLocal(format: String = "MM-yyyy HH:mm") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = Locale(identifier: "tr_TR")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = format
            dateFormatter.timeZone = TimeZone.current
            return dateFormatter.string(from: date)
        } else { return nil }
    }
}
