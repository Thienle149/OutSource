//
//  LocaleExtension.swift
//  Glowie
//
//  Created by admin on 9/3/20.
//  Copyright © 2020 Glowie. All rights reserved.
//

import UIKit

extension Locale {
    static var preferredLanguageCode: String {
        let defaultLanguage = "en"
        let preferredLanguage = preferredLanguages.first ?? defaultLanguage
        return Locale(identifier: preferredLanguage).languageCode ?? defaultLanguage
    }

    static var preferredLanguageCodes: [String] {
        return Locale.preferredLanguages.compactMap({Locale(identifier: $0).languageCode})
    }
}
