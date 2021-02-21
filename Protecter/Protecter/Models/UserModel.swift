//
//  UserModel.swift
//  Protecter
//
//  Created by Lê Minh Thiện on 1/21/21.
//

import Foundation
class UserModel {
    var userID: Int!
    var userName: String!
    var phone: String!
    var password: String!
    var tokenID: String?
    var role: RoleUser!
    
    init(dict: [String: Any?]) {
        self.userID = dict["userID"] as? Int ?? -1
        self.userName = dict["userName"] as? String ?? ""
        self.phone = dict["phone"] as? String ?? ""
        self.password = dict["password"] as? String ?? ""
        self.tokenID = dict["tokenID"] as? String
        self.role = self.getRole(dict: dict)
    }
    
    init(userID: Int, userName: String, password: String, tokenID: String, role: RoleUser) {
        self.userID = userID
        self.userName = userName
        self.password = password
        self.tokenID = tokenID
        self.role = role
    }
    
    private func getRole(dict: [String: Any?]) -> RoleUser{
        let role = dict["roleUser"] as? Int ?? 0
        switch role {
        case 1:
            return .admin
        case 2:
            return .contractor
        case 3:
            return .lead_protecter
        default:
            return .protecter
        }
    }
}
