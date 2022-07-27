//
//  Extensions.swift
//  Sngular
//
//  Created by Kristian Stefan Cortes Prieto on 27-07-22.
//

import Foundation

extension Int {
    func toString() -> String {
        return String(self)
    }
}
extension Double {
    func toString() -> String {
        return String(format: "%.1f", self)
    }
}
extension String {
    func toDegrees() -> String {
        return self + "°"
    }
    func toKmH() -> String {
        return self + " km/h"
    }
    func toPercent() -> String {
        return self + "%"
    }
    func toVisibility() -> String {
        return self + " km"
    }
    func toPressure() -> String {
        return self + " hPa"
    }
    func getDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let date = dateFormatter.date(from: self) else {
            return ""
        }
        
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let timeStamp = dateFormatter.string(from: date)
        
        return timeStamp
    }
    func getTime() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let date = dateFormatter.date(from: self) else {
            return ""
        }
        
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let timeStamp = dateFormatter.string(from: date)
        
        return timeStamp
    }
}
