//
//  User.swift
//  RESTApiCall
//
//  Created by macpro.javier.garcia on 7/21/17.
//  Copyright © 2017 Alejandro Vargas. All rights reserved.
//

import Foundation


/// User
struct User {
    
    public let token: String
    
    public let expireIn: String
    
    static func create(_ token: String, _ expireIn: String) -> User {
        return User(token: token, expireIn: expireIn)
    }

}

// MARK: - JSONDecodable
extension User: JSONDecodable {

    static func decode(_ json: JSON) -> User? {
        
        if let json = json as? JSONDictionary {
            
            if let token = json["token"]  as? String, let expiresIn = json["expiresIn"] as? String {
                let user = User.create(token, expiresIn)
                return user
            }
        }
        
        return nil;
    }

}

// MARK: - CustomStringConvertible
extension User: CustomStringConvertible {

    var description: String{
        return "Token: \(token) \nExpires in: \(expireIn)"
    }
}
