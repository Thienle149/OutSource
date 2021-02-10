//
//  FormatterExtension.swift
//  Glowie
//
//  Created by admin on 12/13/19.
//  Copyright © 2019 Glowie. All rights reserved.
//

import UIKit

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension NSDecimalNumber {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}

extension Int {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
    
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
