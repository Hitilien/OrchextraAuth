//
//  AuthResponse.swift
//  RESTApiCall
//
//  Created by macpro.javier.garcia on 7/20/17.
//  Copyright © 2017 Alejandro Vargas. All rights reserved.
//

import Foundation

public class AuthResponse: BaseResponse {
    
    public var access: Access?
    
    override init() {
        super.init()
    }
    
    override init(json: JSON) {
        super.init(json: json)
        
        if let json = json as? JSONDictionary, let userData = json["data"] {
            access = Access.decode(userData)
        }
    }
    
}
