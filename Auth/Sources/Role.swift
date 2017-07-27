//
//  Role.swift
//  Auth
//
//  Created by macpro.javier.garcia on 7/25/17.
//  Copyright © 2017 macpro.javier.garcia. All rights reserved.
//

import Foundation

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
