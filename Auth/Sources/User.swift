//
//  User.swift
//  RESTApiCall
//
//  Created by macpro.javier.garcia on 7/21/17.
//  Copyright © 2017 Alejandro Vargas. All rights reserved.
//

import Foundation


/// User
public struct Access: CustomStringConvertible {
    
    public let token: String
    
    public let expireIn: String
    
    static func create(_ token: String, _ expireIn: String) -> Access {
        return Access(token: token, expireIn: expireIn)
    }

    // MARK: - CustomStringConvertible
    public var description: String{
        return "Token: \(token) \nExpires in: \(expireIn)"
    }

}

// MARK: - JSONDecodable
extension Access: JSONDecodable {

    static func decode(_ json: JSON) -> Access? {
        
        if let json = json as? JSONDictionary {
            
            if let token = json["token"]  as? String, let expiresIn = json["expiresIn"] as? String {
                let user = Access.create(token, expiresIn)
                return user
            }
        }
        
        return nil;
    }

}


