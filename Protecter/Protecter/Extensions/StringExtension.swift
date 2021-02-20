//
//  StringExtension.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 2/20/21.
//

import Foundation

extension String {
    var isPhoneNumber: Bool {
        
        if self.count != 10 {
            return false
        }
        
        let allowedCharacters = CharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: allowedCharacters)
        let filtered = inputString.joined(separator: "")
        return self == filtered
        
    }
}
