//
//  DateExtension.swift
//  Glowie
//
//  Created by admin on 11/7/19.
//  Copyright © 2019 Glowie. All rights reserved.
//

import Foundation

enum EndInValue {
    case hour
    case day
}

extension Date {
    private func getEndInValue(_ value: EndInValue) -> Int {
        let calendar = Calendar(identifier: .gregorian)
        let now = Date()
        let earlyDate = now < self ? now : self
        let laterDate = now >= self ? now : self
        switch value {
        case .hour:
            let components = calendar.dateComponents([.hour], from: earlyDate, to: laterDate)
            return components.hour ?? 0
        case .day:
            let components = calendar.dateComponents([.day], from: earlyDate, to: laterDate)
            return components.day ?? 0
        }
    }
    
    func getEndInDayValue() -> Int {
        return getEndInValue(.day)
    }
    
    func getEndInHourValue() -> Int {
        return getEndInValue(.hour)
    }
    
    func getMiliseconds() -> Int {
        let since1970 = self.timeIntervalSince1970
        return Int(since1970 * 1000)
    }
}
