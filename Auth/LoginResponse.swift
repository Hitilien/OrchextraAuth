//
//  LoginResponse.swift
//  Auth
//
//  Created by macpro.javier.garcia on 7/24/17.
//  Copyright © 2017 macpro.javier.garcia. All rights reserved.
//

import Foundation


public struct UserLogin: JSONDecodable {
    static func decode(_ json: JSON) -> UserLogin? {
        return nil;
    }
}

public struct Project: JSONDecodable {
    
    var name: String
    var users: [UserLogin]?
    var id: String
    
    static func decode(_ json: JSON) -> Project? {
        
        guard let json = json as? JSONDictionary else {
            return nil;
        }
        
        let name = json["name"] as? String ?? ""
        let id = json["id"] as? String ?? ""
        let project: Project?
        project = Project(name: name, users: nil, id: id)
        
        return project
    }
    
}


public enum Role {
  
    case superAdmin
    case unknown
    
    static func decode(string: String) -> Role?{
    
        let result: Role
        switch string.lowercased() {
        case "superadmin":
            result = .superAdmin
        default:
            result = .unknown
        }
        return result;
    }
    
}


public struct Login: JSONDecodable {

    var languageCode: String
    
    var role: String
    
    var password: String
    
    var email: String
    
    var name: String
    
    var username: String
    
    var updateAt: String
    
    var createAt: String
    
    var roles: [Role]
    
    var projects: [Project]
    
    var id: String
    
    var access: Access
    
    
    static func decode(_ json: JSON) -> Login? {

        var result: Login
        guard let jsonData = json as? JSONDictionary, let data = jsonData["data"] as? JSONDictionary else {
            return nil
        }
        
        let languageCode: String = data["languageCode"] as? String ?? ""
        let role: String = data["role"] as? String ?? ""
        let password: String = data["password"] as? String ?? ""
        let email: String = data["email"] as? String ?? ""
        let name: String = data["name"] as? String ?? ""
        let username: String = data["username"] as? String ?? ""
        
        let updatedAt: String = data["updatedAt"] as? String ?? ""
        let createdAt: String = data["createdAt"] as? String ?? ""
        
        let roles: [Role]
        if let rawRoles = data["roles"] as? [String] {
            roles = rawRoles.flatMap { Role.decode(string:$0) }
        }else{
            roles = []
        }
        
        let projects: [Project]
        if let rawProjects = data["projects"] as? [JSON] {
            projects = rawProjects.flatMap { Project.decode($0) }
        }else{
            projects = []
        }
        
        let id: String = data["id"] as? String ?? ""
        let access: Access
        if let rawAccess = data["access"] {
            access = Access.decode(rawAccess) ?? Access(token: "", expireIn: "")
        }else{
            access = Access(token: "", expireIn: "")
        }
        
        result = Login(languageCode: languageCode, role: role, password: password, email: email, name: name, username: username, updateAt: updatedAt, createAt: createdAt, roles: roles, projects: projects, id: id, access: access)
        
        
        return result;
        
    }
}

public class LoginResponse: BaseResponse {
    
    public var user: Login?
    
    override init() {
        super.init()
    }
    
    override init(json: JSON) {
        super.init(json: json)
        user = Login.decode(json)
    }
    
}
