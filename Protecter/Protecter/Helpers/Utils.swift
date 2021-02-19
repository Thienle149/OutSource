//
//  Utils.swift
//  FindAGift
//
//  Created by Lê Minh Thiện on 12/31/20.
//  Copyright © 2020 Lê Minh Thiện. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    //     MARK: Storyboard
    static func storyboary<T: UIViewController>(screen: ScreenApp, asClass: T.Type) -> T {
        return (UIStoryboard(name: screen.getStoryboard(), bundle: .main).instantiateViewController(screen: screen) as? T)!
    }
    
    // MARK: Constraint
    static func setConstraintFull(with view: UIView, parent: UIView ) {
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 0).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
    }
    
    static let FORMAT_DATE_NOW: String = "yyyy-MM-dd"
    static let FORMAT_DATE_FIREBASE: String = "dd-MM-yyyy"
    static let FORMAT_MONTH: String = "LLLL"
    static let FORMAT_DATE_WEEK: String = "EEEE"
    
    static func convertDateToString(date: Date, format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: date)
    }
    
    static func convertStringToDate(string: String, format: String) -> Date {
        let df = DateFormatter()
        df.dateFormat = format
        return df.date(from: string)!
    }
    
    static func getCurrentDate(format: String) -> String {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = format
        let dateString = df.string(from: date)
        return dateString.uppercased()
    }
    
    static func getStringFIRDate(date: Date) -> String {
        return Utils.convertDateToString(date: date, format: Utils.FORMAT_DATE_FIREBASE)
    }
    
    static func getStrCurrentDate() -> String {
        let date = Date()
        return Utils.convertDateToString(date: date, format: Utils.FORMAT_DATE_FIREBASE)
    }
    
    static func phoneRuleFirebase(_ phone: String) -> String {
        var phoneTemp = phone
        phoneTemp = String(phoneTemp.dropFirst())
        return "+84\(phoneTemp)"
    }
    
    static func log(with text: String?, type: TypeLog = .unknow) {
        if let logText = text {
            print("\(type.rawValue) \(logText)")
        }
    }
    
    static func setShadowCell(backgroundView: UIView) {
        backgroundView.layer.cornerRadius = 5.0
        
        //To apply border
        backgroundView.layer.borderWidth = 0.5
        backgroundView.layer.borderColor = UIColor.white.cgColor
        
        //To apply Shadow
        backgroundView.layer.shadowOpacity = 0.2
        backgroundView.layer.shadowRadius = 3.0
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 3) // Use any CGSize
        backgroundView.layer.shadowColor = UIColor.black.cgColor
    }
    
    static func readFileJson(fileName: String, completion: @escaping(([String: Any?]) -> Void)) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let json = jsonResult as? [String: Any]{
                    completion(json)
                }
            } catch {
                // handle error
            }
        }
    }
    
}
