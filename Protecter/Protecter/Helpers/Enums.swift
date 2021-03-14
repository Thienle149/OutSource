//
//  Enums.swift
//  FindAGift
//
//  Created by Lê Minh Thiện on 12/31/20.
//  Copyright © 2020 Lê Minh Thiện. All rights reserved.
//

import Foundation
import UIKit

enum ScreenApp: String {
    // Login
    case login = "LoginVC"
    case forgetPassword = "ForgetPasswordVC"
    case newPassword = "NewPasswordVC"
    case otpRegisterVC = "OTPRegisterVC"
    case register = "RegisterVC"
    case setUpPassword = "SetUpPasswordVC"
    // Home
    case home = "HomeVC"
    case menu = "MenuVC"
    case team = "TeamVC"
    case problem = "ProblemVC"
    case reportProblem = "ReportProblemVC"
    case state = "StateVC"
    case stateProtect = "StateProtectVC"
    case patrol = "PatrolVC"
    case module = "ModuleVC"
    
    // Others
    case notify = "NotifyVC"
    case calendar = "CalendarVC"
    
    func getStoryboard() -> String {
        // Login
        if(self == .login || self == .register || self == .forgetPassword || self == .newPassword || self == .otpRegisterVC || self == .setUpPassword) {
            return "Login"
        }
        // Home
        else if(self == .home || self == .menu || self == .team || self == .problem || self == .reportProblem || self == .state || self == .stateProtect || self == .patrol || self == .module) {
            return "Home"
        }
        // Other
        else if(self == .notify || self == .calendar) {
            return "Others"
        }
        
        return ""
    }
}


// MARK: Error
enum ErrorLogin: String {
    case email = "Email không hợp lệ"
    case phone = "Phone không hợp lệ"
    case password = "Vui lòng nhập password"
    case notSuccess = "Tài khoản không chính xác"
}

enum ErrorSystem: String {
    case error1001 = "Lỗi hệ thống"
    case error1002 = "Lỗi url không hợp lệ"
    
    func getCode() -> String {
        switch self {
        case .error1001:
            return "\(1)"
        case .error1002:
            return "\(2)"
        }
    }
}

enum ErrorApp: String {
    // ReportProblem
    case error10001 = "Vui lòng chọn dầy đủ thông tin"
}

enum TypeLog: String {
    case know = "🟢"
    case firebase = "🟠"
    case unknow = "🔴"
}

enum RoleUser: Int {
    case admin = 1
    case contractor = 2
    case lead_protecter = 3
    case protecter = 4
    
    func getModule() -> [ModuleModel] {
        
        let modules = Contants.allModules
        
        switch self {
        case .admin:
            return [modules[0], modules[1], modules[2], modules[3], modules[4], modules[5]]
        case .contractor:
            return [modules[0], modules[1], modules[2], modules[3], modules[4], modules[5]]
        case .lead_protecter:
            return [modules[0], modules[1], modules[2], modules[3], modules[4], modules[5]]
        case .protecter:
            return [modules[0], modules[1], modules[4], modules[6]]
        }
    }
}

enum StatusTimeKeeping: String {
    case inShift = "Đã vào ca"
    case notInShift = "Chưa vào ca"
    case soonOutShift = "Ra ca sớm"
    case lateInShift = "Vào ca trễ"
    case errorInShift = "Vào ca lỗi"
    case errorCheckIn = "Điểm danh lỗi"
    case errorOutShift = "Ra ca lỗi"
    case notCheckIn = "Chưa điểm danh"
    case noCheckInt = "Không điểm danh"
    
    // Return color1: background, color2: textColor
    func getButtonColor() -> (UIColor, UIColor) {
        switch self {
        case .inShift:
            return (UIColor(hexString: "#ACEDAB"), UIColor(hexString: "#23874B"))
        case .notInShift:
            return (UIColor(hexString: "#ACEDAB"), UIColor(hexString: "#9D9D9D"))
        case .noCheckInt:
            return (UIColor(hexString: "#E74C3C"), UIColor(hexString: "#FFFFFF"))
        default: do {
            return (UIColor(hexString: "#D3B307"), UIColor(hexString: "#FCF3C6"))
        }
        }
    }
}

enum StatusProblem: String{
    case new = "Mới khởi tạo"
    case applied = "Đã xác nhập"
    case handled = "Đã xử lý"
    
    func getButtonColor() -> (UIColor, UIColor) {
        switch self {
        case .new:
            return (UIColor(hexString: "#EABEBE"), UIColor(hexString: "#F41313"))
        case .applied:
            return (UIColor(hexString: "#FCF89F"), UIColor(hexString: "6B6D0A"))
        case .handled:
            return (UIColor(hexString: "#ACEDAB"), UIColor(hexString: "23874B"))
        }
    }
}

enum MediaType {
    case image
    case audio
}

enum PatrolState {
    case active
    case notActive
    
    func getImage() -> UIImage {
        switch self {
        case .active:
            return UIImage(systemName: "play.fill")!
        case .notActive:
            return UIImage(systemName: "pause.fill")!
        }
    }
}
